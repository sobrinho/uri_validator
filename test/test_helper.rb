require 'rubygems'
require 'bundler/setup'
require 'active_model'
require 'test/unit'
require 'validates_as_uri'

class Repository < Struct.new(:url)
  include ActiveModel::Validations
  validates :url, :uri => { :protocols => %w(git svn) }
end

class Site < Struct.new(:url)
  include ActiveModel::Validations
  validates :url, :uri => true
end
