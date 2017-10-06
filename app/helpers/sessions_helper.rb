helpers do

  def logged_in?
    !!session[:id]
  end

  def current_user
    User.find_by(id: session[:id])
  end

  def login(user)
    session[:id] = user.id
  end

  def logout
    session[:id] = nil
  end
end
