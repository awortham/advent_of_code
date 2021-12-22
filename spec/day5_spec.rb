require "day5"

describe Day5 do
  it do
    lines = vents
    lines.run

    expect(lines.overlapping_points.size).to eq 5
  end

  private

  def vents
    # Day5.new("lib/vents.txt")
    Day5.new("spec/support/vents.txt")
  end
end
