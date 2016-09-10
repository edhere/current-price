## CurrentPrice

A gem for crawling public endpoints for current stock price & current option chain details

#### Goals

* Obtain the 'instantaneous' price of a stock
* Obtain all available option contracts for a given stock

## Installation

Add this line to your application's Gemfile:

    gem 'current-price'

And then execute:

    $ bundler

Or install it yourself:

    $ gem install current-price

## Usage

#### Google

```ruby
require 'current-price'

client = CurrentPrice::Google.client(:requesting_handle => "my_handle")

client.option_chain("CSCO") #=> {"9-16-2016"=>{:puts=>[{:price=>"0.03", :bid=>"-", :ask=>"0.02", :close=>"0.00", :oi=>"290", :volume=>"-", :strike=>"19.00"}, ..
```

#### Yahoo

```ruby
require 'current-price'

client = CurrentPrice::Yahoo.client(:requesting_handle => "my_handle")

client.quote("CSCO") #=> {:low=>"22.46", :ticker=>"CSCO", :price=>31.14, :name=>"Cisco Systems"}
```

## Contributing

* Fork the project.
* Start a feature/bugfix branch.
* Commit and push until you are happy with your contribution.
* Submit a pull request
