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
    @gossips = Gossip.index_gossips
    @gossips[params[:id].to_i]
    erb :show
  end
  
  post '/gossips/new/' do
    Gossip.new("#{params["gossip_author"]}", "#{params["gossip_content"]}").save
    redirect '/'
  end
  
end