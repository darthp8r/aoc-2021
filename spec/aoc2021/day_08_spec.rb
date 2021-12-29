module Aoc2021
  RSpec.describe SevenSegmentSearch do
    context "Small Sample" do
      before(:all) do
        @subject = SevenSegmentSearch.new Support.file_to_list __FILE__.gsub('spec.rb', 'small_sample.txt')
      end
      subject { @subject }

      describe "Part 1" do
        it "sample data agrees" do
          expect(subject.easy_digits).to eq 0
        end
      end

      describe "Part 2" do
        it "sample data agrees" do
          expect(subject.sum_of_the_tome).to eq 5353
        end
      end
    end

    context "Large Sample" do
      before(:all) do
        @subject = SevenSegmentSearch.new Support.file_to_list __FILE__.gsub('spec.rb', 'large_sample.txt')
      end
      subject { @subject }

      describe "Part 1" do
        it "sample data agrees" do
          expect(subject.easy_digits).to eq 26
        end
      end

      describe "Part 2" do
        it "sample data agrees" do
          expect(subject.sum_of_the_tome).to eq 61229
        end
      end
    end

    context "Actual" do
      before(:all) do
        @subject = SevenSegmentSearch.new Support.file_to_list __FILE__.gsub('spec.rb', 'actual.txt')
      end
      subject { @subject }

      describe "Part 1" do
        it "actual answer above" do
          pp subject.easy_digits
        end

        it "results survive" do
          expect(subject.easy_digits).to eq 272
        end
      end

      describe "Part 2" do
        it "actual answer above" do
          pp subject.sum_of_the_tome
        end

        it "results survive" do
          expect(subject.sum_of_the_tome).to eq 1007675
        end
      end
    end
  end
end

