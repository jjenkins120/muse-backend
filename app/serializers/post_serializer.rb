class PostSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :user_id, :link_url, :post_id, :likes, :category, :created_at

  has_many :inspired_users

  has_many :comments

  belongs_to :user

  has_many :posts 

  belongs_to :post 

end
