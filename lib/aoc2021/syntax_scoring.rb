module Aoc2021
  class SyntaxScoring
    ROUND_ERROR   = 3
    SQUARE_ERROR  = 57
    CURLY_ERROR   = 1197
    ANGLE_ERROR   = 25137

    OPENERS = {
      '(' => {closer: ')', finish: 1, error: 3,},
      '[' => {closer: ']', finish: 2, error: 57,},
      '{' => {closer: '}', finish: 3, error: 1197,},
      '<' => {closer: '>', finish: 4, error: 25137,},
    }
    CLOSERS = OPENERS.keys.inject({}) do |memo, opener|
      memo[OPENERS[opener][:closer]] = opener
      memo
    end

    def initialize readings=[]
      @readings = readings.freeze
      @parsed = @readings.map do |line|
        SyntaxScoring.parse_line line
      end
    end

    def self.parse_line line
      line.each_char.inject({source: line, stack: [], errors: 0}) do |memo, character|
        if OPENERS.keys.include? character
          memo[:stack].push character
        elsif CLOSERS.keys.include? character
          opener = CLOSERS[character]
          if opener == memo[:stack].last
            memo[:stack].pop
          else
            memo[:errors] = OPENERS[opener][:error]
            return memo
          end
        end
        memo
      end
    end

    def error_score
      @parsed.map do |line|
        line[:errors]
      end.inject(&:+)
    end

    def auto_complete
      hoser = @parsed.select do |incomplete|  # another alias; select seems better than filter
        incomplete[:errors].zero?
      end.map do |incomplete|
        incomplete[:stack].inject([]) do |complete, counterpart|
          complete.unshift counterpart
          complete
        end.inject(0) do |score, missing|
          score *= 5
          score += OPENERS[missing][:finish]
        end
      end.sort
      hoser[(hoser.length-1)/2]
    end
  end
end
