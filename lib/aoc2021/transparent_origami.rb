module Aoc2021
  class TransparentOrigami
    attr_reader :board
    attr_reader :instructions

    def initialize origami=[]
      @x_max = 0
      @y_max = 0
      @coordinates, @instructions = origami.inject([[],[]]) do |memo, text|
        if text.include? ','
          x, y = text.split(',').map(&:to_i)
          @x_max = x if @x_max < x
          @y_max = y if @y_max < y
          memo[0].append [x, y]
        elsif text.include? 'fold along'
          axis, extent = text.split(' ')[2].split '='
          memo[1].append [axis.to_sym, extent.to_i]
        else
          pp "OOPS Cannot understand #{text}"
        end
        memo
      end
      @board = {
        x_max:  @x_max.freeze,
        y_max:  @y_max.freeze,
        chart:  @coordinates.freeze,
      }
    end

    def first_fold
      axis, extent = @instructions[0]
      TransparentOrigami.send(axis, @board, extent)
    end

    def fold_all
      @instructions.inject(@board) do |paper, seam|
        axis, extent = seam
        TransparentOrigami.send(axis, paper, extent)
      end
    end

    def self.x board, extent
      {
        x_max:  extent-1,
        y_max:  board[:y_max],
        chart:  \
          board[:chart].map do |point|
            x, y = point
            if x < extent
              [x, y]
            else
              [(2*extent)-x, y]
            end
          end.uniq
      }
    end

    def self.y board, extent
      {
        x_max:  board[:x_max],
        y_max:  extent-1,
        chart:  \
          board[:chart].map do |point|
            x, y = point
            if y < extent
              [x, y]
            else
              [x, (2*extent)-y]
            end
          end.uniq
      }
    end

    def self.dump board
      blank_slate = Array.new(1+board[:y_max]) {
        '.' * (1+board[:x_max])
      }
      board[:chart].inject(blank_slate) do |memo, coordinate|
        x, y = coordinate
        memo[y][x] = '#'
        memo
      end
    end

  end
end
