get '/login' do
  @users = User.all
  erb :'/users/new'
end

get "login/new" do
  erb :'/login/new'
end

post '/login' do
  @user = User.find_by(email: params[:email])
  if @user && @user.authenticate(params[:password])
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
