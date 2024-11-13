require_relative "player"
require_relative "board"

def check_win(board)
  win_lines = []
  win_lines[1] = board[0] + board[1] + board[2]
  win_lines[2] = board[3] + board[4] + board[5]
  win_lines[3] = board[6] + board[7] + board[8]
  win_lines[4] = board[0] + board[3] + board[6]
  win_lines[5] = board[1] + board[4] + board[7]
  win_lines[6] = board[2] + board[5] + board[8]
  win_lines[7] = board[0] + board[4] + board[8]
  win_lines[8] = board[2] + board[4] + board[6]

  return "X" if win_lines.include?("XXX")
  return "O" if win_lines.include?("OOO")

  nil
end

board = []
9.times { board.push(" ") }
player1 = Player.new(1)
player2 = Player.new(2)

Board.print(board)

loop do
  square = player1.turn
  while board[square] != " "
    puts "Please choose an empty square."
    square = player1.turn
  end
  board[square] = "X"

  Board.print(board)
  break unless board.include?(" ")
  break unless check_win(board).nil?

  square = player2.turn
  while board[square] != " "
    puts "Please choose an empty square."
    square = player1.turn
  end
  board[square] = "O"

  Board.print(board)
  break unless board.include?(" ")
  break unless check_win(board).nil?
end

case check_win(board)
when "X" then puts "Player 1 wins!"
when "O" then puts "Player 2 wins!"
else puts "It's a draw!"
end
