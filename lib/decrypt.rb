require_relative '../lib/key_set'

class Decrypt

  attr_accessor :encrypted_filename, :output_filename, :number_key, :date_key

  def initialize(encrypted_filename, output_filename, number_key, date_key)
    self.encrypted_filename = encrypted_filename
    self.output_filename = output_filename
    self.number_key = number_key
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
    date_array = [21, 14, 41, 13] # TODO make this real

    rotation = []
    keyset_array.each_with_index do |num, index|
      rotation << (num - date_array[index])
    end

    # rotation.map! do |num|
    #   num.abs
    # end

    rotation
    #  date - keyset
  end

  def date
    @date # [21, 14, 41, 13]
  end

  def date=(time) # obj.date = 'foo'
    @date = time.strftime('%m%d%y')
  end

  def keyset
    @keyset # [10, 02, 22, 21]
  end

  def keyset=(numbers)
    @keyset = numbers.to_s
  end

end

# Decrypt.new(ARGV[0], ARGV[1], ARGV[2], ARGV[3])
