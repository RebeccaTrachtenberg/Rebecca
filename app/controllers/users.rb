get "/users/new" do
  erb :"/users/new"
end

get "/users/:id" do
  if logged_in?
    @user= User.find_by(id: params[:id])
    # @bidding = @user.bidding.uniq
    # @auctions = @user.items
    erb :'/users/show'
  else
    redirect "/"
  end
end

post "/users" do
  user = User.new(params[:user])
  if user.save
    session[:user_id] = user.id
    redirect "/users/#{user.id}"
  else
    @errors = user.errors.full_messages
    erb :"users/new"
  end
end
