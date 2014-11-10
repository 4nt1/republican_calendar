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

The gem offers a new class Date::Republican to represent a given from the start of the first french republic.

```ruby

# first day of the republic
Date::Republican.new
=> #<Date::Republican:0x007fb765185870 @day=1, @month=1, @year=1>

# one week after the first republic
Date::Republican.new + 7
=> #<Date::Republican:0x007fb765185870 @day=8, @month=1, @year=1>

# last day of use of the republican calendar
Date::Republican.new(14, 4, 10)
irb(main):007:0> Date.new(1805, 12, 31).to_republican
=> #<Date::Republican:0x007fb76519e3c0 @day=10, @month=4, @year=14>
irb(main):008:0> Date::Republican.new(14, 4, 10)
=> #<Date::Republican:0x007fb7651a53f0 @day=10, @month=4, @year=14>
irb(main):009:0> Date::Republican.new(14, 4, 10).to_gregorian
=> #<Date: 1805-12-28 ((2380684j,0s,0n),+0s,2299161j)>
irb(main):010:0> Date::Republican.new(14, 4, 11).to_gregorian
=> #<Date: 1805-12-29 ((2380685j,0s,0n),+0s,2299161j)>
```



The gem ads some methods to the Date class :

```ruby

# return a Date::Republican instance
Date.today.to_republican
=> #<Date::Republican:0x007fb7645ace90 @day=15, @month=2, @year=223>

# return whether the year is sextil or not
Date.today.sextil?
=> false

```

## Contributing

1. Fork it ( http://github.com/<my-github-username>/republican_calendar/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request



