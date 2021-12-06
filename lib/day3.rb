class Day3
  attr_reader :epsilon_rate, :filepath, :gamma_rate

  def initialize(filepath)
    @epsilon_rate = 0
    @filepath = filepath
    @gamma_rate = 0
  end

  def run_diagnostics
    @gamma_rate = figure_gamma_rate
    @epsilon_rate = figure_epsilon_rate
  end

  def power_consumption
    gamma_rate * epsilon_rate
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

  def transpose_diagnostics
    diagnostics.map { |number| number.split("") }.transpose
  end

  def read_diagnostics
    File.read(filepath)
  end
end
