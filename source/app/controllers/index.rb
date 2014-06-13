get '/' do
  erb :index
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

post 'user/sessions/new' do
end

get '/user/create' do
  erb :create_user
end