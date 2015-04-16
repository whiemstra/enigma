require_relative './key_set'
require_relative './date_key'

class Encrypt
  attr_accessor :input_filename, :output_filename

  def initialize(input_filename, output_filename)
    self.input_filename = input_filename
    self.output_filename = output_filename
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
        encrypted_num = character_map.index(letter.downcase) + rotation[index]
        encrypted <<  character_map[encrypted_num % character_map.length]
      end
    end
    encrypted.join('')
  end

  def rotation
    # Phase One (Encrypt handled it himself)
    #   keyset_array = keyset.chars.each_cons(2).map(&:join).map(&:to_i) # keyset
    # Phase Two (Encrypt said "hey give me that array for keyset 12345")
    keyset_array = KeySet.new(keyset).offsets
    date_array = [5, 3, 6, 9] # TODO make this real

    rotation = []
    keyset_array.each_with_index do |num, index|
      rotation << (num + date_array[index])
    end

    rotation
  #  date + keyset
  end

  def date
    @date
  end

  def date=(time) # obj.date = 'foo'
    @date = time.strftime('%d%m%y')
  end

  def keyset
    @keyset # [10, 02, 22, 21]
  end

  def keyset=(numbers)
    @keyset = numbers.to_s
  end

end

# encrypt = Encrypt.new(ARGV[0], ARGV[1])
# encrypt.keyset = 12345 # TODO this should be generated
# encrypt.write_encrypted_message
