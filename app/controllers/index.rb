#-----------------------------GET----------------------------

get '/' do
  @posts = Post.all.order("title DESC")
  erb :index
end

get '/posts/:post_id' do
  @post = Post.find(params[:post_id])
  erb :comments
end

get '/profile/:user_id' do
  @user = User.find(params[:user_id])
  erb :profile
end

#-------------------------------POST----------------------------------

