class Day
  include DataMapper::Resource
  # belongs_to :space

  property :id, Serial
  property :day, Integer
end
