require "./measurements"

class Day1
  def self.increases_by_window
    total = 0

    measurements.each_with_index do |measurement, index|
      next if index < 2

      total += 1 if bigger_window_than_previous?(index)
      puts "total #{total}"
    end

    total
  end

  def self.increases
    total = 0

    # measurements.each_with_object(0).with_index do |(measurement, total), index|
    measurements.each_with_index do |measurement, index|
      next if index == 0

      total += 1 if bigger_than_previous?(index)
    end

    total
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
