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

# Make the conversion in both sides
Date.new(1799, 11, 9).to_republican.to_gregorian
=> #<Date: 1799-11-09 ((2378444j,0s,0n),+0s,2299161j)>
```



The gem ads some methods to the Date class :

```ruby

# return a Date::Republican instance
Date.today.to_republican
=> #<Date::Republican:0x007fb7645ace90 @day=15, @month=2, @year=223>

```

## Contributing

1. Fork it ( http://github.com/<my-github-username>/republican_calendar/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request



