get '/login' do

  erb :'/sessions/new.html'
end

post '/login' do
  @user = User.find_by(email: params[:user][:email])

  if @user && @user.authenticate(params[:user][:password])
    login(@user)
    redirect "/users/#{@user.id}"
  else
    @error = "Invalid email or password"
    erb :'/sessions/new.html'
  end
end

get '/logout' do
  logout

  redirect '/'
end
