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
    obj = Crack.new('encrypted_abc_with_end.txt', 'cracked_abc.txt', '140213')
    assert_equal '12345', obj.crack
  end

  def test_it_cracks_messages_with_only_known_message
    skip
    obj = Crack.new('encrypted_end_only.txt', 'output.txt', '160415')
    assert_equal '..end..', obj.decrypted_message
  end

  def test_it_cracks_more_than_one_word_messages
    obj = Crack.new('encrypted_abc_with_end.txt', 'cracked_abc.txt', '140213')
    assert_equal '12345', obj.crack
  end

end

