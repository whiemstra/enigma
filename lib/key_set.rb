class KeySet
  attr_accessor :keystring

  def initialize(keystring = nil)
    if keystring == nil
      self.keystring = generate
    else
      self.keystring = keystring
    end

    # if keystring == nil
    #   @keystring = generate
    # else
    #   @keystring = keystring.to_s
    # end
  end

  def generate
    rand(10000..99999).to_s#(0...5).map { rand(9) }.join
  end

  def offsets
    keystring.chars.each_cons(2).map(&:join).map(&:to_i)
  end
end


