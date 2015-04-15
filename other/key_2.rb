class Key
  attr_reader :keystring

  def initialize(key=nil)
    @key = key || generate_key
  end

  def generate_key
    @key = rand(10000..99999).to_s
  end

  def rotations
    @rotations = []
    #refactor this into a loop...
    @rotations << @key[0] + @key[1]
    @rotations << @key[1] + @key[2]
    @rotations << @key[2] + @key[3]
    @rotations << @key[3] + @key[4]
  end

  def key_hash
    @key_hash = {"a" => @rotations[0],
      "b" => @rotations[1],
      "c" => @rotations[2],
      "d" => @rotations[3]
    }
  end
end


# alpha = ["A", "B", "C", "D"]
# alpha.chars.zip(@rotations.chars)

key = Key.new("80238")
puts key
print key.rotations

