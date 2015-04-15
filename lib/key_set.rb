class KeySet
  attr_accessor :keystring

  def initialize(keystring=generate)
    self.keystring = keystring.to_s
  end

  def generate
    self.keystring = rand(10000..99999).to_s
  end

  # def generate
  #   (0...4).map { rand(9) }.join
  # end

  def offsets
    keystring.chars.each_cons(2).map(&:join).map(&:to_i)
  end
end
