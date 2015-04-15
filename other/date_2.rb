class DateKey

  def initialize(date)
    @date = date
  end

  def square
    @square_date = @date.to_i**2
  end

  def grab_last_four
    @date_code = @square_date.to_s[-4..-1]
  end

  puts @date_code
end


# t = Time.new.strftime("%m%d%y")
# puts t
#
# t.slice!(0)
# puts t
#
# t = (t.to_i)**2
# puts t
#
# #t = t.to_s.slice!(0...5) ???????????????
# t = t.to_s.split(//).last(4).to_s
# puts t
