class Request
    attr_reader :day, :month, :year

    def initialize
      @request = nil
    end
    
    self.create(day, month, year)
        @day = day
        @month = month
        @year = year
        @request = Request.new(day, month, year)
    end

    self.instance
        @request
    end

end
