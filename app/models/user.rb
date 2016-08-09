require 'bcrypt'
require 'dm-validations'


class User
  include DataMapper::Resource

  attr_reader :password
  attr_accessor :password_confirmation

  property :id, Serial
  property :username, String
  property :email, String
  property :password_digest, String, length: 70
  # property :password_confirmation, Text

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  validates_confirmation_of :password
end
