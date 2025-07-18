# A class for the computer
class Computer
  def initialize
    @colors = %w[Red Blue Green Yellow White Pink]
  end

  attr_reader :color

  def choose_code
    @colors.sample(4)
  end
end
