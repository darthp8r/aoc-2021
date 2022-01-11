module Aoc2021
  RSpec.describe PassagePathing do
    context "Small Sample" do
      before(:all) do
        @subject = PassagePathing.new Support.file_to_list __FILE__.gsub('spec.rb', 'small_sample.txt')
      end
      subject { @subject }

      describe "Part 1" do
        it "sample data agrees" do
          expect(subject.cave_paths).to eq 10
        end
      end

      describe "Part 2" do
        it "sample data agrees" do
          expect(subject.cave_paths_reconsidered).to eq 36
        end
      end
    end

    context "Medium Sample" do
      before(:all) do
        @subject = PassagePathing.new Support.file_to_list __FILE__.gsub('spec.rb', 'medium_sample.txt')
      end
      subject { @subject }

      describe "Part 1" do
        it "sample data agrees" do
          expect(subject.cave_paths).to eq 19
        end
      end

      describe "Part 2" do
        it "sample data agrees" do
          expect(subject.cave_paths_reconsidered).to eq 103
        end
      end
    end

    context "Large Sample" do
      before(:all) do
        @subject = PassagePathing.new Support.file_to_list __FILE__.gsub('spec.rb', 'large_sample.txt')
      end
      subject { @subject }

      describe "Part 1" do
        it "sample data agrees" do
          expect(subject.cave_paths).to eq 226
        end
      end

      describe "Part 2" do
        it "sample data agrees" do
          expect(subject.cave_paths_reconsidered).to eq 3509
        end
      end
    end

    context "Actual" do
      before(:all) do
        @subject = PassagePathing.new Support.file_to_list __FILE__.gsub('spec.rb', 'actual.txt')
      end
      subject { @subject }

      describe "Part 1" do
        it "actual answer above" do
          pp subject.cave_paths
        end

        it "results survive" do
          expect(subject.cave_paths).to eq 3802
        end
      end

      describe "Part 2" do
        it "actual answer above" do
          pp subject.cave_paths_reconsidered
        end

        it "results survive" do
          expect(subject.cave_paths_reconsidered).to eq 99448
        end
      end
    end
  end
end

