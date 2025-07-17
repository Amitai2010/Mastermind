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
      message = ''
      if code == guess
        puts 'you guessed currectly!'
        return true
      else
        guess.each_with_index do |color, index|
          if color == code[index]
            message += ' correct'
          else
            if code.any? { |code_color| code_color == color}
              message += ' different_place'
            else
              message += ' wrong_color'
            end
          end
        end
        puts message
      end
    end
    puts 'you lost! game over!'
    false
  end
end