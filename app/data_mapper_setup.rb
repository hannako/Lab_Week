require 'data_mapper'
require 'dm-postgres-adapter'
require_relative 'models/space'
require_relative 'models/day'

# require_relative 'models/eg'

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/bnb_#{ENV['RACK_ENV']}")
DataMapper.finalize
DataMapper.auto_upgrade!
