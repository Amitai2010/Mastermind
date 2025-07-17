class Player
  def initialize
    @colors = {
  "R" => "Red",
  "G" => "Green",
  "B" => "Blue",
  "Y" => "Yellow",
  "W" => "White",
  "K" => "Black"
    }
  end

  def guess
    puts 'Input your guess (e.g. R G B Y): '
    input = gets.chomp.upcase.split
    until input.all? { |c| @colors.key?(c) }
      puts 'Invalid input, try again (use only these letters: R G B Y W K)'
      input = gets.chomp.upcase.split
    end
    input.map { |c| @colors[c] }
  end
end