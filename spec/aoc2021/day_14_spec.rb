module Aoc2021
  RSpec.describe ExtendedPolymerization do
    context "Sample" do
      before(:all) do
        @subject = ExtendedPolymerization.new Support.file_to_list __FILE__.gsub('spec.rb', 'sample.txt')
      end
      subject { @subject }

      describe "Part 1" do
        it "sample data agrees" do
          expect(subject.subtractive).to eq 1588
        end
      end

      describe "Part 2" do
        it "sample data agrees" ,:skip do
          expect(subject.subtractive 40).to eq 2188189693529
        end
      end
    end

    context "Actual" do
      before(:all) do
        @subject = ExtendedPolymerization.new Support.file_to_list __FILE__.gsub('spec.rb', 'actual.txt')
      end
      subject { @subject }

      describe "Part 1" do
        it "actual answer above" do
          pp subject.subtractive
        end

        it "results survive" do
          expect(subject.subtractive).to eq 4244
        end
      end

      describe "Part 2" ,:skip do
        it "actual answer above" do
          pp subject.part_deux
        end

        it "results survive" do
          expect(subject.part_deux).to eq 2222
        end
      end
    end
  end
end

