# PrimesGenerator

Application created as a test for a company

## Setup

`mix deps.get` needs to be run get the only dependency on the project

`mix escript.build` to get the compiled application

`./primes_generator_app 3` as an example to run the application


If you want, you can use
`iex -S mix` to start the interactive environment, load my bench testing `c "lib/benchtiming.exs` and then run `BenchTiming.run_of_1000` and `BenchTiming.run_of_10000`. There are no separate runners for the TrialDivision sieve and for an improved version (hopefully). Those are `run_trial/1` and `run_trial_imp/1`

## About the project

The application took me longer than I expected. Main reason is because I decided to do it on Elixir. Even when I knew most issues that were appearing, due to the very green knowledge of Elixir, it took me a while how to find the correct way.

There are quite a few things that I wanted to improve: we have the output of the application, which is a bit lackluster at the moment. We have lack of documentation (usually I would have more, though because this is not an API to be used by others, is not as bad that is missing). Mainly, I knew that the sieve used would be the biggest hit on performance (or at least so I believe). I had a try to rewrite it with Agents, but that didn't give me any speed improvement. With more time I would probably use a different sieve.

The thing that I was most please with is that I knew before putting the first line that the multiplication would be easily improved, and that was indeed the case (and good perf increase at that). The other thing that I am pleased with is the language. I have used it only on very small exercises before (exercism.io), and I think is better than what I originally though. Compared with the other functional languages that I'm using, I think is a much easier language to pick up than Clojure, and on pair with F# (but without the drag of the rest of .Net).

