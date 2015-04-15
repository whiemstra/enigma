require_relative './offsets'

class Rotation
  attr_reader :key, :date_key

  def initialize(key, date_key)
    @key = key
    @date_key = date_key
    @rotation_key = []
  end

  def rotation
    keyset_array = KeySet.new(keyset).offsets
    date_array = KeySet.new(keyset).offsets

    rotation = []
    keyset_array.each_with_index do |num, index|
      rotation << (num + date_array[index])
    end

    rotation
  end

end
