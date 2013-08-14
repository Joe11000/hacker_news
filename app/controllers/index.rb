get '/' do
  
  @posts = Post.all.order("title DESC")
  erb :index
end
