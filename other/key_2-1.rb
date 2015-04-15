class Key
  attr_reader :keystring

  def self.generate  # self -> self is key    -------Either do a class method of self.generate, or def generate
    #come up with a new 5-character string
    keystring = (0...4).map { rand(9) }.join
    Key.new(keystring)
  end

  # @key_hash = key_hash
  # def initialize(number)
  #   @number = number.to_s.chars
  # end

  def initialize(keystring)
    @keystring = keystring
  end

  #you could do:
  # def initialize(keystring)
  #   @keystring = (0...4).map { rand(9) }.join
  # end
  #but then you're always generating a random key, hard to test, PLUS we know down the road we're going to decrypt and have a set key


  def offsets
    keystring.chars.each_cons(2).map(&:join).map(&:to_i)
  end
end


# def offsets
#   #"41521" -> [41, 15, 52, 21]
#   offsets = []
#   0..(keystring.length-2).each do |pair|
#     pair.join.to_i
#     offsets << keystring[i..i+1]
#   end
#   offsets
# end

# 0..(keystring.length-2).each do |pair|
#   pair.join
# end.map do |num_string|
#   num_string.to_i
# end

# [["4", "1"], ["1", "5"]...]
# join
# ["41", "15", "52"...]
# .to_i
# [41, 15, 52...]
