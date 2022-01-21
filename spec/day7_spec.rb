require "spec_helper"
require "day7"

describe Day7 do
  it "part 1" do
    subs = crabs_positions
    subs.align

    expect(subs.final_position).to eq 2
    expect(subs.fuel).to eq 37
  end

  it "part 2" do
    subs = crabs_positions
    subs.align_exponential

    expect(subs.final_position).to eq 5
    expect(subs.fuel).to eq 168
  end

  private

  def crabs_positions
    # Day7.new(path: "lib/crabs.txt")
    Day7.new(path: "spec/support/crabs.txt")
  end
end
