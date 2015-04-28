def stock_picker days
	best_buy_day = 0
	best_sell_day = 1
	max_profit = days[best_sell_day] - days[best_buy_day]

	days.length.times do |buy_day|
		buy_day.upto(days.length - 1) do |sell_day|
			profit = days[sell_day] - days[buy_day]
			if profit > max_profit then
				max_profit = profit
				best_buy_day = buy_day
				best_sell_day = sell_day
			end
		end
	end
	return [best_buy_day, best_sell_day]
end