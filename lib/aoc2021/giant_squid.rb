module Aoc2021
  class GiantSquid
    attr_reader :lottery
    attr_reader :dimension
    attr_reader :boards
    attr_reader :winners

    def initialize layout=[]
      @lottery = layout.shift.split(',').map(&:to_i) # this is the first row; read and remove

      # bingo boards are square, so I don't need empty lines as board separators
      # this is a HUGE assumption derived only from _my practice_ of stripping out empty lines
      layout.reject!(&:empty?)  # unecessary, yeah, but now it's def known

      # bingo boards are square, so their heights equal their widths
      @dimension = layout[0].split(' ').length

      # grab @dimension @dimension-sized lines at a time
      @boards = layout.each_slice(@dimension).inject([]) do |memo, board|
        memo << BingoBoard.new(board)
        memo
      end

      @winners = @lottery.inject([]) do |winlist, number|
        anybody = @boards.inject([]) do |winners, board|
          unless board.winner?  # still in the running
            board.place number  # can this be the one?
            if board.winner?    # just won on this board
              score = board.sum_unmarked
              winners.push [score, number]
            end
          end
          winners
        end
        winlist.push *anybody unless anybody.empty?
        winlist
      end
    end

    def unmarked_products
      @winners.map do |winner|
        winner[0] * winner[1]
      end
    end

  end
end
