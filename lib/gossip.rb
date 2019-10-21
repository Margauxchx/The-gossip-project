require 'csv'
require 'pry'

class Gossip
  attr_accessor :author, :content, :id
  
  def initialize (author,content)
    @author = author
    @content = content
    @@compteur = 0
    @id = @@compteur
    @@compteur+=1
  end

  def save
    CSV.open("./db/gossip.csv", "ab") do |csv|
      csv << ["#{@author}","#{@content}"]
    end
  end
  
  def self.all
  all_gossips = []
    CSV.read("./db/gossip.csv").each do |csv_line|
    all_gossips << Gossip.new(csv_line[0], csv_line[1])
    end
  return all_gossips
  end
  
  def self.find(id)
    return self.all[id.to_i]
  end

  def self.index_gossips
    CSV.read("db/gossip.csv") 
  end 
  

end
