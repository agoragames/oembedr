## OEmbedr

Lightweight, Flexible OEmbed Consumer Library.

[![Build Status](https://secure.travis-ci.org/agoragames/oembedr.png)](http://travis-ci.org/agoragames/oembedr)

### Installation

`gem install oembedr`

or in your `Gemfile`

```ruby
gem 'oembedr'
```

### Goals

Make consuming oembed from **any source** simple and easy. Uses fast http and fast json parsing by default thanks to Faraday and MultiJSON.

### Usage

`Oembedr` just returns the raw Faraday response object on success. On failure, it raises an appropriate error, e.g. `Faraday::Error::ResourceNotFound` for 404s. It parses the JSON for you.

*N.B.* XML is not supported yet. I've no idea why you might **need** it, but it's on the todo list :).

```ruby
response = Oembedr.fetch("http://www.youtube.com/watch?v=BxhqVrbixZc")
response.body # => { "type" => "video", ... }
# Now you can do whatever you want!

# To customize your query:
Oembedr.fetch("http://www.youtu.be/BxhqVrbixZc", :params => { :maxwidth => 320 })
Oembedr.fetch("http://custom.com/23423423", :headers => {
  "Accept" => "application/vnd.ms-excel",
  "User-Agent" => "Windows Excel-Based Oembed Service"
})
```

#### Other Methods

```ruby
Oembedr.known_service?("http://www.youtu.be/BxhqVrbixZc") # => true
```

#### Configuration

```ruby
Oembedr.configure do |configuration|
  configuration.user_agent = "MyCoolApp Oembed Client v2.51"
  configuration.adapter = :excon # default :typhoeus
end
```

### Recommendations

Use a fast http library, like excon or typhoeus. Use yajl-ruby.

## Contributing to oembedr

* Check out the latest master to make sure the feature hasn't been implemented or the bug hasn't been fixed yet
* Check out the issue tracker to make sure someone already hasn't requested it and/or contributed it
* Fork the project
* Start a feature/bugfix branch
* Commit and push until you are happy with your contribution
* Make sure to add tests for it. This is important so I don't break it in a future version unintentionally.
* Please try not to mess with the Rakefile, version, or history. If you want to have your own version, or is otherwise necessary, that is fine, but please isolate to its own commit so I can cherry-pick around it.

A big thanks to everyone who [contributes](https://github.com/agoragames/oembedr/contributors)!

## Copyright

Copyright (c) 2012-2017 Matthew Wilson. MIT-license: see LICENSE.txt for further details.
