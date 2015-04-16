gem 'minitest'
require 'minitest/autorun'
require_relative '../lib/decrypt'

class DecryptTest < MiniTest::Test

  def test_class_sets_arguments
    obj = Decrypt.new("abc", "123", "000", "999")

    assert_equal obj.encrypted_filename, 'abc'
    assert_equal obj.output_filename, '123'
    assert_equal obj.keyset, '000'
    assert_equal obj.date, '999'
  end

  def test_has_encrypted_message_to_decrypt
    obj = Decrypt.new('encrypted_abc.txt', "123", "000", "999")
    assert_equal 'y4m05', obj.encrypted_message
  end

  def test_has_date
    obj = Decrypt.new('encrypted_abc.txt', 'decrypted_abc.txt', 'abc', '123')
    obj.date = Time.new(2014, 04, 16)
    assert_equal '160414', obj.date
  end

  def test_has_keyset
    obj = Decrypt.new('encrypted_abc.txt', 'decrypted_abc.txt', 'abc', '123')
    obj.keyset = 10221
    assert_equal '10221', obj.keyset
  end

  def test_rotation
    obj = Decrypt.new('encrypted_abc.txt', 'decrypted_abc.txt', '12345', '140213')
    assert_equal [17, 26, 40, 54], obj.rotation
  end

  def test_has_decrypted_message
    obj = Decrypt.new('encrypted_abc.txt', 'decrypted_abc.txt', '12345', '140213')
    #obj.date = Time.new(2013, 02, 14)
    assert_equal 'hello', obj.decrypted_message
  end
end
