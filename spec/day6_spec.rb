require "spec_helper"
require "day6"

describe Day6 do
  it do

    fishes = lantern_fish(days: 1)
    fishes.run
    expect(fishes.school.size).to eq 5

    fishes = lantern_fish(days: 2)
    fishes.run
    expect(fishes.school.size).to eq 6

    fishes = lantern_fish(days: 2)
    fishes.run
    expect(fishes.school.size).to eq 6

    fishes = lantern_fish(days: 3)
    fishes.run
    expect(fishes.school.size).to eq 7

    fishes = lantern_fish(days: 4)
    fishes.run
    expect(fishes.school.size).to eq 9

    fishes = lantern_fish(days: 18)
    fishes.run
    expect(fishes.school.size).to eq 26
  end

  it do
    fishes = lantern_fish(days: 80)
    fishes.run

    expect(fishes.school.size).to eq 5934
  end

  it do
    fishes = lantern_fish(days: 256)
    fishes.run

    expect(fishes.school.size).to eq 26984457539
  end

  private

  def lantern_fish(days:)
    # Day6.new(days: days, path: "lib/lantern_fish.txt")
    Day6.new(days: days, path: "spec/support/lantern_fish.txt")
  end
end
