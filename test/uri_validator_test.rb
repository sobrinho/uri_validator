require 'test_helper'

class UriValidatorTest < Test::Unit::TestCase
  def test_valid_protocols
    assert_valid_repository 'git://github.com/sobrinho/uri_validator.git'
    assert_valid_repository 'svn://github.com/sobrinho/uri_validator'
    assert_valid_site 'http://github.com/'
    assert_valid_site 'https://github.com/'
  end

  def test_invalid_protocols
    assert_invalid_repository 'http://github.com/'
    assert_invalid_repository 'https://github.com/'
    assert_invalid_site 'git://github.com/sobrinho/uri_validator.git'
    assert_invalid_site 'svn://github.com/sobrinho/uri_validator'
  end

  def test_ip
    assert_valid_repository 'git://127.0.0.1/sobrinho/uri_validator.git'
    assert_valid_site 'http://127.0.0.1/sobrinho/uri_validator'
  end

  def test_port
    assert_valid_site 'https://github.com:3000/'
    assert_valid_site 'https://10.0.0.1:3000/'
  end

  protected

  def assert_valid_repository(uri)
    assert repository(:uri => uri).valid?
  end

  def assert_invalid_repository(uri)
    assert repository(:uri => uri).invalid?
  end

  def assert_valid_site(uri)
    assert site(:uri => uri).valid?
  end

  def assert_invalid_site(uri)
    assert site(:uri => uri).invalid?
  end

  def repository(attributes)
    Repository.new(attributes)
  end

  def site(attributes)
    Site.new(attributes)
  end
end
