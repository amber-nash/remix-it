get '/users' do
  @users = User.all
  erb :'users/index.html'
end

get '/users/new' do
  @user = User.new(params[:user])

  erb :'users/new.html'
end

post '/users' do

  @user = User.new(params[:user])
  if @user.save
    login(@user)
    redirect '/'
  else
    erb :'users/new.html'
  end
end

get '/users/:id' do

  @user = User.find(params[:id])
  erb :'users/show.html'
end

get '/users/:id/edit' do

  @user = User.find(params[:id])
  erb :'users/edit.html'
end

put '/users/:id' do

  @user = User.find(params[:id])
  @user.assign_attributes(params[:user])
  if @user.save
    redirect '/users'
  else
    erb :'users/edit.html'
  end
end

delete '/users/:id' do

  @user = User.find(params[:id])
  @user.destroy
  redirect '/users'
end
