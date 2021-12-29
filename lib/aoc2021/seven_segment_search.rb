module Aoc2021
  class SevenSegmentSearch
    DIGITS = {
      "abcefg"  => 0, # [0,6,9] ab..fg  (-d)
      "cf"      => 1, # [1]     the only 1-segment digit
      "acdeg"   => 2, # [2,3,5] a.d.g   (-bf)
      "acdfg"   => 3, # [2,3,5] a.d.g   (-be)
      "bcdf"    => 4, # [4]     the only 4-segment digit

      "abdfg"   => 5, # [2,3,5] a.d.g   (-ce)
      "abdefg"  => 6, # [0,6,9] ab..fg  (-c)
      "acf"     => 7, # [7]     the only 3-segment digit
      "abcdefg" => 8, # [8]     the only 7-segment digit
      "abcdfg"  => 9, # [0,6,9] ab..fg  (-e)
    }
    LENGTHS = {   # key = how long; value = number(s) of that length
      2 => [1],
      3 => [7],
      4 => [4],
      5 => [2, 3, 5],
      6 => [0, 6, 9],
      7 => [8],
    }
    PATTERN = "abcdefg"

    attr_reader :message

    def initialize data=[]
      # each line is divided into the reading and meaning parts,
      # each of those are split by space into lists of words.
      @message = data.inject([]) do |memo, text|
        reading, meaning = text.split(' | ')
        memo << [
          reading.split(' '),
          meaning.split(' '),
        ]
        memo
      end.freeze
    end

    def easy_digits
      @message.inject(0) do |accumulator, message|
        tmp = message[1].filter do |word|
          [2, 3, 4, 7].include? word.length
        end.length
        accumulator + tmp
      end
    end

    def alphabetic letters; letters.unpack('c*').sort.pack('c*'); end

    def untangle wiring
      lengths = wiring.inject(Hash.new([])) do |memo, codeword|
        memo[codeword.length] += [alphabetic(codeword)]
        memo
      end

      t = lengths[3][0].delete lengths[2][0]

      mask = "#{t}#{lengths[4][0]}"
      this = lengths[6].filter do |contestant|
        contestant.delete(mask).length == 1
      end[0]
      z = this.delete mask

      mask = "#{t}#{lengths[4][0]}#{z}"
      x = lengths[7][0].delete mask

      mask = "#{t}#{lengths[3][0]}#{z}"
      this = lengths[5].filter do |contestant|
        contestant.delete(mask).length == 1
      end[0]
      w = this.delete mask

      mask = "#{t}#{w}#{x}#{z}"
      this = lengths[5].filter do |contestant|
        contestant.delete(mask).length == 1
      end[0]
      v = this.delete mask

      mask = "#{t}#{v}#{w}#{x}#{z}"
      this = lengths[5].filter do |contestant|
        contestant.delete(mask).length == 1
      end[0]
      y = this.delete mask

      mask = "#{t}#{v}#{w}#{x}#{y}#{z}"
      u = lengths[7][0].delete mask

      {
        t => 'a',
        u => 'b',
        v => 'c',
        w => 'd',
        x => 'e',
        y => 'f',
        z => 'g',
      }
    end

    def translate_and_evaluate wiring, message
      replacement = untangle wiring
      message.inject("") do |memo, scrambled|
        cleared = alphabetic scrambled.gsub(/[abcdefg]/, replacement)
        memo + DIGITS[cleared].to_s
      end.to_i
    end

    def sum_of_the_tome
      @message.inject(0) do |accumulator, text|
        accumulator + translate_and_evaluate(*text)
      end
    end
  end
end
