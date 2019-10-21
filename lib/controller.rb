require 'gossip'

class ApplicationController < Sinatra::Base
  
  get '/gossips/new/' do
    erb :new_gossip
  end
  
  get '/' do
    erb :index, locals: {gossips: Gossip.all}
  end
  
  get '/gossips/:id/' do
  "Voici le numéro du potin que tu veux : #{params[:id]} !"
  end
  
  get '/gossips/:id' do 
    erb :show, locals: {gossip_id: Gossip.find(params["id"])}
  end
  
  get '/gossips/edit' do
		erb :edit			
  end
  
  post '/gossips/new/' do
    Gossip.new("#{params["gossip_author"]}", "#{params["gossip_content"]}").save
    redirect '/'
  end
  
end