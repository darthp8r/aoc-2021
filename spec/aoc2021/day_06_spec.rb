module Aoc2021
  RSpec.describe Lanternfish do
    context "Sample" do
      subject do
        Lanternfish.new Support.file_to_list __FILE__.gsub('spec.rb', 'sample.txt')
      end

      def tabulate population=[]
        population.inject([0]*9) do |memo, age|
          memo[age] += 1
          memo
        end
      end

      MODEL = [
        [3,4,3,1,2],
        [2,3,2,0,1],
        [1,2,1,6,0,8],
        [0,1,0,5,6,7,8],
        [6,0,6,4,5,6,7,8,8],
        [5,6,5,3,4,5,6,7,7,8],
        [4,5,4,2,3,4,5,6,6,7],
        [3,4,3,1,2,3,4,5,5,6],
        [2,3,2,0,1,2,3,4,4,5],
        [1,2,1,6,0,1,2,3,3,4,8],
        [0,1,0,5,6,0,1,2,2,3,7,8],
        [6,0,6,4,5,6,0,1,1,2,6,7,8,8,8],
        [5,6,5,3,4,5,6,0,0,1,5,6,7,7,7,8,8],
        [4,5,4,2,3,4,5,6,6,0,4,5,6,6,6,7,7,8,8],
        [3,4,3,1,2,3,4,5,5,6,3,4,5,5,5,6,6,7,7,8],
        [2,3,2,0,1,2,3,4,4,5,2,3,4,4,4,5,5,6,6,7],
        [1,2,1,6,0,1,2,3,3,4,1,2,3,3,3,4,4,5,5,6,8],
        [0,1,0,5,6,0,1,2,2,3,0,1,2,2,2,3,3,4,4,5,7,8],
        [6,0,6,4,5,6,0,1,1,2,6,0,1,1,1,2,2,3,3,4,6,7,8,8,8,8],
      ].freeze

      describe "Part 1" do
        it "sample data agrees in number" do
          expect(subject.propagate(18).inject(:+)).to eq 26
        end

        it "sample data agrees in larger number" do
          expect(subject.propagate(80).inject(:+)).to eq 5934
        end
      end

      describe "Part 2" do
        it "sample data agrees" do
          expect(subject.propagate(256).inject(:+)).to eq 26984457539
        end
      end
    end

    context "Actual" do
      subject do
        Lanternfish.new Support.file_to_list __FILE__.gsub('spec.rb', 'actual.txt')
      end

      describe "Part 1" do
        it "earlier results survive" do
          expect(subject.propagate(80).inject(:+)).to eq 380612
        end

        it "actual answer above" do
          pp subject.propagate(80).inject(:+)
        end
      end

      describe "Part 2" do
        it "actual answer above" do
          pp subject.propagate(256).inject(:+)
        end
      end
    end
  end
end

