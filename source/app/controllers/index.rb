get '/' do
  erb :index
end

get '/survey/:id' do
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