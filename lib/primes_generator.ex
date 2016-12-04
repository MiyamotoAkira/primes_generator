defmodule PrimesGenerator do
  def generate_prime(number_of_primes) do
	Enum.take(Stream.unfold([],
		  fn(generated) ->
			next_prime = select_next_prime(generated)
			{next_prime, [next_prime | generated]}
		  end),
	  number_of_primes)
  end

  defp select_next_prime([]), do: 2
  defp select_next_prime(generated) do
	next = List.first(generated) + 1
	Stream.iterate(next, &(&1+1))
	|> Stream.drop_while(fn(candidate) ->
	  Enum.any?(generated, fn(x) ->
		rem(candidate, x) == 0
	  end)
	end)
	|> Stream.take(1)
	|> Enum.to_list
	|> List.first
  end
end
