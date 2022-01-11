class Day6
  attr_reader :days, :path
  attr_accessor :school

  def initialize(days:, path:)
    @days = days
    @path = path
  end

  def run
    self.school = set_initial_fish_state

    days.times do
      school.cycle_and_spawn
    end
  end

  private

  def set_initial_fish_state
    initial_data = File.read(path)
    timers = initial_data.split(",").map(&:to_i)

    fish = timers.each_with_object({}) do |timer, acc|
      acc[timer] += 1 if acc[timer]
      acc[timer] = 1 unless acc[timer]
    end

    School.new(fish)
  end
end

class School
  attr_accessor :fishes, :new_cycle

  def initialize(fishes)
    @fishes = fishes
    @new_cycle = {}
  end

  def cycle_and_spawn
    cycle_fish
    spawn_fish

    self.fishes = new_cycle
    self.new_cycle = {}
  end

  def size
    fishes.reduce(0) do |acc, fish|
      acc += fish.last
    end
  end

  private

  def cycle_fish
    fishes.dup.each do |k, v|
      new_cycle[k - 1] = v
    end
  end

  def reproduces?
    new_cycle[-1]
  end

  def restart_cycle_of_fish
    new_cycle[6] += new_cycle[-1] if new_cycle[6]
    new_cycle[6] = new_cycle[-1] unless new_cycle[6]
  end

  def birth_new_fish
    new_fish = new_cycle[-1] || 1

    new_cycle[8] += new_fish if new_cycle[8]
    new_cycle[8] = new_fish unless new_cycle[8]
    new_cycle.delete(-1)
  end

  def spawn_fish
    if reproduces?
      restart_cycle_of_fish
      birth_new_fish
    end
  end
end
