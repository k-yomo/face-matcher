get '/faces' do
  @faces = User.all.map { |user| user.self_image }
  erb :"/faces/index"
end


get '/faces/find' do
  if logged_in?
    @ideal_image = current_user.ideal_image
    erb :'/faces/find'
  else
    redirect '/'
  end
end

post '/faces/find' do
  @similarities = []
  User.all.each do |user|
    if user != current_user
      @similarities << {user_id: user.id, similarity: Face.compare_faces(current_user.ideal_image, user.self_image).face_matches[0][:similarity]}
    end
  end
  p "*" * 100
  p @similarities
  erb :'/faces/find_show'
end

get '/faces/detect' do
  if logged_in?
    erb :'/faces/detect'
  else
    redirect '/'
  end
end

post '/faces/detect' do

  @detected_emotions = Face.detect_face(face_image).face_details[0].emotions
  erb :'faces/detect_show'
end
