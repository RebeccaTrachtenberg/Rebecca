get '/login' do
  erb :'/login/new'
end

post '/login' do
  @user = User.find_by(email: params[:user][:email])
  #make ure you need to find the user by email
  if @user && @user.authenticate(params[:user][:password])
    session[:user_id] = @user.id
    redirect "/users/#{@user.id}"
  else
    error_login(@user)
    erb :'/login/new'
  end
end

get '/logout' do
  session.clear
  redirect '/login'
end
