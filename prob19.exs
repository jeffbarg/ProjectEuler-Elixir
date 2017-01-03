# From http://stackoverflow.com/questions/478694/what-is-the-easiest-algorithm-to-find-the-day-of-week-of-day-zero-of-a-given-yea
# Day of the week formula
# dayOfWeek = (year*365 + trunc((year-1) / 4) - trunc((year-1) / 100) +
#             trunc((year-1) / 400)) % 7

defmodule Problem19 do
	def solve() do


		month_value = {
			1,
			4,
			4,
			0,
			2,
			5,
			0,
			3,
			6,
			1,
			4,
			6
		}
		years = 1900..1999
		months = 0..11

		Enum.zip(years, months)
			|> Enum.map(
			fn year_month -> (
				IO.puts rem 9, 7
				year = elem year_month, 0
				month = elem year_month, 1

				# Take the last two digits of the year.
				day_of_week = rem year, 100

				# Divide by 4, discarding any fraction.
				day_of_week = day_of_week / 4

				# Add the day of the month.
				day_of_week = day_of_week + 1

				
				# Add the month's key value: 
				day_of_week = day_of_week + elem month_value, month

				# Subtract 1 for January or February of a leap year.
				day_of_week = cond do
				   rem year, 4 == 0 and month <= 1 -> 
				   	day_of_week - 1
				   true ->
					day_of_week
				end

				# For a Gregorian date, add 0 for 1900's, 6 for 2000's, 4 for 1700's, 2 for 1800's; for other years, add or subtract multiples of 400.

				# For a Julian date, add 1 for 1700's, and 1 for every additional century you go back.

				# Add the last two digits of the year.
				day_of_week = day_of_week + (rem year, 100)

				# Divide by 7 and take the remainder.

				rem day_of_week, 7
			) end)

			|> Enum.count(fn day_of_week -> day_of_week == 6 end)
		
				# IO.puts month

				# if dayOfWeek == 6 do
				# 	totalSundays += 1
				# end
				# 0
	end
end


IO.puts Problem19.solve