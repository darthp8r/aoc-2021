module Aoc2021
  class SonarSweep
    def initialize report=[]
      @report = report.map(&:to_i)
    end

    def increasings report=@report
      # the memo is a list of the current count and the last reading
      report.inject([0, report[0]]) do |memo, reading|
        count, history = memo
        if history < reading
          [1+count, reading]
        else
          [count, reading]
        end
      end[0]  # return only the count
    end

    def three_by_three report=@report
      threes = []
      while 3 <= report.length do
        threes << report[0] + report[1] + report[2]
        report.shift
      end
      increasings threes
    end
  end
end
