get "/posts" do
  @posts = Post.all
  erb :"posts/index"
end

get "/posts/new" do
  require_user
  erb :"/posts/new"
end

post '/posts' do
  @user = current_user
  @post = Post.new(params[:post])
  @post.poster = @user
  if @post.save
    redirect '/post'
  else
    erb :'/posts/new'
  end
end

get '/posts/:id' do
  @post = Post.find_by(id: params[:id])
  @comments = @post.comments
  erb :'posts/show'
end


get '/posts/:id/edit' do
  @post = Post.find_by(id: params[:id])
  erb :'/posts/edit'
end

delete '/posts/:id' do
  @post = Post.find_by(id: params[:id])
  @post.destroy
  @user = @post.poster
  redirect "/users/#{@user.id}"
end
