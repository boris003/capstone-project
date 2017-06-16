class User < ApplicationRecord
  has_secure_password

  has_many :votes
  has_many :posts
  has_many :comments
  has_many :user_tags
  has_many :tags, through: :user_tags
  has_many :subscribtions




#ASK DANI FOR HELP WITH "SUBSCRIPTIONS RELATIONSHIPS"
  # has_many :subscriptions
  # has_many :subscriber, through: :subscriptions
  # has_many :subscribed_to, through: :subscriptions

  # has_many :subscriptions, class_name:  "Subscription",
  #                                 foreign_key: "subscriber_id"
  # has_many :subscribed_to, through: :subscriptions, source: :subscribed_to 
end