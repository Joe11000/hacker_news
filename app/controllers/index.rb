#-----------------------------GET----------------------------

get '/' do
  # debugger
  @posts = Post.all.order("title DESC")
  if session[:user_id]
    @user = User.find(session[:user_id]).voted_on_posts
    erb :index
  else
    erb :index
  end
end

get '/posts/:post_id' do
  @post = Post.find(params[:post_id])
  erb :comments
end

get '/profile/:user_id' do
  @user = User.find(params[:user_id])
  erb :profile
end

get "/logout" do
  session[:user_id].clear
  erb :index
end

#-------------------------------POST----------------------------------

post "/upvote/post/:comment_id" do
  
  @upvote = CommentVote.find_or_create_by_comment_id_and_user_id(params[:comment_id], session[:user_id])

  if @upvote.id
    @upvote.save
    if request.xhr?
      erb :_upvote, layout:false
    else
      erb :index  # HINT: what does this do? what should we do instead? 
    end
  end
end


post "/upvote/:post_id" do
    
  puts params.inspect
  @upvote = PostVote.find_or_create_by_post_id_and_user_id(params[:post_id], session[:user_id])

  puts @upvote
  if @upvote.id
    puts "#{@upvote}"
    @upvote.save
    if request.xhr?
      erb :_upvote, layout:false
    else
      erb :index  # HINT: what does this do? what should we do instead? 
    end
  end
end
