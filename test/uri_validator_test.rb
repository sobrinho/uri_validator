require 'test_helper'

class Repository < Struct.new(:url)
  include ActiveModel::Validations
  validates :url, :uri => { :protocols => %w(git svn) }
end

class Site < Struct.new(:url)
  include ActiveModel::Validations
  validates :url, :uri => true
end

class UriValidatorTest < Test::Unit::TestCase
  def test_valid_protocols
    assert Repository.new('git://github.com/sobrinho/validates_as_uri.git').valid?
    assert Repository.new('svn://svnhub.com/sobrinho/validates_as_uri').valid?
    assert Site.new('http://github.com/').valid?
    assert Site.new('https://github.com/').valid?
  end
  
  def test_invalid_protocols
    assert Repository.new('http://github.com/').invalid?
    assert Repository.new('https://github.com/').invalid?
    assert Site.new('git://github.com/sobrinho/validates_as_uri.git').invalid?
    assert Site.new('svn://svnhub.com/sobrinho/validates_as_uri').invalid?
  end
  
  def test_ip
    assert Repository.new('git://10.0.0.1/sobrinho/validates_as_uri.git').valid?
    assert Site.new('http://10.0.0.1/').valid?
  end
  
  def test_port
    assert Site.new('https://github.com:3000/').valid?
    assert Site.new('https://10.0.0.1:3000/').valid?
  end
end
