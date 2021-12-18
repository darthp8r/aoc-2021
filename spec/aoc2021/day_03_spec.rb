module Aoc2021
  RSpec.describe BinaryDiagnostic do
    context "Sample" do
      before(:all) do
        @subject = BinaryDiagnostic.new Support.file_to_list __FILE__.gsub('spec.rb', 'sample.txt')
      end
      subject { @subject }

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
        it "sample data agrees on oxygen" do
          expect(subject.available_o2).to eq 23
        end

        it "sample data agrees on co2 scrubbed" do
          expect(subject.scrubbed_co2).to eq 10
        end

        it "sample data agrees on life support rating consumption" do
          expect(subject.life_support_rating).to eq 230
        end
      end
    end

    context "Actual" do
      before(:all) do
        @subject = BinaryDiagnostic.new Support.file_to_list __FILE__.gsub('spec.rb', 'actual.txt')
      end
      subject { @subject }

      describe "Part 1" do
        it "actual answer above" do
          pp subject.power_consumption
        end

        it "answer survives" do
          expect(subject.power_consumption).to eq 2583164
        end
      end

      describe "Part 2" do
        it "actual answer above" do
          pp subject.life_support_rating
        end

        it "answer survives" do
          expect(subject.life_support_rating).to eq 2784375
        end
      end
    end
  end
end
