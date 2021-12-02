class Day2
  attr_reader :depth, :file_name, :horizontal

  def initialize(file_name)
    @depth = 0
    @file_name = file_name
    @horizontal = 0
  end

  def direct_submarine
    movements.each do |movement|
      command, units = movement.split(" ")
      units = units.to_i

      send(command, units)
    end
  end

  def travel
    horizontal * depth
  end

  private

  def down(units)
    @depth += units
  end

  def forward(units)
    @horizontal += units
  end

  def movements
    @movements ||= read_movements.split("\n")
  end

  def read_movements
    File.read(file_name)
  end

  def up(units)
    @depth -= units
  end
end
