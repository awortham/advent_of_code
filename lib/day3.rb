class Day3
  attr_reader :epsilon_rate,
    :filepath,
    :gamma_rate,
    :co2_scrubber_rating,
    :oxygen_rating

  def initialize(filepath)
    @epsilon_rate = 0
    @filepath = filepath
    @gamma_rate = 0
    @co2_scrubber_rating = 0
    @oxygen_rating = 0
  end

  def run_diagnostics
    @gamma_rate = figure_gamma_rate
    @epsilon_rate = figure_epsilon_rate
  end

  def power_consumption
    gamma_rate * epsilon_rate
  end

  def run_second_diagnostics
    @oxygen_rating = figure_oxygen_rating
    @co2_scrubber_rating = figure_co2_scrubber_rating
  end

  def life_support_rating
    oxygen_rating * co2_scrubber_rating
  end

  private

  def diagnostics
    @_diagnostics ||= read_diagnostics.split("\n")
  end

  def figure_epsilon_rate
    transpose_diagnostics.map do |row|
      row.min_by { |i| row.count(i) }
    end.join.to_i(2)
  end

  def figure_gamma_rate
    transpose_diagnostics.map do |row|
      row.max_by { |i| row.count(i) }
    end.join.to_i(2)
  end

  def number_to_keep_oxygen(new_row)
    zeroes, ones = new_row.partition { |bit| bit == "0" }

    ones.length >= zeroes.length ? "1" : "0"
  end

  def number_to_keep_scrubber(new_row)
    zeroes, ones = new_row.partition { |bit| bit == "0" }

    zeroes.length <= ones.length ? "0" : "1"
  end

  def figure_oxygen_rating
    x = diagnostics
    transposed = transpose(x)

    transposed.each_with_index.reduce(x) do |acc, (row, index)|
      if acc.length == 1
        acc
      else
        new_row = acc.map { |a| a.split("") }.transpose[index]
        keeper = number_to_keep_oxygen(new_row)

        acc.select { |number| number[index] == (keeper) }
      end
    end.first.to_i(2)
  end

  def figure_co2_scrubber_rating
    x = diagnostics
    transposed = transpose(x)

    transposed.each_with_index.reduce(x) do |acc, (row, index)|
      if acc.length == 1
        acc
      else
        new_row = acc.map { |a| a.split("") }.transpose[index]
        keeper = number_to_keep_scrubber(new_row)

        acc.select { |number| number[index] == (keeper) }
      end
    end.first.to_i(2)
  end

  def transpose_diagnostics
    transpose(diagnostics)
  end

  def transpose(numbers)
    numbers.map { |number| number.split("") }.transpose
  end

  def read_diagnostics
    File.read(filepath)
  end
end
