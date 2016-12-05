defmodule BenchTiming do
  
  def run_for_1000 do
	result = PrimesGenerator.generate_prime(1000)
	{time, _} =  :timer.tc(Multiplication, :cross_multiplication, [result])
	IO.puts time
  end

  def run_for_10000 do
	result = PrimesGenerator.generate_prime(10000)
	{time, _} =  :timer.tc(Multiplication, :cross_multiplication, [result])
	IO.puts time
  end

end
