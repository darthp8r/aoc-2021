module Aoc2021
  class Dive
    attr_reader :command_log

    ACTIONS = [:forward, :down, :up]

    def initialize commands=[]
      @command_log = commands.map do |command|
        car, cdr = command.split
        action = car.to_sym
        delta = cdr.to_i
        if ACTIONS.include? action
          [action, delta]
        end
      end
    end

    def position
      hz = 0
      v = 0
      @command_log.each do |action, delta|
        case action
        when :forward
          hz += delta
        when :down
          v += delta
        when :up
          if v < delta
            v = 0
          else
            v -= delta
          end
        end
      end
      hz * v
    end

    def position_reinterpreted
      aim = 0
      hz = 0
      v = 0
      @command_log.each do |action, delta|
        case action
        when :forward
          hz += delta
          v += aim * delta
        when :down
          aim += delta
        when :up
          if aim < delta
            aim = 0
          else
            aim -= delta
          end
        end
      end
      hz * v
    end
  end
end
