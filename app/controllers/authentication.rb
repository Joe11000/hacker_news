
#----------------------------------GET-----------------------------
get '/login' do
  erb :login
end

get '/signup' do
  erb :signup
end

#-------------------------------------POST----------------------------
post '/users/new' do
  puts params.inspect
  @user = User.new(params[:user])
  if @user.save
      session[:user_id] = @user.id
      redirect to "/profile/#{@user.id}"
  else
    @errors = @user.errors.full_messages
    erb :new
  end
end

post '/login' do
  @user = User.find_by_email(params[:user][:email])
  if @user && @user.authenticate(params[:user][:password])
    session[:user_id] = @user.id 
    redirect "/profile/#{@user.id}"
  else
    @errors = ["That username/password does not exist"]
    erb :index
  end
  # authenticate
  # set the session
  # redirect to users/:id page
end
