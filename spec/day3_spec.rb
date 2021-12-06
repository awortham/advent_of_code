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

  private

  def diagnostics
    # Day3.new("lib/diagnostics.txt")
    Day3.new("spec/support/diagnostics.txt")
  end
end
