# Aoc2021

Advent-of-Code 2021

Look at the `rspec` examples for each day's activities, they're named after the day that challenge came out.
The classes themselves are named otherwise more usefully.

The general approach is to transform the given sample and actual data into a list (of some sort) and then
perform transformations on that list. So you'll see all the class `initialize` methods have the same signature;
they take a list, a list of non-empty lines of text read from either sample or actual files, and do something
with it, leaving it in a frozen (read-only) state. Sometimes `initialize` performs the only needed transformation
right then and there, sometimes it leaves it open for other methods to molest^Wconsult.

The structure of the `rspec` tests is (so far) rather constant:

The first `context` block assigns the `subject` to a new instance of a particular class
initialized with the contents of a similarly-name sample data file that has been
transformed into list of non-`nil` line-termination-friendly elements.
The second `context` block does the same but for actual problem data.

Within each are `describe` blocks for both Part 1 and Part 2, the `Sample` context proving that the class
provides the correct answers as stated in the problem, and the `Actual` showing the answers to be submitted,
as well as proof that further tinkering hasn't broken anything (and a record of the answers themselves).

See `spec/aoc2021/template.rb` for each day's starting goodness.


## Installation

Standard stuff:
Add this line to your application's Gemfile:

```ruby
gem 'aoc2021'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install aoc2021

## Usage

You'll need `rspec` to get any action, so do the same installation steps with `rspec` vice `aoc2021`

    $ rspec spec

To see the code, explore the `lib/aoc2021` folder.
To see how _to use_ the code, look through `spec/aoc2021` for each day's runs.
To see the answers, run the examples.

Examples are named after the day the puzzle came out, so that
1.  the classes themselves may preserve the puzzle _name_ as their own
1.  the most recent day's action appears last

Tell your computer `rspec spec -e TreacheryOfWhales` to run only those examples,
or, if you know the day, say `rspec spec/aoc2021/day_07_spec.rb` instead.

## Notes About the Codez

`inject` is everywhere. I mean _everywhere_.
I name the accumulator `memo` similar to the docs, but I should get into the habit of making that name more meaningful.
Flip side: we end up with `|plural, singular|` everywhere. Dra-a-ma.

I seem to prefer numeric bitfields to pastures of `true` and `false` values ---
perhaps an homage to my embedded systems beginnings?

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/aoc2021.
