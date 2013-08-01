get '/events' do

  if session[:id]
    @user = User.find(session[:id])
    erb :events
  else
    redirect to '/'
  end
  
end

get '/events/create' do
  if session[:id]
    @user = User.find(session[:id])
    # if request.xhr?
      
    # else
    #   erb :events_create
    # end
  else
    redirect to '/'
  end
end

post '/events/create' do
  @user = User.find(session[:id])
  # @user.created_events << Event.create(params[:event])
  @user.created_events.create(params[:event])

  redirect to '/events'
end

get '/events/edit/:id' do
  if session[:id] == Event.find(params[:id]).user_id
    @user = User.find(session[:id])
    @event = Event.find(params[:id])
    erb :events_edit
  else
    redirect to '/'
  end

end

post "/events/edit/:id" do
  # @user = User.find(session[:id])
  # @user.created_events << Event.create(params[:event])
  # @user.created_events.update_attributes(params[:event])
  Event.find(params[:id]).update_attributes(params[:event])

  redirect to '/events'
  
end

get '/events/delete/:id' do
  if session[:id] == Event.find(params[:id]).user_id
    Event.destroy(params[:id])
    redirect to '/events'

  else
    redirect to '/'
  end

end
