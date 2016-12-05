defmodule ConsoleEntryTest do
  use ExUnit.Case
  use ExUnit.Parameterized
  import ConsoleEntry

  test_with_params "Passing any invalid should return an invalid result",
  fn(args) ->
	assert {:invalid, _ } =  ConsoleEntry.parse_args(args)
  end do
	[
	  {["a"]},
	  {[":notvalid"]},
	  {["1", "notvalid"]},
	  {[":help", ":notvalid"]},
	  {["--notvalid", "--help", "2"]}
	]
  end

  test_with_params "Passing valid with help always returns help",
  fn(args) ->
	assert :help = ConsoleEntry.parse_args(args)
  end do
	[
	  {["--help"]},
	  {["-h", "1"]},
	  {["3", "-h"]}
	]
  end

  test "Passing just a number will return ok and the number" do
	assert {:ok, 3} = ConsoleEntry.parse_args(["3"])
  end

  test "When invalid is passed with just a string, a string is returned" do
	result = ConsoleEntry.process({:invalid, "a"})
	assert is_binary(result)
	assert String.contains?(result, " a")
  end

  test "When invalied is passed with an arrary, a string is returned" do
	result = ConsoleEntry.process({:invalid, ["a", "notvalid"]})
	assert is_binary(result)
	assert String.contains?(result, " a notvalid")
  end
end
