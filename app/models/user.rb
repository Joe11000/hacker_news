class User < ActiveRecord::Base
  has_secure_password

  has_many :comments
  has_many :posts
  has_many :comment_votes
  has_many :post_votes
  
  has_many :voted_on_posts, :through => :post_votes, source: :post
end
