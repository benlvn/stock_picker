def stock_picker(prices)
	buy_day = 0 #Numerical day to buy the stock
	sell_day = 0 #Numerical day to sell the stock
	max_profit = 0 #Maximum profits from buying and selling stock
	prices.each_with_index do |price, ind|
		#iterate through each price
		future_prices = prices - prices[0..ind] #An array excluding the current day's price and all those before it
		future_prices.each_with_index do |future_price, future_ind|
			#iterate through the future prices
			profit = future_price - price #potential profits from buying and selling at these prices
			if profit > max_profit
				#If this profit is larger than any previously found profits
				buy_day = ind
				sell_day = future_ind + ind + 1
				max_profit = profit
			end
		end
	end
	return [buy_day, sell_day]
end
