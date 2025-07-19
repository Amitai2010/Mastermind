# computer.rb
class Computer
  def initialize
    @colors = %w[Red Blue Green Yellow White Pink]
  end

  attr_reader :colors

  def choose_code
    @colors.sample(4)
  end

  def guess_code(secret_code)
    guessed_code = choose_code
    # Removed feedback call — not available here yet
    guessed_code.each_with_index do |color, index|
      # Just placeholder logic, or keep guessed_code as is
      guessed_code[index] = @colors.sample unless guessed_code[index]
    end
    guessed_code
  end
end
