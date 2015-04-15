gem 'minitest'        #'~> 5.2'
require 'minitest/autorun'
require_relative '../lib/key_set'
require_relative '../lib/date_key'
require_relative '../lib/offsets'

class RotationTest < MiniTest::Test

  def test_it_takes_a_key_and_date_key
    key = KeySet.new("41521").offsets #offsets: [41,15,52,21]
    date_key = DateKey.new("020315").offsets #offsets: [9,2,2,5]
    assert_equal [50, 17, 54, 26], Rotation.new(key, date_key).rotation
  end
end
