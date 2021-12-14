module Aoc2021
  class BinaryDiagnostic
    attr_reader :report
    attr_reader :gamma
    attr_reader :epsilon

    def initialize report=[]
      @nbits = report[0].length
      @top_bit = @nbits - 1
      @report = report.map do |observation|
        observation.to_i(2)
      end

      @gamma = diag_gamma
      @epsilon = ((2 ** @nbits) - 1) ^ @gamma
    end

    def power_consumption; @gamma * @epsilon; end

    def diag_gamma report=@report
      popular = report.inject([0]*@nbits) do |memo, observation|
        @top_bit.downto(0) do |bit|
          if (observation & (1 << bit)).zero?
            memo[bit] -= 1
          else
            memo[bit] += 1
          end
        end
        memo
      end
      @top_bit.downto(0).inject(0) do |memo, bit|
        memo += (1 << bit) if popular[bit].positive?
        memo
      end
    end

    def to_bs report
      report.inject([]) do |memo, observation|
        memo << ("%0#{@nbits}b" % observation)
        memo
      end
    end

  end
end
