require 'bundler/setup'
Bundler.require
require 'sinatra/reloader' if development?
require './models'
require 'sinatra'
require 'sinatra/activerecord'

get '/' do
  @medicines = Medicine.all
  erb :index
end

get '/item/create' do
  erb :new
end

post '/item/create' do
  Medicine.create(name: params[:name], number: params[:number])
  redirect '/'
end

get '/item/:id' do
  @medicines = Medicine.find(params[:id])
  erb :item
end

patch '/item/:id' do
  medicine = Medicine.find(params[:id])
  medicine.update(name: params[:name], number: params[:number])
  redirect '/'
end

get '/item/:id/delete' do
  medicines = Medicine.find(params[:id])
  medicines.destroy
  redirect '/'
end
