require 'rubygems'
require 'test/unit'
require 'active_support'
require 'active_record'
require 'validates_as_uri/uri_validator'

# create a temporary database
ActiveRecord::Base.establish_connection :adapter => 'sqlite3', :database => ':memory:'

silence_stream(STDOUT) do
  ActiveRecord::Schema.define do
    create_table :repositories do |t|
      t.string :url
      t.string :homepage
    end
  end
end
