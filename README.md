# Logwrapper

Rails log file wrapper for handling multiple log files without impacting your
normal rails logging systems.

Put your Ruby code in the file `lib/logwrapper`. To experiment with that code, run `bin/console` for an interactive prompt.

## Installation

Install ruby 2.3.4 or more current version (https://www.ruby-lang.org/en/documentation/installation/)

Add this line to your application's Gemfile:

```ruby
gem 'logwrapper'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install logwrapper
    
In console:

```
rake tests
```

## Why another logger

- simpler than existing
- hassleless logging
-   default paths to log too
-   customize paths
-   ensure it's ignored in repo

## Dependencies

- optparse
- ruby

## Installation

## Process - Start up

- Check ENV or config setting to determine proper directory & sub dir to log too
- Locate / check for said directory 
-   Check sub directory directory exists
-       create directory if none exists
- 
- Check the classes necessary are loaded
-   output that name / loading status if in verbose
-   output path used for directories
-   output name of file
-
- Check for .gitignore
-   Push directory / sub directory into the .gitignore if found

## Process - Logic

- This gem is called once it's determined that new log file is needed
- Follows start up process above
- 
- Check file had header info
-   write file header info if none present
- Get timestamp + message passed


## Usage



## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/mirv/logwrapper.
