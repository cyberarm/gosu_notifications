# GosuNotifications

A simple notifications system for Gosu

## Installation

Add this line to your application's Gemfile:

```ruby
gem "gosu_notifications"
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install gosu_notifications

## Usage

```ruby
require "gosu"
require "gosu_notifications"

class Window < Gosu::Window
  def initialize
    super 640, 480, false

    @notification_manager = GosuNotifications::NotificationManager.new(window: self)
  end

  def draw
    @notification_manager.draw
  end

  def update
    @notification_manager.update
  end

  def button_down(id)
    @notification_manager.create_notification(
        title: "A Button Has Been Pressed",
        tagline: "#{id}"
    )
  end
end

Window.new.show
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/gosu_notifications.


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
