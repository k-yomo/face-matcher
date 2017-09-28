get '/' do
  
end

get '/users/new' do
  erb :'users/new'
end

post '/users' do
  @user = User.new(params[:user])
  if @user.save
    '/'
  else
    redirect '/users/new'
  end
end

get '/users/:id' do

end

get '/users/:id/edit' do

end

patch '/users/:id' do

end

delete '/users/:id' do

end
