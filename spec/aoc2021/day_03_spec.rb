module Aoc2021
  RSpec.describe BinaryDiagnostic do
    context "Sample" do
      subject do
        BinaryDiagnostic.new Support.file_to_list __FILE__.gsub('spec.rb', 'sample.txt')
      end

      describe "Part 1" do
        it "sample data agrees on gamma" do
          expect(subject.gamma).to eq 22
        end

        it "sample data agrees on epsilon" do
          expect(subject.epsilon).to eq 9
        end

        it "sample data agrees on power consumption" do
          expect(subject.power_consumption).to eq 198
        end
      end

      describe "Part 2" do
      end
    end

    context "Actual" do
      subject do
        BinaryDiagnostic.new Support.file_to_list __FILE__.gsub('spec.rb', 'actual.txt')
      end

      describe "Part 1" do
        it "actual answer above" do
          pp subject.power_consumption
        end

        it "survives part two" do
          expect(subject.power_consumption).to eq 2583164
        end
      end

      describe "Part 2" do
      end
    end
  end
end
