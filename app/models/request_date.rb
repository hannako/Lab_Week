class Request_date
  attr_reader :day, :month, :year, :name

  def initialize(day, month, year, name)
    @day = day
    @month = month
    @year = year
    @name = name
  end

  def self.create(day, month, year, name)
    @request_date = Request_date.new(day, month, year, name)
  end

  def self.instance
    @request_date
  end
end
