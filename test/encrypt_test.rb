gem 'minitest'        #'~> 5.2'
require 'minitest/autorun'
require_relative '../lib/encrypt'


class EncryptTest < MiniTest::Test

  def test_class_sets_input_and_output_files
    obj = Encrypt.new("abc", "123")

    assert_equal 'abc', obj.input_filename
    assert_equal '123', obj.output_filename
  end

  def test_has_original_message
    obj = Encrypt.new('abc.txt', 'output.txt') # abc.txt - Hello World
    assert_equal 'hello', obj.original_message
  end

  def test_has_encrypted_message
    obj = Encrypt.new('abc.txt', 'output.txt')
    # obj.date = Time.new(2013, 02, 14)
    obj.keyset = 12345
    assert_equal 'bci4i', obj.encrypted_message
  end

  def test_has_date
    obj = Encrypt.new('abc', '123')
    obj.date = Time.new(2014, 04, 16)
    assert_equal '041614', obj.date
  end

  def test_has_keyset
    obj = Encrypt.new('abc', '123')
    obj.keyset = 10221
    assert_equal '10221', obj.keyset
  end

  def test_rotation
    obj = Encrypt.new('abc', '123')
    obj.date = Time.new(2013, 02, 14)
    obj.keyset = 12345
    assert_equal [33,37,75,58], obj.rotation
  end

end
