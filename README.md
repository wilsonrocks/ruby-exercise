# Exercise in Job Ordering in Ruby

## Problem
Imagine we have a list of jobs, each represented by a character. Because certain jobs must be done before others, a job may have a
dependency on another job. For example, a may depend on b, meaning the final sequence of jobs should place b before a. If a has no
dependency, the position of a in the final sequence does not matter.

## Task
Write a function which takes this information and produces an ordering of jobs which follows all constraints

## Solution
The function is available in `jobs.rb`

## Testing
The solution was developed using Test Driven Development. To run tests type `ruby tc_jobs.rb`.
The commit history shows the order in which tests were added

## Additional Information
`thoughts.md` contains my thinking as I solved the problem, and an evaluation once it was complete.
