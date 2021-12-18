module Aoc2021
  class BingoBoard
    attr_reader :score
    attr_reader :winner

    def initialize layout=[]

      # bingo boards are square, so their heights equal their widths
      @dimension = layout[0].split(' ').length

      # hz bingo are @dimension-aligned all-ones
      @row_mask = (2 ** @dimension) - 1

      # v bingo are @dimension-aligned position-equal bits
      @column_mask = (0...@dimension).inject(0) do |memo, bit|
        memo |= (1 << (@dimension * bit))
      end

      # board starts out with a constant map of its numbers and an empty integer
      # bitfield mapping to each occupied index.
      # Check for a row by inspecting sequences of consecutive bits (-1 in n-complement)
      # Check for a column by sliding a window of bits across one row
      # 1000_1000_1100_1011 means that a shot of 1000100010001000 will hit the first time
      # * . . .
      # * . . .
      # * * . .
      # * * . *
      #
      # 1010_0010_1110_1010 means that a shot of 1000100010001000 will hit the third time
      # * . * .
      # . . * .
      # * * * .
      # * . * *

      @board = layout.join(' ').split(' ').map(&:to_i).freeze
      @lookups = @board.each_index.inject({}) do |memo, value|
        memo[@board[value]] = value
        memo
      end.freeze
      @winner = false

      reset!
    end

    def reset!
      @marked = 0
      @score = 0  # thankfully, there's no way a winning board, once won, can score to zero
    end

    def final_score; @score * @winner; end

    def winner?; @winner; end

    def place number
      if not @winner and @lookups.keys.include? number
        @marked |= (1 << @lookups[number])
        # detect victory ...
        (0...@dimension).each do |bitshift|
          # ... horizontally
          mask = @row_mask << (bitshift * @dimension)
          if (mask & @marked) == mask
            @winner = true
            break
          end
          # ... vertically
          mask = @column_mask << bitshift
          if (mask & @marked) == mask
            @winner = true
            break
          end
        end
      end
      @winner
    end

    def sum_unmarked
      @board.each_index.inject(0) do |memo, bit|
        if (@marked & (1 << bit)).zero?
          memo += @board[bit]
        end
        memo
      end
    end

  end
end
