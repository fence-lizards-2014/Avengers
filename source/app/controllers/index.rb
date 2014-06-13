get '/' do
	@user = current_user
  @surveys = Survey.all
  if current_user
    responses = Response.where(user_id: @user.id)
    taken_surveys = responses.map do |response|
      choice = Choice.find_by_id(response.choice_id)
      question = Question.find_by_id(choice.question_id)
      Survey.find_by_id(question.survey_id)
    end

    @not_taken_surveys = @surveys - taken_surveys.uniq
    @taken_surveys = taken_surveys.uniq
  else
    @not_taken_surveys = Survey.all
    @taken_surveys = []
  end

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

get '/surveys/:id' do
  @survey = Survey.find_by_id(params[:id])
  erb :survey
end

get '/surveys/:id/results' do
  @survey = Survey.find_by_id(params[:id])
  erb :survey_id_results
end

post '/surveys/:id/results' do
  answers = params[:question]
  id = session[:id]

  answers.each do |key, value|
    Response.create(user_id: id, choice_id: value)
  end

  redirect '/'
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