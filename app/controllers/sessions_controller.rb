
get '/login' do
  erb :'/login'
end

post '/login' do
  @user = User.authenticate(email: params[:email], password: params[:password])
  if @user
    login(@user)
    redirect "/faces/find"
  else
    erb :'/login'
  end
end

get '/logout' do
  logout
  redirect "/"
end
