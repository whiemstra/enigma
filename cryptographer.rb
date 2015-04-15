class Encryptor

  def encrypt(message)
    puts "Rotation number:"
    rot = gets.to_i
    encrypted = []
    alphabet = ("a".."z").to_a

    message.downcase.chars.each do |character|
      encrypted << (alphabet.index(character) + rot)
    end

    encrypted.each do |number|
      print alphabet[number % 26]
    end
    print "\n"
  end

  def decrypt(message)
    puts "Rotation number:"
    rot = gets.to_i
    decrypted = []
    alphabet = ("a".."z").to_a

    message.downcase.chars.each do |character|
      decrypted << (alphabet.index(character) - rot)
    end

    decrypted.each do |number|
      print alphabet[number % 26]
    end
  end
end
