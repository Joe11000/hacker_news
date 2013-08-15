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

post "/upvote/post/:comment_id" do
    value = params[:value] ? params[:value].to_i : nil
 
  @roll = value ? Roll.create({ value: value }) : Roll.create
 
  if request.xhr?
    erb :_die_image, layout: false
  else
    erb :index  # HINT: what does this do? what should we do instead? 
  end
end



post "/upvote/:post_id" do
    
  puts params.inspect
  @upvote = PostVote.find_or_create_by_post_id_and_user_id(params[:post_id], session[:user_id])

  if @upvote.id
    if request.xhr?
      erb :_upvote, layout:false
    else
      erb :index  # HINT: what does this do? what should we do instead? 
    end
  end
end
