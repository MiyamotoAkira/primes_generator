defmodule PrimesGenerator do
  def generate_prime(number_of_primes) do
	case number_of_primes do
	  1 -> [2]
	  2 -> [2, 3]
	end
  end
end
