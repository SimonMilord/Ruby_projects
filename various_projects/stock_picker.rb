def stock_picker(prices)
  profit = 0
  days = [0,0]

  while prices.length > 1
    min_p = prices.min
    index_min = prices.index(min_p)
    max_p = prices[index_min..].max

    if max_p - min_p > profit
      profit = max_p - min_p
      days = [prices.index(min_p), prices.index(max_p)]
    end
    prices = prices[0...index_min]
  end
  days
end

prices = [17,3,6,9,15,8,6,1,10]

puts (stock_picker(prices))


# Implement a method #stock_picker that takes in an array of stock prices, one for each hypothetical day. 
# It should return a pair of days representing the best day to buy and the best day to sell. Days start at 0.
#   > stock_picker([17,3,6,9,15,8,6,1,10])
#   => [1,4]  # for a profit of $15 - $3 == $12


# TIPS: you need to buy before you sell
# Pay attention to edge cases like when the lowest day is the last day or the highest day is the first day.     