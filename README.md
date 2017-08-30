# Sogenactif::Sips::Post

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/sogenactif/sips/post`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'sogenactif-sips-post'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install sogenactif-sips-post

## Usage
```
  # Initialize Post
  sips = Sogenactif::Sips::Post::Post.new("978", "1", "002001000000001", "https://yourreturnurl.com")
  
  # Set Amount
  sips.add_parameter("amount","10")
  
  # If in the simulation environment, you need set <<transactionReference>> 
  # sips.add_parameter("transactionReference","SipsPost"+Time.now.to_i.to_s)
  
  # Get code html
  sips.to_html("https://payment-webinit.simu.sips-atos.com/paymentInit", "002001000000001_KEY1", "HP_2.14", "Payer").html_safe
 ```
## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/sogenactif-sips-post. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

