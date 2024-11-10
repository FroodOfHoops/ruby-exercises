prices = [17, 3, 6, 9, 15, 8, 6, 1, 10]

def stock_picker(stocks)
  num = stocks.length
  profit = 0
  grid = Array.new(num) { [] }
  for i in 0..num - 2
    for j in i + 1..num - 1
      grid[i][j - i - 1] = stocks[j] - stocks[i]
    end
    next unless grid[i].max > profit

    profit = grid[i].max
    best_buy = i + 1
    best_sell = grid[i].index(profit) + i + 2
  end
  return 'No worthwhile trade.' if profit == 0

  "Buy on day #{best_buy} and sell on day #{best_sell} for a profit of #{profit}."
end

puts stock_picker(prices)
