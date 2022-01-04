module Aoc2021
  RSpec.describe SmokeBasin do
    context "Predicates" do
      describe "##is_valley?" do
        it "accepts with one value" do
          expect(SmokeBasin.is_valley? 0).to be true
        end

        it "accepts with any one value" do
          expect(SmokeBasin.is_valley? 1337).to be true
        end

        context "finds these valleys" do
          it "one adjacent, craggy" do
            expect(SmokeBasin.is_valley? 0, 1).to be true
          end

          it "two adjacent, plateau" do
            expect(SmokeBasin.is_valley? 0, 1, 1).to be true
          end

          it "two adjacent, craggy" do
            expect(SmokeBasin.is_valley? 0, 1, 2).to be true
          end

          it "three adjacent, plateau" do
            expect(SmokeBasin.is_valley? 0, 1, 1, 4).to be true
          end

          it "three adjacent, craggy" do
            expect(SmokeBasin.is_valley? 0, 1, 2, 4).to be true
          end

          it "four adjacent, plateau" do
            expect(SmokeBasin.is_valley? 0, 1, 2, 5, 5).to be true
          end

          it "four adjacent, craggy" do
            expect(SmokeBasin.is_valley? 0, 1, 2, 5, 6).to be true
          end
        end

        context "these are not valleys" do
          it "one adjacent, plateau" do
            expect(SmokeBasin.is_valley? 0, 0).to be false
          end

          it "one adjacent, craggy" do
            expect(SmokeBasin.is_valley? 11, 0).to be false
          end

          it "two adjacent, plateau" do
            expect(SmokeBasin.is_valley? 11, 1, 1).to be false
          end

          it "two adjacent, craggy" do
            expect(SmokeBasin.is_valley? 11, 1, 2).to be false
          end

          it "three adjacent, plateau" do
            expect(SmokeBasin.is_valley? 11, 1, 1, 4).to be false
          end

          it "three adjacent, craggy" do
            expect(SmokeBasin.is_valley? 11, 1, 2, 4).to be false
          end

          it "four adjacent, plateau" do
            expect(SmokeBasin.is_valley? 11, 1, 2, 5, 5).to be false
          end

          it "four adjacent, craggy" do
            expect(SmokeBasin.is_valley? 11, 1, 2, 5, 6).to be false
          end
        end
      end
    end

    context "Sample" do
      before(:all) do
        @subject = SmokeBasin.new Support.file_to_list __FILE__.gsub('spec.rb', 'sample.txt')
      end
      subject { @subject }

      describe "Part 1" do
        it "sample data agrees" do
          expect(subject.sum_of_low_points).to eq 15
        end
      end

      describe "Part 2" do
        it "sample data agrees" do
          expect(subject.avoidance).to eq 1134
        end
      end
    end

    context "Actual" do
      before(:all) do
        @subject = SmokeBasin.new Support.file_to_list __FILE__.gsub('spec.rb', 'actual.txt')
      end
      subject { @subject }

      describe "Part 1" do
        it "actual answer above" do
          pp subject.sum_of_low_points
        end

        it "results survive" do
          expect(subject.sum_of_low_points).to eq 631
        end
      end

      describe "Part 2" do
        it "actual answer above" do
          pp subject.avoidance
        end

        it "results survive" do
          expect(subject.avoidance).to eq 821560
        end
      end
    end

    context "All Kinds of Basins" do
      before(:all) do
        @subject = SmokeBasin.new Support.file_to_list __FILE__.gsub('spec.rb', 'sample_all_basins.txt')
      end
      subject { @subject }

      describe "Part 1" do
        it "manual answer agrees" do
          expect(subject.sum_of_low_points).to eq 53
        end
      end

      describe "Part 2" do
        it "manual answer agrees" do
          expect(subject.avoidance).to eq 900
        end
      end
    end

    context "Adjacent Basins" do
      before(:all) do
        @subject = SmokeBasin.new Support.file_to_list __FILE__.gsub('spec.rb', 'sample_adjacents.txt')
      end
      subject { @subject }

      describe "Part 1" do
        it "manual answer agrees" do
          expect(subject.sum_of_low_points).to eq 10
        end
      end

      describe "Part 2" do
        it "manual answer agrees" do
          expect(subject.avoidance).to eq 8
        end
      end
    end
  end
end

