# Biscotti

Tool for generating a list of words from a set of letters.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'biscotti'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install biscotti

## Usage

To generate a list of words from the letters "anfangod" run the command as
below. A list will be printed out to STDOUT one word per line.

```sh
bundle exec biscotti anfangod
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## License

Biscotti is licensed under GPL-3.0-or-later.

This file is part of Biscotti.

Biscotti is free software: you can redistribute it and/or modify it under the
terms of the GNU General Public License as published by the Free Software
Foundation, either version 3 of the License, or (at your option) any later
version.

Biscotti is distributed in the hope that it will be useful, but WITHOUT ANY
WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A
PARTICULAR PURPOSE. See the GNU General Public License for more details.

You should have received a copy of the GNU General Public License along with
Biscotti. If not, see <https://www.gnu.org/licenses/>.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/just3ws/biscotti.
