class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :password, :first_name, :last_name, :email, :bio, :location, :image_url

  has_many :posts 

  has_many :comments

  has_many :inspirations

  has_many :followers

  has_many :following 

end
