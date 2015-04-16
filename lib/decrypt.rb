require_relative '../lib/key_set'

class Decrypt

  attr_accessor :encrypted_filename, :output_filename, :key_set, :date_key

  def initialize(encrypted_filename, output_filename, key_set, date_key)
    self.encrypted_filename = encrypted_filename
    self.output_filename = output_filename
    self.key_set = key_set
    self.date_key = date_key
  end

  def encrypted_message
    File.read(encrypted_filename).strip
  end

  def character_map
    [*('a'..'z'), *('0'..'9'), ' ', '.', ',']
  end
  #
  # def write_decrypted_message
  #   File.open(output_filename, 'w') {|file| file.write(decrypted_message) }
  # end
  #
  def decrypted_message
    message_array = encrypted_message.split(//)
    decrypted = []
    message_array.each_slice(4) do |letters|
      letters.each_with_index do |letter, index|
        # index of the letter + rotations[index] equals a value in some future character map
        encrypted_num = character_map.index(letter.downcase) + rotation[index]
        decrypted <<  character_map[encrypted_num % character_map.length]
      end
    end
    decrypted.join('')
  end

  def rotation
    keyset_array = KeySet.new(keyset).offsets
    date_array = DateKey.new(date).offsets
    rotation = []
    keyset_array.each_with_index do |num, index|
      rotation << (num + date_array[index])
    end
    rotation
  end

  def date
    @date
  end

  def date=(time)
    @date = time.strftime('%d%m%y')
  end

  def keyset
    @keyset
  end

  def keyset=(numbers)
    @keyset = numbers.to_s
  end

end
