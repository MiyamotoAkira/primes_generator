defmodule PrimesGenerator do
  def generate_prime numberOfPrimes do
	case numberOfPrimes do
	  1 -> [2]
	  2 -> [2, 3]
	end
  end
end
