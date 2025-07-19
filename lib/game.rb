# game.rb
require_relative 'player'
require_relative 'computer'

class Game
  def initialize
    @human_player = Player.new
    @computer_player = Computer.new
  end

  def start
    puts "Would you like to guess the computer's code or create the code yourself? (1 or 2):"
    choice = gets.chomp.to_i
    while choice != 1 && choice != 2
      puts 'Not valid, enter 1 or 2'
      choice = gets.chomp.to_i
    end

    if choice == 1
      code = @computer_player.choose_code
      12.times do
        guess = @human_player.guess
        if guess == code
          puts 'You won!'
          return true
        end
        puts feedback(code, guess).join(' ')
      end
      puts 'You lost! Game over!'
      false
    else
      player_code = @human_player.choose_code
      guessed = @computer_player.guess_code(player_code)
      12.times do
        if guessed == player_code
          puts "Computer guessed your code: #{guessed.join(' ')}"
          return true
        else
          puts "Computer guesses: #{guessed.join(' ')}"
          # For now, just guess again (no feedback logic here)
          guessed = @computer_player.guess_code(player_code)
        end
      end
      puts 'Computer failed to guess your code!'
      false
    end
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