  class Space
    include DataMapper::Resource

    # belongs_to :user, :key => true

    property :id, Serial
    property :name, String
    property :description, String
    property :price, Integer

  end
