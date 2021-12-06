require "spec_helper"
require "day3"

describe Day3 do
  describe "#run_diagnostics" do
    it "sets all the rates" do
      checks = diagnostics

      checks.run_diagnostics

      expect(checks.gamma_rate).to eq 22
      expect(checks.epsilon_rate).to eq 9
      expect(checks.power_consumption).to eq 198
    end
  end

  describe "#run_second_diagnostics" do
    it "sets the rates" do
      checks = diagnostics

      checks.run_second_diagnostics

      expect(checks.oxygen_rating).to eq 23
      expect(checks.co2_scrubber_rating).to eq 10
      expect(checks.life_support_rating).to eq 230
    end
  end

  private

  def diagnostics
    # Day3.new("lib/diagnostics.txt")
    Day3.new("spec/support/diagnostics.txt")
  end
end
