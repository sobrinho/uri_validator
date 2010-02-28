require 'test_helper'

class ValidatesUriCpfTest < ActiveSupport::TestCase
  class Repository < ActiveRecord::Base
    validates :url, :uri => { :protocols => %w(git svn) }
    validates :homepage, :uri => true
  end
  
  test "blank values" do
    assert_equal false, Repository.new(:url => '', :homepage => '').valid?
    assert_equal false, Repository.new(:url => false, :homepage => false).valid?
    assert_equal false, Repository.new(:url => nil, :homepage => nil).valid?
  end
  
  test "valid protocols" do
    assert Repository.new(:url => 'git://github.com/sobrinho/validates_as_uri.git',
                          :homepage => 'http://github.com/sobrinho/validates_as_uri').valid?

    assert Repository.new(:url => 'svn://repository.com/sobrinho/validates_as_uri',
                          :homepage => 'http://github.com/sobrinho/validates_as_uri').valid?
  end
  
  test "invalid protocols" do
    assert_equal false, Repository.new(:url => 'http://github.com/sobrinho/validates_as_uri.git',
                                       :homepage => 'http://github.com/sobrinho/validates_as_uri').valid?
  end
  
  test "ip and port" do
    assert Repository.new(:url => 'git://127.0.0.1/sobrinho/validates_as_uri.git',
                          :homepage => 'https://127.0.0.1:3000/sobrinho/validates_as_uri').valid?
  end
end
