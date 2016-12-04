defmodule ConsoleEntry do
  import PrimesGenerator

  def main(args) do
	args
	|> parse_args
	|> process
	|> IO.puts
  end

  def parse_args(args) do
	{switches, number_of_primes, invalid} = OptionParser.parse(args, strict: [help: :boolean], aliases: [h: :help])
	cond do
	  Enum.count(invalid) > 0 -> {:invalid, invalid}
	  Enum.count(switches) > 0 -> :help
	  Enum.count(number_of_primes) == 1 ->
		case Integer.parse(List.first(number_of_primes)) do
		  :error -> {:invalid, List.first(number_of_primes)}
		  {value, _} -> {:ok, value}
		end
	  true -> {:invalid, number_of_primes}
	end
  end

  def process(converted) do
	"stub"
  end
end
