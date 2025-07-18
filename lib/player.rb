class Player
  def initialize
    @colors = {
  "R" => "Red",
  "G" => "Green",
  "B" => "Blue",
  "Y" => "Yellow",
  "W" => "White",
  "P" => "Pink"
    }
  end

  def guess
    puts 'Input your guess (format: X X X X; allowed colors: R G B Y W P): '
    input = gets.chomp.upcase.split
    until input.all? { |c| @colors.key?(c) }
      puts 'Invalid input, try again (use only these letters: R G B Y W P)'
      input = gets.chomp.upcase.split
    end
    input.map { |c| @colors[c] }
  end
end