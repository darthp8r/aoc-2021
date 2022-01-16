module Aoc2021
  class ExtendedPolymerization
    attr_reader :template
    attr_reader :starter
    attr_reader :insertions

    def initialize process=[]
      @template = process.shift.freeze
      @starter = @template.chars.each_cons(2).inject(Hash.new(0)) do |memo, atom|
        memo[atom.join] += 1
        memo
      end.freeze
      @insertions = process.inject({}) do |memo, rule|
        k, v = rule.split ' -> '
        memo[k] = ["#{k[0]}#{v}", "#{v}#{k[1]}"]
        memo
      end.freeze
    end

    def react reaction=@starter.dup
      reaction.keys.each.inject(Hash.new(0)) do |memo, pair|
        expression = @insertions[pair]
        memo[expression[0]] += reaction[pair]
        memo[expression[1]] += reaction[pair]
        memo
      end
    end

    def letter_count spread
      spread.each_pair.inject(Hash.new(0).merge({@template[-1] => 1})) do |memo, (pair, count)|
        memo[pair[0]] += count
        memo
      end.invert
    end

    def element_range iterations=10
      frequencies = (1..iterations).inject(@starter.dup) do |memo, iteration|
        react memo
      end
      spread = letter_count(frequencies).keys.sort
      spread[-1] - spread[0]
    end
  end
end
