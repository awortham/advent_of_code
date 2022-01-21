class Day7
  attr_reader :path
  attr_accessor :subs

  def initialize(path:)
    @path = path
    @subs = Subs.new(initial_subs_positions)
  end

  def align
    subs.align
  end

  def align_exponential
    subs.align_exponential
  end

  def final_position
    subs.final_position
  end

  def fuel
    subs.fuel
  end

  private

  def initial_subs_positions
    load_data.split(",").map(&:to_i)
  end

  def load_data
    File.read(path)
  end
end

class Subs
  attr_accessor :final_position, :fuel
  attr_reader :initial_positions

  def initialize(initial_positions)
    @initial_positions = initial_positions
  end

  def align
    figure_fuel_costs do |sub, number|
      (sub - number).abs
    end
  end

  def align_exponential
    figure_fuel_costs do |sub, number|
      figure_fuel_usage(sub, number)
    end
  end

  def max
    @_max ||= initial_positions.max
  end

  def min
    @_min ||= initial_positions.min
  end

  private

  def figure_fuel_costs(&block)
    costs = fuel_possibilities.each_with_object({}) do |number, acc|
      sum = initial_positions.map do |sub|
        yield sub, number
      end.sum

      acc[number] = sum
    end

    winner = [costs.min_by { |key, value| value }].to_h

    self.final_position = winner.keys.first
    self.fuel = winner.values.first
  end

  def figure_fuel_usage(start_position, end_position)
    number_of_slots = (start_position - end_position).abs

    (number_of_slots * (number_of_slots + 1)) / 2
  end

  def fuel_possibilities
    @_fuel_possibilities ||= min..max
  end
end
