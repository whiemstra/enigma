require_relative './key_set'
require_relative './date_key'
require_relative './rotation'

class Encrypt
  attr_accessor :input_filename, :output_filename

  def initialize(input_filename, output_filename)
    self.input_filename = input_filename
    self.output_filename = output_filename
    @keyset = KeySet.new
    @date_key = DateKey.new
    @rotation = Rotation.new(@keyset, @date_key)
  end

  def original_message
    File.read(input_filename).strip
  end

  def character_map
    [*('a'..'z'), *('0'..'9'), ' ', '.', ',']
  end

  def write_encrypted_message
    File.open(output_filename, 'w') {|file| file.write(encrypted_message) }
  end

  def encrypted_message
    message_array = original_message.split(//)
    encrypted = []
    message_array.each_slice(4) do |letters|
      letters.each_with_index do |letter, index|
        # index of the letter + rotations[index] equals a value in some future character map
        encrypted_num = character_map.index[letter.downcase] + rotation[index]
        encrypted <<  character_map[encrypted_num % character_map.length]
      end
    end
    encrypted.join('')
  end

  def rotation
    @rotation
  end

  def date
    @date
  end

  def date=(time)
    @date = time.strftime('%m%d%y')
  end

  def keyset
    @keyset
  end

  def keyset=(numbers)
    @keyset = numbers.to_s
  end

end

# encrypt = Encrypt.new(ARGV[0], ARGV[1])
# encrypt.keyset = 12345 # TODO this should be generated
# encrypt.write_encrypted_message
