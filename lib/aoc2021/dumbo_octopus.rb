module Aoc2021
  class DumboOctopus
    attr_reader :consortium

    def initialize consortium=[]
      @consortium = consortium.map do |line|
        line.each_char.map(&:to_i)
      end.freeze

      @x_dimension = consortium[0].length
      @y_dimension = consortium.length
      @x_max = @x_dimension - 1
      @y_max = @y_dimension - 1
    end

    # column-major foxtrottery again
    def self.octopus consortium, x, y; consortium[y][x]; end

    # make a list of neighbors of energized octopusses;
    # will need to be run until there are no more (?)
    # direct coordinates (side-effects) only
    def outbreak consortium
      (0..@y_max).inject([]) do |q, y|
        (0..@x_max).each do |x|
          unless consortium[y][x] < 10
            consortium[y][x] = 0
            if y.zero?       # nothing above
              if x.zero?        # upper left
                qq = [1, 0], [1, 1], [0, 1]
              elsif x == @x_max # upper right
                qq = [x-1, 0], [x-1, 1], [x, 1]
              else              # top row
                qq = [x-1, 0], [x-1, 1], [x, 1], [x+1, 1], [x+1, 0]
              end
            elsif y == @y_max   # nothing below
              if x.zero?        # lower left
                qq = [0, y-1], [1, y-1], [1, y]
              elsif x == @x_max # lower right
                qq = [x-1, y], [x-1, y-1], [x, y-1]
              else              # lower row
                qq = [x-1, y], [x-1, y-1], [x, y-1], [x+1, y-1], [x+1, y]
              end
            else                # above and below
              if x.zero?        # left column
                qq = [0, y-1], [1, y-1], [1, y], [1, y+1], [0, y+1]
              elsif x == @x_max # right column
                qq = [x, y-1], [x-1, y-1], [x-1, y], [x-1, y+1], [x, y+1]
              else              # in the deep
                qq = [x-1, y-1], [x-1, y], [x-1, y+1],
                  [x, y-1],   [x, y+1],
                  [x+1, y-1], [x+1, y], [x+1, y+1]
              end
            end
            q += qq
          end
        end
        q
      end
    end

    def flash consortium
      loop do
        affected = outbreak consortium
        affected.each do |octopus|
          x, y = octopus
          consortium[y][x] += 1 unless consortium[y][x].zero?
        end
        break if affected.empty?
      end
      consortium
    end

    def zero consortium
      consortium.inject([]) do |memo, y|
        memo << y.map do |o|
          o < 10 ? o : 0
        end
      end
    end

    def flash_count iterations=3
      flashes = 0
      (1..iterations).inject(@consortium) do |grid, iteration|
        prochain = zero flash DumboOctopus.energize grid
        flashed = prochain.inject(0) do |accumulator, y|
          y.each do |octopus|
            accumulator += 1 if octopus.zero?
          end
          accumulator
        end
        flashes += flashed
        prochain
      end
      flashes
    end

    def synchronized
      iteration = 0
      consortium = @consortium
      loop do
        consortium = zero flash DumboOctopus.energize consortium
        iteration += 1
        break if DumboOctopus.synchronized? consortium
      end
      iteration
    end

    # increment each animal's energy
    def self.energize consortium
      consortium.map do |y|
        y.inject([]) do |row, x|
          row << (x + 1)
          row
        end
      end
    end

    def self.synchronized? consortium
      consortium.each do |y|
        y.each do |octopus|
          return false unless octopus.zero?
        end
      end
      true
    end

    def self.poct consortium
      consortium.map do |row|
        row.map do |oct|
          oct.zero? ? Aoc2021.shine(oct) : oct
          (1..9).include?(oct) ? oct: Aoc2021.shine(oct.to_s(16))
        end.join ''
      end
    end
  end
end
