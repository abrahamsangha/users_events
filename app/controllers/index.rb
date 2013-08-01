get '/' do
  # Look in app/views/index.erb
  erb :index
end

post '/create' do
  @user = User.new(params[:user])
  if @user.save
    session[:id] = @user.id

    redirect '/'
  end
end

post '/login' do
  @user = User.find_by_email(params[:email])
  if @user && User.authenticate(params[:email], params[:password])
    session[:id] = @user.id
    redirect '/events'
  else
    redirect '/'
  end
end

get '/logout' do
  session[:id] = nil
  redirect '/'
end

