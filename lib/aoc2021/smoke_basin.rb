module Aoc2021
  class SmokeBasin
    attr_reader :report

    def initialize report=[]
      @report = report.map do |line|
        line.each_char.map(&:to_i)
      end.freeze

      @x_dimension = @report[0].length
      @y_dimension = @report.length
      @x_max = @x_dimension - 1
      @y_max = @y_dimension - 1
    end

    # column-major coordinates broke me brain
    def heightmap(x, y); @report[y][x]; end

    # return the neighbors one step taller than I, but nines don't count
    # ... or, if I'm at or over eight, nobody can be
    def taller me, *neighbors
      if me < 8
        neighbors.filter do |neighbor|
          (me + 1) == heightmap(*neighbor)
        end
      else
        []
      end
    end

    # return all the neighbors one-taller than this point
    def climbing_out x, y
      center = heightmap(x, y)
    # puts "> #{x}:#{y} CLIMBING OUT FROM #{center}"
      follow =
        if y.zero?          # nothing above
          if x.zero?        # upper left
            taller center, [1, 0], [0, 1]
          elsif x == @x_max # upper right
            taller center, [x-1, 0], [x, 1]
          else              # top row
            taller center, [x-1, 0], [x, 1], [x+1, 0]
          end
        elsif y == @y_max   # nothing below
          if x.zero?        # lower left
            taller center, [1, y], [0, y-1]
          elsif x == @x_max # lower right
            taller center, [x-1, y], [x, y-1]
          else              # lower row
            taller center, [x-1, y], [x, y-1], [x+1, y]
          end
        else                # above and below
          if x.zero?        # left column
            taller center, [x, y-1], [x+1, y], [x, y+1]
          elsif x == @x_max # right column
            taller center, [x, y-1], [x-1, y], [x, y+1]
          else              # in the deep
            taller center, [x-1, y], [x, y-1], [x+1, y], [x, y+1]
          end
        end
    # puts "- #{x}:#{y} Neighbors one-taller than #{center} at [#{x}, #{y}] are #{follow}"
      hoser = follow.inject([]) do |memo, neighbor|
    #   puts "+ #{neighbor}"
        memo += climbing_out(*neighbor)
        memo
      end
    # puts ". #{x}:#{y} #{follow + hoser}"
      follow + hoser
    end

    def basin_sizes_and_coordinates
      low_points.inject(Hash.new([])) do |memo, trough|
    #   puts ""
    #   puts "SWIMMING UP FROM #{trough}"
        basin = climbing_out(*trough).uniq
    #   puts "...........BASIN #{basin}"
        memo[1 + basin.length] += [[trough, *basin]] # basins of this size
        memo
      end
    end

    def basin_sizes
      survey = basin_sizes_and_coordinates
    # pp survey
      survey.keys.inject([]) do |memo, key|
        memo += [key] * survey[key].length
      end
    end

    def avoidance
    # hoser = basin_sizes
    # pp "#{hoser.sort}"
    # pp "#{hoser.sort.last(3)}"
    # hoser.sort.last(3).reduce(:*)
      basin_sizes.sort.last(3).reduce(:*)  # same as inject, but the synonym is more apropos
    end

    def sum_of_low_points
      low_points.inject(0) do |memo, point|
        memo += 1 + heightmap(*point)
      end
    end

    def low_points
      (0..@y_max).inject([]) do |memo, y|
        (0..@x_max).each do |x|
          memo << [x,y] if is_valley?(x, y)
        end
        memo
      end
    end

    def is_valley? x, y
      center = heightmap(x, y)
      if y.zero?          # nothing above
        if x.zero?        # upper left
          SmokeBasin.is_valley? center, heightmap(1, 0), heightmap(0, 1)
        elsif x == @x_max # upper right
          SmokeBasin.is_valley? center, heightmap(x-1, 0), heightmap(x, 1)
        else              # top row
          SmokeBasin.is_valley? center, heightmap(x-1, 0), heightmap(x, 1), heightmap(x+1, 0)
        end
      elsif y == @y_max   # nothing below
        if x.zero?        # lower left
          SmokeBasin.is_valley? center, heightmap(1, y), heightmap(0, y-1)
        elsif x == @x_max # lower right
          SmokeBasin.is_valley? center, heightmap(x-1, y), heightmap(x, y-1)
        else              # lower row
          SmokeBasin.is_valley? center, heightmap(x-1, y), heightmap(x, y-1), heightmap(x+1, y)
        end
      else                # above and below
        if x.zero?        # left column
          SmokeBasin.is_valley? center, heightmap(x, y-1), heightmap(x+1, y), heightmap(x, y+1)
        elsif x == @x_max # right column
          SmokeBasin.is_valley? center, heightmap(x, y-1), heightmap(x-1, y), heightmap(x, y+1)
        else              # in the deep
          SmokeBasin.is_valley? center, heightmap(x-1, y), heightmap(x, y-1), heightmap(x+1, y), heightmap(x, y+1)
        end
      end
    end

    # compare a point's value with zero or more neighbors
    def self.is_valley? me, *neighbors
      neighbors.each do |neighbor|
        return false if neighbor <= me
      end
      true
    end
  end
end
