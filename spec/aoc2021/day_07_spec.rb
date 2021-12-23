module Aoc2021
  RSpec.describe TreacheryOfWhales do
    context "Sample" do
      before(:all) do
        @subject = TreacheryOfWhales.new Support.file_to_list __FILE__.gsub('spec.rb', 'sample.txt')
      end
      subject { @subject }

      describe "Part 1" do
        it "sample data agrees" do
          expect(subject.cheapest_dance).to eq 37
        end
      end

      describe "Part 2" do
        it "sample data agrees" do
          expect(subject.cheapest_dance_struggle).to eq 168
        end
      end
    end

    context "Actual" do
      before(:all) do
        @subject = TreacheryOfWhales.new Support.file_to_list __FILE__.gsub('spec.rb', 'actual.txt')
      end
      subject { @subject }

      describe "Part 1" do
        it "actual answer above" do
          pp subject.cheapest_dance
        end

        # too low
        it "results survive" do
          expect(subject.cheapest_dance).to eq 337488
        end
      end

      describe "Part 2" do
        it "actual answer above" do
          pp subject.cheapest_dance_struggle
        end

        it "results survive" do
          expect(subject.cheapest_dance_struggle).to eq 89647695
        end
      end
    end
  end
end

