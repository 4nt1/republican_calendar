# RepublicanCalendar

The gem give the ability to use the French republican (French revolutionnary) calendar.
This calendar was used from the 22 september 1792 until the first of january 1806 in France.


## Installation

Add this line to your application's Gemfile:

    gem 'republican_calendar', git: 'https://github.com/4nt1/republican_calendar'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install republican_calendar

## Usage

The gem offers a new class Date::Republican to represent a given moment from the start of the first french republic.

```ruby

# first day of the republic
Date::Republican.new
=> #<Date::Republican:0x007fb765185870 @day=1, @month=1, @year=1>

# Coup of 18 brumaire
Date.new(1799, 11, 9).to_republican.to_s
=> "18 Brumaire an 8"

# Make new Date::Republican from numeric or string values
Date::Republican.new("18 Brumaire an 8")
=> #<Date::Republican:0x007ffae1514b20 @day=18, @month=2, @year=8>

Date::Republican.new(8, 2, 18).to_s
=> "18 Brumaire an 8"

# Make the conversion in both ways (from Date to Date::Republican and vice versa)
Date.new(1799, 11, 9).to_republican.to_gregorian
=> #<Date: 1799-11-09 ((2378444j,0s,0n),+0s,2299161j)>

# Add or substract days
Date::Republican.new + 200
=> #<Date::Republican:0x007f9e4ba5c0d0 @day=21, @month=7, @year=1>

# Check if a republican year is sextil
Date::Republican.new(3).sextil?
=> true


```

## TODO

Improve the Date::Republican#strftime method (actually a simple #to_s).

## Contributing

1. Fork it ( http://github.com/<my-github-username>/republican_calendar/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request



