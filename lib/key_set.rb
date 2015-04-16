class KeySet
  attr_accessor :keystring

  def initialize(keystring)
    if keystring == nil
      @keystring = generate
    else
      @keystring = keystring.to_s
    end
  end

  def generate
    keystring = (0...5).map { rand(9) }.join
  end

  def offsets
    keystring.chars.each_cons(2).map(&:join).map(&:to_i)
  end
end

key = KeySet.new('74937')
puts key
