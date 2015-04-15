gem 'minitest'        #'~> 5.2'
require 'minitest/autorun'
require_relative '../lib/decrypt'

class DecryptTest < MiniTest::Test

  def test_class_sets_arguments
    obj = Decrypt.new("abc", "123", "000", "999")

    assert_equal obj.encrypted_filename, 'abc'
    assert_equal obj.output_filename, '123'
    assert_equal obj.number_key, '000'
    assert_equal obj.date_key, '999'
  end

  def test_has_encrypted_message
    obj = Decrypt.new('encrypted_abc.txt', "123", "000", "999")
    assert_equal '83879', obj.encrypted_message
  end

  def test_has_date
    obj = Decrypt.new('encrypted_abc.txt', 'output.txt', 'abc', '123') # encrypted_abc.txt - 83879
    obj.date = Time.new(2014, 04, 16)
    assert_equal '041614', obj.date
  end

  def test_has_keyset
    obj = Decrypt.new('encrypted_abc.txt', 'output.txt', 'abc', '123') # encrypted_abc.txt - 83879
    obj.keyset = 10221
    assert_equal '10221', obj.keyset
  end

  def test_rotation
    obj = Decrypt.new('encrypted_abc.txt', 'output.txt', 'abc', '123') # abc.txt - Hello World
    obj.date = Time.new(2013, 02, 14)
    obj.keyset = 12345
    assert_equal [-9,9,-7,32], obj.rotation
  end

  def test_has_decrypted_message
    obj = Decrypt.new('encrypted_abc.txt', 'output.txt', 'abc', '123') # abc.txt - Hello World
    # obj.date = Time.new(2013, 02, 14)
    obj.keyset = 12345
    assert_equal 'hello', obj.decrypted_message
  end

end
