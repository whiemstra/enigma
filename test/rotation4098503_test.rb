gem 'minitest'        #'~> 5.2'
require 'minitest/autorun'
require_relative '../lib/offsets'

class RotationTest < MiniTest::Test

  def test_it_takes_an_offset_key
    key = KeySet.new("41521").offsets #offsets: [41,15,52,21]
    date_key = DateKey.new("020315").offsets #offsets: [9,2,2,5]
    #rotation = Rotation.new(key, date_key).offsets
    assert_equal [50, 17, 54, 26], Rotation.new(key, date_key).offsets
  end
end
