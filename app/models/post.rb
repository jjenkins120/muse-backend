class Post < ApplicationRecord

  belongs_to :user

  has_many :comments

  has_many :user_posts
  has_many :inspired_users, through: :user_posts, source: :user

  has_many :posts 
  belongs_to :post, optional: true
  
end
