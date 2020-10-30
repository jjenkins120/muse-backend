class PostSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :user_id, :link_url, :post_id, :likes, :category

  has_many :tags

  has_many :inspired_users

  belongs_to :user

  has_many :posts 

  belongs_to :post 

  

end
