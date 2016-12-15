defmodule PrimesGenerator.Sieves.TrialDivisionImp do
  def generate_prime(number_of_primes) do
    Enum.take(Stream.unfold([],
          fn(generated) ->
            next_prime = select_next_prime(generated)
            {next_prime, [next_prime | generated]}
          end),
      number_of_primes)
  end

  defp select_next_prime([]) do
    2
  end

  defp select_next_prime([2]) do
    3
  end  
  
  defp select_next_prime(generated) do
    next = List.first(generated) + 2
    reversed = Enum.reverse(generated)
    Stream.iterate(next, &(&1+2))
    |> sieve(reversed)
    |> Stream.take(1)
    |> Enum.to_list
    |> List.first
  end

  defp sieve(numbers, generated) do
    Stream.drop_while(numbers,
      fn(candidate) ->
      max = :math.sqrt(candidate)
      Enum.any?(Stream.take_while(generated, &(&1 <= max)), fn(x) ->
        rem(candidate, x) == 0
      end)
    end)
  end
end
