require_relative "player"

def check_win(board)
  win_lines = []
  3.times { |i| win_lines.push(board[i].join) }

  3.times do |j|
    y_line = board[0][j] + board[1][j] + board[2][j]
    # can turn column into 3-char string as separate module
    win_lines.push(y_line)
  end

  # separate diagonal function out too
  diagonal1 = board[0][0] + board[1][1] + board[2][2]
  diagonal2 = board[2][0] + board[1][1] + board[0][2]
  win_lines.push(diagonal1).push(diagonal2)

  win_lines.map! { |i| i.gsub(" ", "") }

  return "X" if win_lines.include?("XXX")
  return "O" if win_lines.include?("OOO")
  nil
end

def print_board(board)
  grid = []
  3.times do |x|
    grid[x] = []
    grid[x] = board[x].map { |xo| "  #{xo}  " }
  end
  row1 = grid[0].join("|")
  row2 = grid[1].join("|")
  row3 = grid[2].join("|")
  top_top = "1    |2    |3    "
  top_mid = "4    |5    |6    "
  top_low = "7    |8    |9    "
  gap =  "     |     |     "
  line = "- - -|- - -|- - -"

  puts top_top
  puts row1
  puts gap
  puts line
  puts top_mid
  puts row2
  puts gap
  puts line
  puts top_low
  puts row3
  puts gap
end

board = Array.new(3) { Array.new(3, " ") }
player1 = Player.new(1)
player2 = Player.new(2)
moves = 0

print_board(board)

loop do
  square = player1.turn
  while board[square[0]][square[1]] != " "
    puts "Please choose an empty square."
    square = player1.turn
  end
  board[square[0]][square[1]] = "X"
  moves += 1

  print_board(board)
  break if moves > 8
  break unless check_win(board).nil?

  square = player2.turn
  while board[square[0]][square[1]] != " "
    puts "Please choose an empty square."
    square = player1.turn
  end
  board[square[0]][square[1]] = "O"
  moves += 1

  print_board(board)
  break if moves > 8
  break unless check_win(board).nil?
end

case check_win(board)
when "X" then puts "Player 1 wins!"
when "O" then puts "Player 2 wins!"
else puts "It's a draw!"
end
