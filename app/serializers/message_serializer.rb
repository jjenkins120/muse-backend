class MessageSerializer < ActiveModel::Serializer
  attributes :id, :sender_id, :recipient_id, :replied, :read, :content, :created_at

  belongs_to :sender, class_name: 'User'
  belongs_to :recipient, class_name: 'User'

end
