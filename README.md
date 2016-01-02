[![Gem Version](https://badge.fury.io/rb/cgi-query_string.svg)](http://badge.fury.io/rb/cgi-query_string)
[![Build Status](https://travis-ci.org/butchmarshall/ruby-cgi-query_string.svg?branch=master)](https://travis-ci.org/butchmarshall/ruby-cgi-query_string)

# CGI::QueryString

Helper methods for dealing with query strings in ruby.

Basically trying to replicate ActiveSupports [to_query ](http://guides.rubyonrails.org/v3.2.21/active_support_core_extensions.html#to_query) method without having to include all of ActiveSupport.

Hopefully someone finds this useful.

TODO: add a deparam method

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'cgi-query_string'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install cgi-query_string

## Usage

```ruby
require 'cgi/query_string'

CGI::QueryString.param({
	:a => 1,
	:b => {
		:c => [1,2,3]
	},
	:d => [4,5,6]
})

== "a=1&b%5Bc%5D%5B%5D=1&b%5Bc%5D%5B%5D=2&b%5Bc%5D%5B%5D=3&d%5B%5D=4&d%5B%5D=5&d%5B%5D=6"
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/butchmarshall/ruby-cgi-query_string.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

