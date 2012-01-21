# uri_validator

Validates uri format using regexp

## Installation

    gem "uri_validator"

## Usage

    class Product < ActiveRecord::Base
      validates :video, :uri => true # default protocols are http and https
      validates :manual, :uri => %w(http https ftp)
    end

## License

Copyright (c) 2009-2012 nohup brasil, released under the MIT license
