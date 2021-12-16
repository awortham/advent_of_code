class Day4
  attr_reader :filepath
  attr_accessor :most_recent_number, :winning_table

  def initialize(filepath)
    @filepath = filepath
  end

  def play
    until winning_table
      play_turn
    end
  end

  def play_turn
    numbers = numbers_called(5)

    numbers.each do |number|
      self.most_recent_number = number

      tables.each do |table|
        table.apply_numbers(number)
      end
      check_for_winning_table
      return unless winning_table.nil?
    end
  end

  def check_for_winning_table
    winners = tables.select(&:wins?)
    require 'pry'; binding.pry if winners.length > 0
    self.winning_table = tables.find(&:wins?)
  end

  def winning_table_score
    winning_table.score * most_recent_number.to_i
  end

  def numbers_called(number)
    moves.shift(number)
  end

  def moves
    @moves ||= split_bingo_data[0].split(",")
  end

  def tables
    @tables ||=
      split_bingo_data[1..-1].map do |table_data|
        rows = build_rows(table_data)
        columns = build_columns(table_data)

        Table.new(columns: columns, rows: rows)
      end
  end

  private

  def build_rows(table_data)
    table_data.split("\n").map { |row| Row.new(row.split(" ")) }
  end

  def build_columns(table_data)
    table_data
      .split("\n")
      .map { |r| r.split(" ") }
      .transpose
      .map { |row| Row.new(row) }
  end

  def split_bingo_data
    read_bingo_data.split("\n\n")
  end

  def read_bingo_data
    File.read(filepath)
  end
end

class Table
  attr_reader :columns, :rows

  def initialize(columns:, rows:)
    @columns = columns
    @rows = rows
  end

  def apply_numbers(number)
    rows.map { |row| row.mark(number) }
    columns.map { |column| column.mark(number) }
  end

  def score
    rows.map { |row| row.score }.reduce(:+)
  end

  def wins?
    rows.any? { |row| row.all_marked? } ||
      columns.any? { |column| column.all_marked? }
  end
end

class Row
  attr_reader :digits

  def initialize(digits)
    markers = Array.new(digits.length, "")
    combo = digits.zip(markers)
    markable_digits = Hash[*combo.flatten(1)]

    @digits = markable_digits
  end

  def score
    digits.reduce(0) do |acc, (key, value)|
      if value == ""
        acc += key.to_i
      else
        acc
      end

      acc
    end
  end

  def all_marked?
    digits.values.all? { |v| v == "marked" }
  end

  def mark(number)
    if digits[number] == ""
      digits[number] = "marked"
    end
  end
end
