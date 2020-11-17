class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :password, :first_name, :last_name, :email, :bio, :location, :image_url

  has_many :posts 

  has_many :comments

  has_many :inspirations

  has_many :followers

  has_many :following 

  has_many :received_messages, foreign_key: :recipient_id, class_name: "Message"
  has_many :senders, through: :received_messages

  has_many :sent_messages, foreign_key: :sender_id, class_name: "Message"
  has_many :recipients, through: :sent_messages

end
