require "measurements"

class Day1
  def self.increases_by_window
    measurements.each_with_index.reduce(0) do |total, (measurement, index)|
      if index > 1 && bigger_window_than_previous?(index)
        total += 1
      end

      total
    end
  end

  def self.increases
    measurements.each_with_index.reduce(0) do |total, (measurement, index)|
      if index != 0 && bigger_than_previous?(index)
        total += 1
      end

      total
    end
  end

  def self.measurements
    @_measurements ||= Measurements.day_1
  end

  def self.bigger_than_previous?(index)
    measurements[index] > measurements[index - 1]
  end

  def self.bigger_window_than_previous?(index)
    previous = index - 1

    sum_of_window(index_range(index)) > sum_of_window(index_range(previous))
  end

  def self.sum_of_window(range)
    measurements[range].sum
  end

  def self.index_range(index)
    (index - 1)..(index + 1)
  end
end
