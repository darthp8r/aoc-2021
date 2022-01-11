module Aoc2021
  class PassagePathing
    attr_reader :paths

    def initialize rays=[]
      xrays = [
        "start-A",
        "start-b",
        "A-b",
        "A-end",
      # "A-x",
      # "x-c",
      # "c-end",
      # "x-b",
      # "b-end",
      ]
      @rays = rays.freeze
      @paths = @rays.inject(Hash.new([])) do |memo, ray|
        # using symbols, but it may be that using (frozen) strings is faster
        # because #traverse won't need to convert to string to then downcase
        # but symbols may be more hashable/searchable, so meh
        here, there = ray.split('-').map(&:to_sym)
        case  # feels durty
        when here == :start
          memo[here] += [there]
        when there == :start
          memo[there] += [here]
        when here == :end
          memo[there] += [here]
        when there == :end
          memo[here] += [there]
        else
          memo[here] += [there]
          memo[there] += [here]
        end
        memo
      end.freeze
    end

    def permission_to_enter? cave
      false
    end

    # from 'this_node, spawn out to each of the nodes reachable, building on the
    # 'working_path, and append it (the 'working_path) to 'all_the_paths when it
    # :end's, and not molesting it (the 'working_path) when it dead-ends
    def visit all_the_paths, working_path, this_node
      if this_node == :end
        all_the_paths.append working_path
      elsif working_path.include?(this_node) and PassagePathing.small_cave?(this_node)
        nil
      else
        @paths[this_node].map do |neighbor|
          visit all_the_paths, (working_path + [this_node]), neighbor
        end
      end
      all_the_paths
    end

    def traverse
      # start from all :start nodes, starting the visit from each, augmenting
      # (or not) the list of all completed paths
      @paths[:start].inject([]) do |memo, start|
        visit memo, [], start
      end
    end

    def cave_paths; traverse.length; end

    def you_cannot_pass? working_path, this_node
      working_path.include?(this_node) and PassagePathing.small_cave?(this_node)
    end

    def visit_reconsidered all_the_paths, working_path, this_node, just_this_once
      if this_node == :end
        all_the_paths.append working_path
      elsif you_cannot_pass? working_path, this_node
        if just_this_once
          @paths[this_node].map do |neighbor|
            visit_reconsidered all_the_paths, (working_path + [this_node]), neighbor, false
          end
        else
          nil
        end
      else
        @paths[this_node].map do |neighbor|
          visit_reconsidered all_the_paths, (working_path + [this_node]), neighbor, just_this_once
        end
      end
      all_the_paths
    end

    def traverse_reconsidered
      @paths[:start].inject([]) do |memo, start|
        visit_reconsidered memo, [], start, true
      end
    end

    def cave_paths_reconsidered; traverse_reconsidered.length; end

    def to_dot label=nil
      # create a graphviz diagram from the @paths
      [
        "graph #{label} {",
        @paths.each_pair.map do |k,v|
          v.map { |t| "  #{k} -> #{t};" }
        end,
        "}"
      ]
    end

    def self.small_cave? cave; cave.to_s.downcase == cave.to_s; end
  end
end
