module Aoc2021
  RSpec.describe TransparentOrigami do
    context "Sample" do
      before(:all) do
        @subject = TransparentOrigami.new Support.file_to_list __FILE__.gsub('spec.rb', 'sample.txt')
      end
      subject { @subject }

      describe "Part 1" do
        it "sample data agrees, first fold" do
          expect(subject.first_fold[:chart].length).to eq 17
        end

        it "sample data agrees, to completion" do
          expect(subject.fold_all[:chart].length).to eq 16
        end

        it "sample data expresses, first fold" do
          expected = [
            "#.##..#..#.",
            "#...#......",
            "......#...#",
            "#...#......",
            ".#.#..#.###",
            "...........",
            "...........",
          ]
          expect(TransparentOrigami.dump(subject.first_fold)).to eq expected
        end

        it "sample data expresses, to completion" do
          expected = [
            "#####",
            "#...#",
            "#...#",
            "#...#",
            "#####",
            ".....",
            ".....",
          ]
          expect(TransparentOrigami.dump(subject.fold_all)).to eq expected
        end
      end
    end

    context "Actual" do
      before(:all) do
        @subject = TransparentOrigami.new Support.file_to_list __FILE__.gsub('spec.rb', 'actual.txt')
      end
      subject { @subject }

      describe "Part 1" do
        it "actual answer above" do
          pp subject.first_fold[:chart].length
        end

        it "results survive" do
          expect(subject.first_fold[:chart].length).to eq 837
        end
      end

      describe "Part 2" do
        it "actual answer above" do
          puts TransparentOrigami.dump(subject.fold_all).join("\n").gsub('.', ' ')
        end

        it "results survive" do
          expected = [
            "####.###..####..##..#..#..##..#..#.#..#.",
            "#....#..#....#.#..#.#.#..#..#.#..#.#..#.",
            "###..#..#...#..#....##...#....####.#..#.",
            "#....###...#...#.##.#.#..#....#..#.#..#.",
            "#....#....#....#..#.#.#..#..#.#..#.#..#.",
            "####.#....####..###.#..#..##..#..#..##..",
          ]
          expect(TransparentOrigami.dump subject.fold_all).to eq expected
        end
      end
    end
  end
end

