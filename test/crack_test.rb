gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/crack'

class CrackTest < MiniTest::Test

  def test_it_exists
    assert Crack.new('encrypted_abc.txt', 'cracked_abc.txt', '140213')
  end

  def test_class_sets_arguments
    obj = Crack.new('encrypted_abc.txt', 'cracked_abc.txt', '140213')

    assert_equal obj.encrypted_filename, 'encrypted_abc.txt'
    assert_equal obj.output_filename, 'cracked_abc.txt'
    assert_equal obj.date, '140213'
  end

  def test_crack_returns_key
    obj = Crack.new('encrypted_abc.txt', 'cracked_abc.txt', '140213')
    assert_equal '12345', obj.crack
  end

  def test_it_cracks_one_word_messages
    skip
    obj = Crack.new('encrypted_abc.txt', 'cracked_abc.txt', '140213')
    assert_equal '12345', obj.crack
  end

  def test_it_cracks_more_than_one_word_messages
    skip
    obj = Crack.new('encrypted_abc.txt', 'cracked_abc.txt', '140213')
    assert_equal '12345', obj.crack
  end

  def test_it_cracks_messages_on_multiple_lines
    skip
    obj = Crack.new('encrypted_abc.txt', 'cracked_abc.txt', '140213')
    assert_equal '12345', obj.crack
  end

  def test_has_cracked_message
    obj = Decrypt.new('encrypted_abc.txt', 'decrypted_abc.txt', '12345', '140213')
    obj.date = Time.new(2013, 02, 14)
    assert_equal 'hello', obj.decrypted_message
  end
end

