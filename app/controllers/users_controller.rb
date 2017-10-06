get '/' do
  erb :"/index"
end

get '/users/new' do
  erb :'users/new'
end

post '/users' do
  @user = User.new(params[:user])
  @user.self_image = Face.upload_to_s3(params[:face1][:tempfile])
  @user.ideal_image = Face.upload_to_s3(params[:face2][:tempfile])

  if @user.save
    login(@user)
    redirect "/users/#{@user.id}"
  else
    redirect "/users/new"
  end
end

get '/users/:id' do
  @user = User.find_by(id: params[:id])
  erb :'/users/show'
end

get '/users/:id/edit' do

end

patch '/users/:id' do

end

delete '/users/:id' do

end
