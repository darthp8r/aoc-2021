module Aoc2021
  class ExtendedPolymerization
    attr_reader :template
    attr_reader :insertions

    def initialize process=[]
      @template = process.shift #.scan /./
      @insertions = process.inject({}) do |memo, rule|
        k, v = rule.split '->'
        memo[k.strip] = v.strip
        memo
      end.freeze
    end

    def react polymer=@template
      polymer.scan(/./).each_cons(2).inject("#{polymer[0]}") do |memo, element|
        memo += [@insertions[element.join], element[1]].join
        memo
      end
    end

    def chain iterations=1, polymer=@template
      (1..iterations).inject(polymer) do |memo, ignored|
        react memo
      end
    end

    # TODO: fixate only on the subtractive; do not compute the whole reaction

    def subtractive iterations=10
      frequencies = chain(iterations, @template).each_char.inject(Hash.new(0)) do |memo, occurrence|
        memo[occurrence] += 1
        memo
      end.invert
      spread = frequencies.keys.sort
      spread[-1] - spread[0]
    end
  end
end
