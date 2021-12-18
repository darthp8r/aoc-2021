module Aoc2021
  RSpec.describe Classname do
    context "Sample" do
      subject do
        Classname.new Support.file_to_list __FILE__.gsub('spec.rb', 'sample.txt')
      end

      describe "Part 1" do
        it "sample data agrees" do
          expect(subject.something).to eq 7
        end
      end

      describe "Part 2" do
        it "sample data agrees" do
          expect(subject.something_else).to eq 5
        end
      end
    end

    context "Actual", :skip do
      subject do
        Classname.new Support.file_to_list __FILE__.gsub('spec.rb', 'actual.txt')
      end

      describe "Part 1" do
        it "earlier results survive" do
          expect(subject.something).to eq 1559
        end

        it "actual answer above" do
          pp subject.something
        end
      end

      describe "Part 2", :skip do
        it "actual answer above" do
          pp subject.something_else
        end
      end
    end
  end
end

