# DailyScores

CLI Data Gem Portfolio Project - Check daily scores across leagues and display game scores

This application scrapes data from https://www.scorespro.com/ and presents list of available countries. Upon country selection you can see a list of leagues played in that country and check scores for the specific league.

## Installation


1. Navigate to daily_scores folder in your terminal ```cd daily_scores```
2. Run bundle commmand
3. 
    $ bundle

Or install it yourself as:

    $ gem install daily_scores

## Usage

1. Welcome to Daily Scores!
  You can check daily Soccer scores from most Soccer leagues in the world, based on https://www.scorespro.com/.
2. a) Select a country from a list of countries by entering corresponding country number.(e.g.
      1. England
      2. Spain
      3. Germany
      ...
  Enter 1 to select England)
  b) type start to reload list of countries
  c) type exit to exit
3. Based on the selection, you will receive a list of leagues played in the country
4.  a) Select a league you would look to see a results for
    b) type back to go back to main menu
    
## Demo
https://youtu.be/n263XMZw6to

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/daily_scores. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the DailyScores project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/daily_scores/blob/master/CODE_OF_CONDUCT.md).

