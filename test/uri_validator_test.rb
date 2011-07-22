require 'test_helper'

class UriValidatorTest < Test::Unit::TestCase
  def test_valid_protocols
    assert Repository.new('git://github.com/sobrinho/uri_validator.git').valid?
    assert Repository.new('svn://svnhub.com/sobrinho/uri_validator').valid?
    assert Site.new('http://github.com/').valid?
    assert Site.new('https://github.com/').valid?
  end
  
  def test_invalid_protocols
    assert Repository.new('http://github.com/').invalid?
    assert Repository.new('https://github.com/').invalid?
    assert Site.new('git://github.com/sobrinho/uri_validator.git').invalid?
    assert Site.new('svn://svnhub.com/sobrinho/uri_validator').invalid?
  end
  
  def test_ip
    assert Repository.new('git://10.0.0.1/sobrinho/uri_validator.git').valid?
    assert Site.new('http://10.0.0.1/').valid?
  end
  
  def test_port
    assert Site.new('https://github.com:3000/').valid?
    assert Site.new('https://10.0.0.1:3000/').valid?
  end
end
