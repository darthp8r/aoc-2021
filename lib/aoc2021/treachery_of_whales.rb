module Aoc2021
  class TreacheryOfWhales
    attr_reader :crabbies
    attr_reader :ranks

    def initialize crabbies=[]
      # hash of position index to its number of occupants
      @crabbies = crabbies[0].split(',').map(&:to_i).inject(Hash.new(0)) do |memo, crabs|
        memo[crabs] += 1
        memo
      end.freeze
      # list of occupied positions
      @ranks = @crabbies.keys.sort.freeze
    end

    def cheapest_dance
      bottom_lines.values.min
    end


    def bottom_lines
      cost_matrix.each_pair.inject({}) do |convergence, cost|
        convergence[cost[0]] = cost[1].values.inject(:+)
        convergence
      end
    end

    # matrix of position to the fuel costs from each other position
    # {
    #   0 => {
    #     0 => 0,   # 1 * (0-0).abs
    #     1 => 2,   # 2 * (0-1).abs
    #     2 => 6,   # 3 * (0-2).abs
    #     4 => 4,   # 1 * (0-4).abs
    #     7 => 7,   # 1 * (0-7).abs
    #     14 => 14, # 1 * (0-14).abs
    #     16 => 16, # 1 * (0-16).abs
    #   }
    #   2 => {
    #     0 => 6,   # 1 * (2-0).abs
    #     1 => 6,   # 2 * (2-1).abs
    #     2 => 0,   # 3 * (2-2).abs
    #   }
    # }
    def cost_matrix
      (0..@ranks.max).inject({}) do |memo, focus|
        memo.merge({ focus => cost_to_merge_here(focus) })
      end
    end

    # naive to buld the whole O(n^2) structure, but I feel I may have to for Part 2
    def cost_to_merge_here position
      @ranks.inject({}) do |memo, offset|
        memo[offset] = @crabbies[offset] * (position-offset).abs
        memo
      end
    end

    def cheapest_dance_struggle
      bottom_lines_struggle.values.min
    end


    def bottom_lines_struggle
      cost_matrix_struggle.each_pair.inject({}) do |convergence, cost|
        convergence[cost[0]] = cost[1].values.inject(:+)
        convergence
      end
    end

    def cost_matrix_struggle
      (0..@ranks.max).inject({}) do |memo, focus|
        memo.merge({ focus => cost_to_merge_here_struggle(focus) })
      end
    end

    def cost_to_merge_here_struggle position
      @ranks.inject({}) do |memo, offset|
        memo[offset] = @crabbies[offset] * cost_struggle((position-offset).abs)
        memo
      end
    end

    def cost_struggle distance
      distance * (1 + distance) / 2
    end

  end
end
