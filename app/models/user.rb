class User < ApplicationRecord
    has_secure_password

    has_many :comments

    has_many :posts

    has_many :user_posts
    has_many :inspirations, through: :user_posts, source: :post

    has_many :initiated_follows, foreign_key: :follower_id, class_name: 'Follow'
    has_many :following, through: :initiated_follows

    has_many :accepted_follows, foreign_key: :following_id, class_name: 'Follow'
    has_many :followers, through: :accepted_follows

    has_many :received_messages, foreign_key: :recipient_id, class_name: "Message"
    has_many :senders, through: :received_messages

    has_many :sent_messages, foreign_key: :sender_id, class_name: "Message"
    has_many :recipients, through: :sent_messages
end
