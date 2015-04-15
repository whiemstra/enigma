class DateKey
  attr_reader :date
  def initialize(date=today)
    @date = date
  end

  def today
    Time.new.strftime("%d%m%y")
  end

  def offsets
    squared.to_s.chars.last(4).map(&:to_i)
    #squared.to_s[-4..-1].chars.map($:to_i)
  end

  def date_num
    date.to_i
  end

  def squared
    date_num**2
  end
end

# date = DateKey.new(041415)
# puts date.squared
# print date.offsets
