class Day2
  attr_reader :aim, :depth, :file_name, :horizontal

  def initialize(file_name)
    @aim = 0
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
    @aim += units
  end

  def forward(units)
    @horizontal += units

    if @aim > 0
      @depth += (@aim * units)
    end
  end

  def movements
    @movements ||= read_movements.split("\n")
  end

  def read_movements
    File.read(file_name)
  end

  def up(units)
    @aim -= units
  end
end
