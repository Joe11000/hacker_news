require 'faker'


def create_posts(num_of_posts = 50)
  num_of_posts.times do 
    Post.create({title:Faker::Company.catch_phrase,
                 content:Faker::Lorem.sentence})
  end
end

def create_comments(num_of_comments = 50)
  num_of_comments.times do 
    Comment.create({body:Faker::Lorem.sentence})
  end
end

def create_users(num_of_users = 50)
  num_of_users.times do 
    User.create({name:Faker::Name.name,
                    email:Faker::Internet.email,
                    password:"123456",
                    password_confirmation: "123456"})
  end
end

create_posts(50)
create_comments(50)
create_users(50)


User.all.each_with_index do |user, index|
   user.comments << Comment.find(index+1)  
   user.posts << Post.find(index+1)               # Comment gets user_id
   # Post.find((index.to_f / 5 ).floor).user = User.find(index) # Post gets user_id
   # comment.post = Post.find((index.to_f / 5 ).floor)                     # Comment gets post_id  
end  

Post.all.each_with_index do |post, index|
  post.comments << Comment.find(index+1)
end







