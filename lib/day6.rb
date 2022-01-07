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
      school.spawn_and_age
    end
  end

  private

  def set_initial_fish_state
    initial_data = File.read(path)
    timers = initial_data.split(",").map(&:to_i)

    fishes = timers.map do |timer|
      Fish.new(timer: timer)
    end

    School.new(fishes)
  end
end

class School
  attr_accessor :fishes

  def initialize(fishes)
    @fishes = fishes
  end

  def size
    @fishes.size
  end

  def spawn_and_age
    new_fishes = []

    fishes.each do |fish|
      new_fishes << Fish.new(timer: 8) if fish.timer == 0
      fish.cycle
    end

    self.fishes = [*fishes, *new_fishes]
  end
end

class Fish
  attr_accessor :timer

  def initialize(timer:)
    @timer = timer
  end

  def cycle
    if timer > 0
      self.timer -= 1
    else
      self.timer = 6
    end
  end
end
