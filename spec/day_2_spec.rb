require "spec_helper"
require "day2"

describe Day2 do
  describe "movements" do
    describe "#down" do
      it "has a down attribute" do
        sub = submarine

        expect(sub.down).to eq 0
      end

      it "can set it" do
        sub = submarine
        sub.down = 1

        expect(sub.down).to eq 1
      end
    end

    describe "#forward" do
      it "has a forward attribute" do
        sub = submarine

        expect(sub.forward).to eq 0
      end

      it "can set it" do
        sub = submarine
        sub.forward = 1

        expect(sub.forward).to eq 1
      end
    end

    describe "#up" do
      it "has an up attribute" do
        sub = submarine

        expect(sub.up).to eq 0
      end

      it "can set it" do
        sub = submarine
        sub.up = 1

        expect(sub.up).to eq 1
      end
    end
  end

  describe "#direct_submarine" do
    it do
      sub = submarine

      sub.direct_submarine

      expect(sub.horizontal).to eq 15
      expect(sub.depth).to eq 10
      expect(sub.travel).to eq 150
    end
  end

  private

  def submarine
    # Day2.new("lib/movements.txt")
    Day2.new("spec/support/movements.txt")
  end
end
