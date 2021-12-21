module Aoc2021
  class HydrothermalVenture
    attr_reader :readings

    def initialize readings=[]
      @x_dimension = 0
      @y_dimension = 0
      @readings = readings.inject([]) do |memo, segment|
        one, two = segment.split('->')
        one = one.split(',').map(&:to_i)
        @x_dimension = one[0] if @x_dimension < one[0]
        @y_dimension = one[1] if @y_dimension < one[1]
        two = two.split(',').map(&:to_i)
        @x_dimension = two[0] if @x_dimension < two[0]
        @y_dimension = two[1] if @y_dimension < two[1]
        memo << [one, two]
        memo
      end
      @x_dimension += 1
      @y_dimension += 1
    end

    # array indexed by y first because
    def analysis diagonal=false
    # pp "Diagonals? #{diagonal}"
      # Note:
      #   [[0]*@x_dimension]*@y_dimension]
      # is tempting, but it creates @y_dimension _references_ to the same list
      # of @x_dimension zeroes. Subsequent changes to any @x position in any
      # @y'th row expressed that change in what looks to be _all rows_
      blank_slate = Array.new(@x_dimension) {
        Array.new(@y_dimension, 0)
      }
    # pp blank_slate
      @readings.inject(blank_slate) do |memo, segment|
        x1, y1 = segment[0]
        x2, y2 = segment[1]
    #   pp ""
    #   pp "Analyzing (#{x1} #{y1}) to (#{x2} #{y2})"
        # swap when decresing!
        if x1 == x2
    #     pp "... VERTICAL"
          if y2 < y1; y1, y2 = [y2, y1]; end  # draw upwards
          (y1..y2).each do |y|
    #       pp "... #{x1} #{y}"
            memo[y][x1] += 1
    #       pp memo
          end
        elsif y1 == y2
    #     pp "... HORIZONTAL"
          if x2 < x1; x1, x2 = [x2, x1]; end  # draw backwards
          (x1..x2).each do |x|
    #       pp "... #{x} #{y1}"
            memo[y1][x] += 1
          end
        elsif diagonal and ((x1 - x2).abs == (y1 - y2).abs)
    #     pp "... DIAGONAL, span = #{(y1-y2).abs}"
          span = (y1 - y2).abs
          if (x1 < x2) and (y1 < y2)
    #       pp "... southeast"
            dx = 1
            dy = 1
          elsif (x1 < x2)
    #       pp "... northeast"
            dx = 1
            dy = -1
          elsif (y1 < y2)
    #       pp "... southwest"
            dx = -1
            dy = 1
          else
    #       pp "... northwest"
            dx = -1
            dy = -1
          end
          (0..span).each do |d|
    #       pp "... #{x1+(d*dx)} #{y1+(d*dy)}"
            memo[y1+(d*dy)][x1+(d*dx)] += 1
          end
        else
    #     pp "... nothing to report"
          nil
        end
    #   pp memo
        memo
      end
    end

    def overlaps diagonal=false
      analysis(diagonal).flatten.inject(0) do |memo, point|
        memo += 1 if 1 < point
        memo
      end
    end

    def to_s
      @readings.inject([]) do |memo, row|
      end.join '\n'
    end

  end
end
