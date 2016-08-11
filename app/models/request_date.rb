class Request_date
  attr_reader :day, :month, :year

  def self.create(day, month, year)
    @day = day
    @month = month
    @year = year
    @request_date = Request_date.new(day, month, year)
  end

  def self.instance
    @request_date
  end
end
