module Aoc2021
  RSpec.describe HydrothermalVenture do
    context "Sample" do
      before(:all) do
        @subject = HydrothermalVenture.new Support.file_to_list __FILE__.gsub('spec.rb', 'sample.txt')
      end
      subject { @subject }

      describe "Part 1" do
        it "sample data agrees" do
          expect(subject.overlaps).to eq 5
        end
      end

      describe "Part 2" do
        it "sample data agrees" do
          expect(subject.overlaps(diagonal: true)).to eq 12
        end
      end
    end

    context "Actual" do
      before(:all) do
        @subject = HydrothermalVenture.new Support.file_to_list __FILE__.gsub('spec.rb', 'actual.txt')
      end
      subject { @subject }

      describe "Part 1" do
        it "actual answer above" do
          pp subject.overlaps(diagonal: true)
        end

        it "results survive" do
          expect(subject.overlaps).to eq 6572
        end
      end

      describe "Part 2" do
        it "actual answer above" do
          pp subject.overlaps(diagonal: true)
        end

        it "results survive" do
          expect(subject.overlaps(diagonal: true)).to eq 21466
        end
      end
    end
  end
end

