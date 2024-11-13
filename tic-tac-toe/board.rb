# create a board to print
module Board
  def self.print(grid)
    rows = []
    blank_row = "     |     |     "
    line_row = "- - -|- - -|- - -"

    # 0.upto(8) { |x| @grid[x] = " " if x >= @grid.length }

    rows[1] = "1    |2    |3   \n"
    rows[2] = "  #{grid[0]}  |  #{grid[1]}  |  #{grid[2]}  \n"
    rows[3] = blank_row + "\n"
    rows[4] = line_row + "\n"
    rows[5] = "4    |5    |6    \n"
    rows[6] = "  #{grid[3]}  |  #{grid[4]}  |  #{grid[5]}  \n"
    rows[7] = rows[3]
    rows[8] = rows[4]
    rows[9] = "7    |8    |9    \n"
    rows[10] = "  #{grid[6]}  |  #{grid[7]}  |  #{grid[8]}  \n"
    rows[11] = rows[3]
    final_board = rows.join
    puts final_board
  end
end
