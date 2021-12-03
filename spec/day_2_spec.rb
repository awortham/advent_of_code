require "spec_helper"
require "day2"

describe Day2 do
  describe "getters" do
    it "has reader attributes" do
      sub = submarine

      expect(sub.aim).to eq 0
      expect(sub.depth).to eq 0
      expect(sub.horizontal).to eq 0
    end
  end

  describe "#direct_submarine" do
    it do
      sub = submarine

      sub.direct_submarine

      expect(sub.horizontal).to eq 15
      expect(sub.depth).to eq 60
      expect(sub.aim).to eq 10
      expect(sub.travel).to eq 900
    end
  end

  private

  def submarine
    # Day2.new("lib/movements.txt")
    Day2.new("spec/support/movements.txt")
  end
end
