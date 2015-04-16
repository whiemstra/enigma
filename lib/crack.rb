class Crack
  attr_accessor :encrypted_filename, :output_filename, :date_key

  def initialize(encrypted_filename, output_filename, date_key)
    self.encrypted_filename = encrypted_filename
    self.output_filename = output_filename
    self.date_key = date_key
    @known_message = "..end.."
    @cracked_key = ""
    @cracked_messaged = ""

  end

  def crack
    10000...99999.detect do |key|
      decrypt = Decrypt.new(encrypted_filename, output_filename, key, date_key)
      decrypt.encrypted_message[-7..-1] == @known_message
    end
  end

#results: when index[-7..-1] of result equals "..end.."
    #then cracked message and cracked key is found
end
