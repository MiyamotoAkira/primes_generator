defmodule ConsoleEntry do
  import PrimesGenerator

  @error_message "You have passed the following incorrect values:"
  @command_suggestion "The following is the expected input:"
  @command_option "console_entry <number_of_primes>|[--help|-h]"
  @first_line "console_entry will help you on finding the multiples of a selection of primes."
  @second_line "The only parameter needed is the number of primes that you want to use"
  @example_string "The following is an example"
  @example "console_entry 3"

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
	case converted do
	  {:invalid, value} -> craft_invalid_message(value)
		
	  :help -> craft_help_message()
	end
  end

  defp craft_invalid_message(value) do
	formatted =
		if is_list(value) do
		  Enum.join(value, " ")
		else
		  value
		end
		
	"#{@error_message} #{formatted}\n#{@command_suggestion}\n#{@command_option}"
  end

  defp craft_help_message() do
	"#{@first_line}\n#{@second_line}\n#{@command_option}\n\n#{@example_string}\n#{@example}"
  end
end
