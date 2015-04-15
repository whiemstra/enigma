gem 'minitest'        #'~> 5.2'
require 'minitest/autorun'
require_relative '../lib/date_key'

class DateKeyTest < MiniTest::Test

  def test_has_date
    obj = DateKey.new('020315')
    assert_equal '020315', obj.date
  end

  def test_has_correct_date
    obj = DateKey.new('020315')
    refute_equal '120415', obj.date
  end

  def test_it_parses_date_string_into_int
    assert_equal 20315, DateKey.new("020315").date_num
  end

  def test_it_squares_date_int
    assert_equal 412_699_225, DateKey.new("020315").squared
  end

  def test_it_takes_last_four_digits_of_square_for_offset
    assert_equal [9,2,2,5], DateKey.new("020315").offsets
  end

  def test_it_uses_todays_date_if_none_is_provided
    today = Time.new.strftime("%d%m%y")
    assert_equal today, DateKey.new.date
  end

end
