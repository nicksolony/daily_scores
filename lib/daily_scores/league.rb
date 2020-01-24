class DailyScores::League
  @@all = []

  attr_accessor :league_name, :games, :country

  def initialize
    @@all << self
  end



  def self.all
    @@all
  end

  def country=country
    @country = country
   country.add_league(self)
  end


  def self.numbered_games_list


    #italy = self.new
    #italy.name = "Italy"
    #italy.leagues = ["SERIE C:: GROUP B"]

    #spain = self.new
    #spain.name = "Spain"
    #spain.leagues = ["COPA DEL REY"]

    self.all.each_with_index { |league,i|
      puts "#{i+1}. #{league.league_name}"
    }
    end

    def self.league_games_numbered_list(league_index)

      self.all[league_index].games.each_with_index {|game,i|
        puts "#{i+1}. #{game}"  
      }
    end

end
