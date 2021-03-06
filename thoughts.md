* This looks a bit like a critical path problem, which I've taught at A level.
* Will try and solve in Ruby and fall back to javascript if it's too tough - please forgive any unidiomatic code
* am using the built in ruby testing from https://en.wikibooks.org/wiki/Ruby_Programming/Unit_testing - sure there are other frameworks available
* was pondering it in the bath and was thinking that you'd need to compare every job to enough other jobs to see where it'd need to be, and realised this was a sort. Am planning to solve it using a custom sort function where the job dependencies say whether something comes before something else. These exist in javascript and python as well as (now I've looked it up) Ruby
* after getting to the point of trying it, have learned that Ruby doesn't have first class functions like javascript and python, so while it does have a sort_by, it uses procs, which I've not seen before. Going to go back to TDD and build up incrementally from test cases.
* it would be nice to be able to generate custom error messages from custom assertions - so in this case I could dump the two arrays
* have now solved it using a fairly neat stateful algorithm. Still need to check for circular dependencies and find out how to do errors in Ruby
* have done those tests now. Thoughts now I've done this in Ruby:
  * I'm still not 100% clear on when you need parentheses and when you don't with function calls
  * There's some really neat time saving features
  * It's less functional than I expected, an imperative solution to this problem was *much* easier and once I'd accepted that, it went quite smoothly
  * I should have stuck to TDD, which seems to be available in vanilla ruby:) from the beginning rather than trying my 'clever' sorting algorithm solution - better to solve the problem first!
  * I enjoyed using Ruby and would be happy to work with it in a job