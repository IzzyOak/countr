require 'rubygems'
require 'bundler'
Bundler.require(:default)
require './models'
require 'json'

set :public_folder, 'assets'

get '/' do
  @counters = Counter.all
  erb :index
end

get '/counters/:id.json' do
  @counter = Counter.find(params[:id])
  JSON.generate(@counter.as_json)
end

get '/counters/:id' do
  @counter = Counter.find(params[:id])
  erb :show
end

put '/counters/:id' do
  @counter = Counter.find(params[:id])
  content_type :json
  input_json = JSON.parse(request.body.read)
  @counter.update_attributes(input_json["counter"])
  JSON.generate(@counter.as_json)
end