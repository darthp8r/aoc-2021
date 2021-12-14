module Aoc2021
  class BinaryDiagnostic
    attr_reader :report
    attr_reader :gamma
    attr_reader :epsilon
    attr_reader :available_o2
    attr_reader :scrubbed_co2

    def initialize report=[]
      @nbits = report[0].length
      @top_bit = @nbits - 1
      @report = report.map do |observation|
        observation.to_i(2)
      end

      @gamma = diag_gamma
      @epsilon = ((2 ** @nbits) - 1) ^ @gamma
      @scrubbed_co2, @available_o2 = diag_gasses
    end

    def power_consumption; @gamma * @epsilon; end

    def life_support_rating; @available_o2 * @scrubbed_co2; end

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

    def diag_gasses report=@report
      mask = (1 << @top_bit)
      zeroes, ones = report.inject([[], []]) do |memo, observation|
        if (mask & observation).zero?
          memo[0] << observation
        else
          memo[1] << observation
        end
        memo
      end

      if zeroes.length < ones.length
        co2, o2 = [zeroes, ones]
      else
        co2, o2 = [ones, zeroes]
      end

      (@top_bit-1).downto(0) do |bit|
        mask = (1 << bit)
        unless o2.length == 1
          o2 = majority(o2, mask)
        end
        unless co2.length == 1
          co2 = minority(co2, mask)
        end
      end

      [co2[0], o2[0]]
    end

    # don't keep count; build separate lists, then compare their lengths

    def majority report, mask
      zeroes, ones = BinaryDiagnostic.zeroes_and_ones(report, mask)
      if zeroes.length <= ones.length
        ones
      else
        zeroes
      end
    end

    def minority report, mask
      zeroes, ones = BinaryDiagnostic.zeroes_and_ones(report, mask)
      if zeroes.length <= ones.length
        zeroes
      else
        ones
      end
    end

    def self.zeroes_and_ones report, mask
      report.inject([[], []]) do |memo, observation|
        if (observation & mask).zero?
          memo[0] << observation
        else
          memo[1] << observation
        end
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
