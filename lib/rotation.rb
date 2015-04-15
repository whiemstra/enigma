require_relative './key_set'
require_relative './date_key'

class Rotation
  attr_reader :key_set, :date_key

  def initialize(key_set, date_key)
    @key = key_set
    @date_key = date_key
    @rotation = []
  end

  def rotation
    @key.zip(@date_key).map do|x|
      @rotation = x.reduce(:+)
    end
  end

end
