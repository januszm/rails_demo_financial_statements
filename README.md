# README

A demo Ruby on Rails application that queries Yahoo APIs for financial statement for a chosen company (symbol).

## Development Environment setup

Clone the repository and `cd` into it.

Install Ruby and gems, preferably using `rvm`:

```
rvm install 2.4.1 # or newer version
rvm use 2.4
rvm gemset create rails_demo
rvm gemset use rails_demo
gem install bundler
bundle install
```

Prepare test and development databases:

```
rails db:setup
```

Start the server or console, either with `rails s` or `rails c`
