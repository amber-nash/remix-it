get '/login/new' do
  erb :'sessions/new.html'
end

post '/login' do
  if user = User.find_by(email: params['email'])
    login(user)
    redirect '/'
  else
    erb :'/sessions/new.html'
  end
end

delete '/login' do
  logout
  redirect '/'
end