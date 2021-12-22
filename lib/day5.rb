class Day5
  attr_reader :filepath
  attr_accessor :diagram

  def initialize(filepath)
    @filepath = filepath
  end

  def overlapping_points
    diagram.multiple_scores
  end

  def run
    self.diagram = Diagram.new(min, max)
    diagram.generate

    points.each { |position| diagram.track(position) }
  end

  private

  def all_lines
    read_vent_data.split("\n").map { |datum| Line.new(datum) }
  end

  def horizontal_and_vertical_lines
    all_lines.select { |line| line.horizontal? || line.vertical? }
  end

  def min
    points.flatten.min
  end

  def max
    points.flatten.max
  end

  def points
    @points ||= horizontal_and_vertical_lines.flat_map do |line|
      line.full_list_coordinates
    end
  end

  def read_vent_data
    File.read(filepath)
  end
end

class Line
  attr_reader :points

  def initialize(points)
    @points = points
  end

  def full_list_coordinates
    x_range = range(x_coordinates.first, x_coordinates.last)
    y_range = range(y_coordinates.first, y_coordinates.last)

    if x_range.length > y_range.length
      y_range = fill_out_short_range(short: y_range, long: x_range)
    elsif x_range.length < y_range.length
      x_range = fill_out_short_range(short: x_range, long: y_range)
    end

    x_range.zip(y_range)
  end

  def horizontal?
    y_coordinates.uniq.length == 1
  end

  def vertical?
    x_coordinates.uniq.length == 1
  end

  private

  def endpoint_coordinates
    points
      .split(" -> ")
      .map { |reading| reading.split(",").map(&:to_i) }
      .transpose
  end

  def fill_out_short_range(short:, long:)
    character_to_add = short.last
    number_of_times_to_add = long.length - short.length

    number_of_times_to_add.times { short << character_to_add }
    short
  end

  def range(first, last)
    if first > last
      last.upto(first).to_a.reverse
    else
      first.upto(last).to_a
    end
  end

  def x_coordinates
    endpoint_coordinates.first
  end

  def y_coordinates
    endpoint_coordinates.last
  end
end

class Diagram
  attr_reader :min, :max
  attr_accessor :positions

  def initialize(min, max)
    @min = min
    @max = max
    @postions = {}
  end

  def generate
    size = (min..max).to_a

    rows = size.reduce([]) do |acc, (row_num)|
      row = size.reduce([]) {|acc, n| acc << [row_num, n] }
      acc << row
    end.flatten(1)

    self.positions =
      rows.each_with_object({}) { |position, acc| acc[position] = 0 }
  end

  def multiple_scores
    positions.select { |_key, value| value > 1 }
  end

  def track(position)
    positions[position] = positions[position] += 1
  end
end
