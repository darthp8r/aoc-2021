module Aoc2021
  RSpec.describe GiantSquid do
    context "Sample" do
      before(:all) do
        @subject = GiantSquid.new Support.file_to_list __FILE__.gsub('spec.rb', 'sample.txt')
      end
      subject { @subject }

      describe "Part 1" do
        it "reads the lottery" do
          expect(subject.lottery).to eq \
            [7,4,9,5,11,17,23,2,0,14,21,24,10,16,13,6,15,25,12,22,18,20,8,19,3,26,1]
        end

        it "dimension is five (5)" do
          expect(subject.dimension).to eq 5
        end

        it "first winner" do
          expect(subject.winners.first).to eq [188, 24]
        end

        it "unmarked product" do
          expect(subject.unmarked_products).to eq [4512, 2192, 1924]
        end

        it "sample data agrees" do
          expect(subject.unmarked_products.first).to eq 4512
        end
      end

      describe "Part 2" do
        it "sample data agrees" do
          expect(subject.unmarked_products.last).to eq 1924
        end
      end
    end

    context "Actual" do
      before(:all) do
        @subject = GiantSquid.new Support.file_to_list __FILE__.gsub('spec.rb', 'actual.txt')
      end
      subject do; @subject; end

      describe "Part 1" do
        it "actual answer above" do
          pp subject.unmarked_products.first
        end

        it "results survive" do
          expect(subject.unmarked_products.first).to eq 6592
        end
      end

      describe "Part 2" do
        it "actual answer above" do
          pp subject.unmarked_products.last
        end

        it "results survive" do
          expect(subject.unmarked_products.last).to eq 31755
        end
      end
    end

    context "Vertical Win" do
      before(:all) do
        @subject = GiantSquid.new Support.file_to_list __FILE__.gsub('spec.rb', 'sample_vertical_win.txt')
      end
      subject { @subject }

      describe "Fabricated Board" do
        it "unmarked product" do
          expect(subject.winners).to eq [[185, 14]]
        end
      end
    end
  end
end
