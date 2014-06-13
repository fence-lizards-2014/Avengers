get '/' do
	@user = current_user
  @surveys = Survey.all
  erb :index
end

#----------- SESSIONS -----------

get '/sessions/new' do
  # render sign-in page
  erb :sign_in
end

post '/sessions' do
  # sign-in
  @user = User.find_by_email(params[:email])
  if @user != nil && @user.password == params[:password]
  	session[:id] = @user.id
  end

  redirect '/'
end

delete '/sessions/:id' do
  # sign-out -- invoked
  session[:id] = 0
  redirect '/'
end

#----------- USERS -----------

get '/users/new' do
  # render sign-up page
  erb :sign_up
end

post '/users' do
  # sign-up a new user
  @new_user = User.create(first_name: params[:user][:first_name], last_name: params[:user][:last_name], email: params[:user][:email], password_hash: params[:user][:password])
	@new_user.password = params[:user][:password]
  @new_user.save!
	session[:id] = @new_user.id
	redirect '/'
end

#----------- Survey ----------

get '/surveys/create' do
  erb :create_survey
end

get '/surveys/:id' do
  @survey = Survey.find_by_id(params[:id])
  erb :survey
end

get '/surveys' do
  @surveys = Survey.all
  erb :surveys_all
end

post '/user/:id/survey' do
  redirect ''
end

get 'user/:id' do
end


post '/surveys' do
  p params
  @survey_name = params[:survey]
  @question = params[:question]
  Survey.create(title: params['survey'])
  Question.create(text: params['question'])

  {survey: @survey_name, question: @question}.to_json
  # something.each do |var
  #   Choice.create(text: params['choice'])
  # end
  # p @@survey_name
  # p @question
  # p @choice
end