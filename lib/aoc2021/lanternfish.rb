module Aoc2021
  class Lanternfish
    attr_reader :epoch
    attr_reader :pool

    def initialize epoch=[]
      @epoch = epoch[0].split(',').map(&:to_i)
      @pool = @epoch.inject([0]*9) do |memo, age|
        memo[age] += 1
        memo
      end.freeze
    end

    def propagate generations=1
      (1..generations).inject(@pool.dup) do |memo, ignored|
        # zeroes will regenerate, plus ...
        # ... all two-day-olds are one, all one-day-olds are zero, etc
        births = memo.shift
        # each zero/birth is added to the (population of) six- and eight-day-olds
        memo[6] += births
        memo[8] = births
        memo
      end
    end
  end
end
