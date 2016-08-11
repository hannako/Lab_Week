require 'bcrypt'
require 'dm-validations'


class User

  include DataMapper::Resource

  # has n, :spaces, through: Resource

  attr_reader :password
  attr_accessor :password_confirmation

  validates_confirmation_of :password



  property :id, Serial
  property :username, String
  property :email, String, format: :email_address, required: true, unique: true
  property :password_digest, String, length: 70
  # property :password_confirmation, Text


  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def self.authenticate(username, password)
    user = first(username: username)
      if user && BCrypt::Password.new(user.password_digest) == password
        user
      else
        nil
      end
  end

end
