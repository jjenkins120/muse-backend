class CommentSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :post_id, :content,  :created_at, :updated_at
  
  belongs_to :user
  belongs_to :post
  
end
