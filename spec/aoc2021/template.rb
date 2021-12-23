module Aoc2021
  RSpec.describe Classname do
    context "Sample" do
      before(:all) do
        @subject = Classname.new Support.file_to_list __FILE__.gsub('spec.rb', 'sample.txt')
      end
      subject { @subject }

      describe "Part 1" do
        it "dunsels" do
        end

        it "sample data agrees" ,:skip do
          expect(subject.something).to eq 7
        end
      end

      describe "Part 2" ,:skip do
        it "sample data agrees" ,:skip do
          expect(subject.something_else).to eq 5
        end
      end
    end

    context "Actual" ,:skip do
      before(:all) do
        @subject = Classname.new Support.file_to_list __FILE__.gsub('spec.rb', 'actual.txt')
      end
      subject { @subject }

      describe "Part 1" do
        it "actual answer above" do
          pp subject.something
        end

        it "results survive" do
          expect(subject.something).to eq 1559
        end
      end

      describe "Part 2" ,:skip do
        it "actual answer above" do
          pp subject.something_else
        end

        it "results survive" do
          expect(subject.something_else).to eq 1559
        end
      end
    end
  end
end

