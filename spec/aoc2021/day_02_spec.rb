module Aoc2021
  RSpec.describe Dive do
    context "Sample" do
      subject do
        Dive.new Support.file_to_list __FILE__.gsub('spec.rb', 'sample.txt')
      end

      describe "Part 1" do
        it "sample data agrees" do
          expect(subject.position).to eq 150
        end
      end

      describe "Part 2" do
        it "sample data agrees" do
          expect(subject.position_reinterpreted).to eq 900
        end
      end
    end

    context "Actual" do
      subject do
        Dive.new Support.file_to_list __FILE__.gsub('spec.rb', 'actual.txt')
      end

      describe "Part 1" do
        it "actual answer above" do
          pp subject.position
        end

        it "survives part two" do
          expect(subject.position).to eq 1648020
        end
      end

      describe "Part 2" do
        it "actual answer above" do
          pp subject.position_reinterpreted
        end
      end
    end
  end
end
