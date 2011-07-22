require 'rubygems'
require 'test/unit'
require 'active_model'
require 'uri_validator'
require 'ostruct'

class Repository < OpenStruct
  include ActiveModel::Validations
  validates :uri, :uri => { :protocols => %w(git svn) }
end

class Site < OpenStruct
  include ActiveModel::Validations
  validates :uri, :uri => true
end
