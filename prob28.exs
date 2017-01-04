import Kernel

defmodule Problem28 do
	def solve() do
		spiral_dimension = 1001

		# Find number of layers
		upper_limit = trunc((spiral_dimension + 1)/2)

		Enum.map(2..upper_limit, fn x -> x * 2 - 1 end)
		|> Enum.map(fn layer -> (
			upper_right = :math.pow layer, 2
			(upper_right * 4) - 6 * (layer - 1)
		) end)
		|> Enum.sum
		|> Kernel.+(1) # Add one for center
		|> trunc
	end
end


IO.puts Problem28.solve