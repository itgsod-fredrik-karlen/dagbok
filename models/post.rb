class Post
  include DataMapper::Resource

  property :id, Serial
  property :title, String
  property :created_at, DateTime
  property :text, Text

  belongs_to :user
end