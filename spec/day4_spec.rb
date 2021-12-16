require "spec_helper"
require "day4"

describe Day4 do
  describe "#bingo" do
    it do
      game = bingo

      game.play

      score = game.winning_table_score

      expect(score).to be 4512
    end
  end

  private

  def bingo
    Day4.new("lib/bingo.txt")
    # Day4.new("spec/support/bingo.txt")
  end
end
