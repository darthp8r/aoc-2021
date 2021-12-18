# Aoc2021

Advent-of-Code 2021

Look at the `rspec` examples for each day's activities, they're named after the day that challenge came out.
The classes themselves are named otherwise more usefully.

The general approach is to transform the given sample and actual data into a list (of some sort) and then
perform transformations on that list. So you'll see all the class `initialize` methods have the same signature;
they take a list, a list of non-empty lines of text read from either sample or actual files.

## Installation

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

## Tests as Executives

To see the code, explore the `lib/aoc2021` folder.
To see how _to use_ the code, look through `spec/aoc2021` for each day's runs.
To see the answers, run the examples.

## Other Notes

I seem to prefer numeric bitfields to pastures of `true` and `false` values ---
perhaps an homage to my embedded systems beginnings?

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/aoc2021.
