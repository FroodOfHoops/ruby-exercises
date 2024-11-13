# create a tic-tac-toe player
class Player
  def initialize(num)
    @num = num
  end

  def turn
    loop do
      puts "Player #{@num}, choose a square (1-9):"
      move = gets.chomp.to_i
      return move - 1 if move.between?(1, 9)

      puts "Please enter a digit from 1 to 9."
    end
  end
end
