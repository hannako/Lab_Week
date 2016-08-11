class Request_date
  attr_reader :day, :month, :year

  def initialize(day, month, year)
    @day = day
    @month = month
    @year = year
    # @space_name = space_name
  end

  def self.create(day, month, year)
    @request_date = Request_date.new(day, month, year)
  end

  def self.instance
    @request_date
  end
end
