class Day7
  attr_reader :path
  attr_accessor :final_position, :fuel

  def initialize(path:)
    @path = path
  end

  def align
    subs = initial_subs_positions

    max = subs.max
    min = subs.min
    fuel_possibilities = (min..max)

    foo = fuel_possibilities.each_with_object({}) do |number, acc|
      sum = subs.map do |sub|
        (sub - number).abs
      end.sum
      acc[number] = sum
    end

    winner = [foo.min_by { |key, value| value }].to_h

    self.final_position = winner.keys.first
    self.fuel = winner.values.first
  end

  private

  def load_data
    File.read(path)
  end

  def initial_subs_positions
    load_data.split(",").map(&:to_i)
  end
end
