module Aoc2021
  RSpec.describe DumboOctopus do
    context "Trivial" do
      before(:all) do
        @subject = DumboOctopus.new Support.file_to_list __FILE__.gsub('spec.rb', 'trivial.txt')
      end
      subject { @subject }

      describe "Part 1" do
        it "sample data agrees, n=1" do
          expect(subject.flash_count(1)).to eq 9
        end

        it "sample data agrees, n=2" do
          expect(subject.flash_count(2)).to eq 9
        end
      end
    end

    context "Sample" do
      before(:all) do
        @subject = DumboOctopus.new Support.file_to_list __FILE__.gsub('spec.rb', 'sample.txt')
      end
      subject { @subject }

      describe "Part 1" do
        it "sample data agrees, n=10" do
          expect(subject.flash_count(10)).to eq 204
        end

        it "sample data agrees, n=100" do
          expect(subject.flash_count(100)).to eq 1656
        end
      end

      describe "Part 2" do
        it "sample data agrees" do
          expect(subject.synchronized).to eq 195
        end
      end
    end

    context "Actual" do
      before(:all) do
        @subject = DumboOctopus.new Support.file_to_list __FILE__.gsub('spec.rb', 'actual.txt')
      end
      subject { @subject }

      describe "Part 1" do
        it "actual answer above" do
          pp subject.flash_count(100)
        end

        it "results survive" do
          expect(subject.flash_count(100)).to eq 1729
        end
      end

      describe "Part 2" do
        it "actual answer above" do
          pp subject.synchronized
        end

        it "results survive" do
          expect(subject.synchronized).to eq 237
        end
      end
    end
  end
end

