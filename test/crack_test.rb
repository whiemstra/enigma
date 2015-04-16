gem 'minitest'
require 'minitest/autorun'
require_relative '../lib/crack'

class CrackTest < MiniTest::Test

  def test_class_sets_arguments
  obj = Crack.new('encrypted_abc.txt', 'cracked_abc.txt', '140213')

    assert_equal obj.encrypted_filename, 'encrypted_abc.txt'
    assert_equal obj.output_filename, 'cracked_abc.txt'
    assert_equal obj.date, '140213'
  end

  def test_crack_returns_key
    obj = Crack.new('cracked_abc2.txt', 'uncracked_abc.txt', '140213')
    assert_equal '12345', obj.crack
  end



end

