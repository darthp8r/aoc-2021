module Aoc2021
  RSpec.describe SonarSweep do
    context "Sample" do
      before(:all) do
        @subject = SonarSweep.new Support.file_to_list __FILE__.gsub('spec.rb', 'sample.txt')
      end
      subject { @subject }

      describe "Part 1" do
        it "sample data agrees" do
          expect(subject.increasings).to eq 7
        end
      end

      describe "Part 2" do
        it "sample data agrees" do
          expect(subject.three_by_three).to eq 5
        end
      end
    end

    context "Actual" do
      before(:all) do
        @subject = SonarSweep.new Support.file_to_list __FILE__.gsub('spec.rb', 'actual.txt')
      end
      subject { @subject }

      describe "Part 1" do
        it "actual answer above" do
          pp subject.increasings
        end

        it "results survive" do
          expect(subject.increasings).to eq 1559
        end
      end

      describe "Part 2" do
        it "actual answer above" do
          pp subject.three_by_three
        end

        it "results survive" do
          expect(subject.three_by_three).to eq 1600
        end
      end
    end
  end
end
