require_relative 'player'
require_relative 'computer'

class Game
  def initialize
    @human_player = Player.new
    @computer_player = Computer.new
  end

  def start
    code = @computer_player.choose_code
    12.times do
      guess = @human_player.guess
      if guess == code
        puts 'you won!'
        return true
      end
      puts feedback(code, guess).join(' ')

    end
    puts 'you lost! game over!'
    false
  end

  private

  def feedback(code, guess)
    code_copy = code.dup
    feedback = []

    guess.each_with_index do |color, index|
      if color == code_copy[index]
        feedback.push('correct')
        code_copy[index] = nil
        next
      end
      if code_copy.include?(color)
        feedback.push('different_place')
        code_copy[code_copy.index(color)] = nil
      else
        feedback.push('incorrect')
      end
    end
    feedback
  end
end