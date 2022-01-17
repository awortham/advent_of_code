require "spec_helper"
require "day7"

describe Day7 do
  it do
    subs = crabs_positions
    subs.align

    require 'pry'; binding.pry
    expect(subs.final_position).to eq 2
    expect(subs.fuel).to eq 37
  end

  private

  def crabs_positions
    Day7.new(path: "lib/crabs.txt")
    # Day7.new(path: "spec/support/crabs.txt")
  end
end
