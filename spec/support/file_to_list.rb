module Aoc2021
  def self.file_to_list filename
    File.open filename do |me|
      me.readlines chomp: true
    end
  end
end

