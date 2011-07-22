require 'rubygems'
require 'bundler/setup'
require 'active_model'
require 'test/unit'
require 'uri_validator'

class Repository < Struct.new(:url)
  include ActiveModel::Validations
  validates :url, :uri => { :protocols => %w(git svn) }
end

class Site < Struct.new(:url)
  include ActiveModel::Validations
  validates :url, :uri => true
end
