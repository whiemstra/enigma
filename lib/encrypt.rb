require_relative './key_set'
require_relative './date_key'

class Encrypt
  attr_accessor :input_filename, :output_filename

  def initialize(input_filename, output_filename)
    self.input_filename = input_filename
    self.output_filename = output_filename
    self.date = Time.new
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
        if character_map.index(letter.downcase)
          encrypted_num = character_map.index(letter.downcase) + rotation[index]
          encrypted <<  character_map[encrypted_num % character_map.length]
        end
      end
    end
    encrypted.join('')
  end

  def rotation
    keyset_array = keyset_object.offsets
    date_array = DateKey.new(date).offsets
    rotation = []
    keyset_array.each_with_index do |num, index|
      rotation << (num + date_array[index])
    end

    rotation
  end

  def keyset_object
    @keyset_object ||= KeySet.new(keyset)
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

if __FILE__ == $0
  # this will only run if the script was the main, not load'd or require'd
  encrypt = Encrypt.new(ARGV[0], ARGV[1])
  encrypt.write_encrypted_message
  puts "Created '#{encrypt.output_filename}' with the key #{encrypt.keyset_object.keystring} and date #{encrypt.date}"
end
