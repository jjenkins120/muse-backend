class Post < ApplicationRecord
  belongs_to :user

  has_many :user_posts
  has_many :inspired_users, through: :user_posts, source: :user

  has_many :posts 
  belongs_to :post, optional: true
  
  has_many :post_tags
  has_many :tags, through: :post_tags

end
