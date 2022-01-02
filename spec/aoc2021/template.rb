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
          expect(subject.part_one).to eq 1
        end
      end

      describe "Part 2" do
        it "sample data agrees" ,:skip do
          expect(subject.part_deux).to eq 2
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
          pp subject.part_one
        end

        it "results survive" do
          expect(subject.part_one).to eq 1111
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

