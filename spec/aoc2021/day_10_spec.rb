module Aoc2021
  RSpec.describe SyntaxScoring do
    context "Sample" do
      before(:all) do
        @subject = SyntaxScoring.new Support.file_to_list __FILE__.gsub('spec.rb', 'sample.txt')
      end
      subject { @subject }

      describe "Part 1" do
        it "dunsels" do
        end

        it "sample data agrees" do
          expect(subject.error_score).to eq 26397
        end
      end

      describe "Part 2" do
        it "sample data agrees" do
          expect(subject.auto_complete).to eq 288957
        end
      end
    end

    context "Actual" do
      before(:all) do
        @subject = SyntaxScoring.new Support.file_to_list __FILE__.gsub('spec.rb', 'actual.txt')
      end
      subject { @subject }

      describe "Part 1" do
        it "actual answer above" do
          pp subject.error_score
        end

        it "results survive" do
          expect(subject.error_score).to eq 321237
        end
      end

      describe "Part 2" do
        it "actual answer above" do
          pp subject.auto_complete
        end

        it "results survive" do
          expect(subject.auto_complete).to eq 2360030859
        end
      end
    end
  end
end

