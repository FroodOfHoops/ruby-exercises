# create a tic-tac-toe player
class Player
  def initialize(num)
    @num = num
  end

  def turn
    loop do
      puts "Player #{@num}, choose a square (1-9):"
      move = gets.chomp.to_i
      if move.between?(1, 9)
        a = ((move - 1) / 3).floor
        b = (move - 1) % 3
        return [a, b]
      else
        puts "Please enter a digit from 1 to 9."
      end
    end
  end
end
