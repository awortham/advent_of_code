require "day5"

describe Day5 do
  it do
    lines = vents
    lines.run

    expect(lines.overlapping_points.size).to eq 5
  end

  it "also needs diagonal lines" do
    lines = vents(diagonal: true)
    lines.run

    expect(lines.overlapping_points.size).to eq 12
  end

  private

  def vents(diagonal: false)
    # Day5.new("lib/vents.txt", diagonal)
    Day5.new("spec/support/vents.txt", diagonal)
  end
end
