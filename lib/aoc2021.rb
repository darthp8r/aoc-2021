require "aoc2021/version"

require "aoc2021/sonar_sweep"

require "aoc2021/dive"

require "aoc2021/binary_diagnostic"

require "aoc2021/bingo_board"
require "aoc2021/giant_squid"

require "aoc2021/hydrothermal_venture"

require "aoc2021/lanternfish"

require "aoc2021/treachery_of_whales"

require "aoc2021/seven_segment_search"

require "aoc2021/smoke_basin"

require "aoc2021/syntax_scoring"

require "aoc2021/dumbo_octopus"

require "aoc2021/passage_pathing"

require "aoc2021/transparent_origami"

require "aoc2021/extended_polymerization"

module Aoc2021
  class Error < StandardError; end

  # 30  black
  # 31  red
  # 32  green
  # 33  yellow (brown)
  # 34  blue
  # 35  magenta
  # 36  cyan
  # 37  grey
  # 38  white
  def self.shine thing; "\e[7;38m" + thing.to_s + "\e[m"; end
  # 0   normal
  # 1   bright
  # 2   dim
  # 3   a little less dim
  # 4   underscore
  # 5   blinkenlights
  # 6   just like 3 ?
  # 7   inverse
end
