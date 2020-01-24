class DailyScores::Leagues
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
    epl = self.new
    epl.name = "PREMIER LEAGUE"
    epl.games = ["Wolverhampton Wanderers 1 - 2 Liverpool","asdasdas"]
    epl.country = england

    fa_cup = self.new
    fa_cup.name = "FA Cup"
    fa_cup.games = ["Tranmere Rovers 2 - 1 Watford"]
    fa_cup.country = england

    #italy = self.new
    #italy.name = "Italy"
    #italy.leagues = ["SERIE C:: GROUP B"]

    #spain = self.new
    #spain.name = "Spain"
    #spain.leagues = ["COPA DEL REY"]

    self.all.each_with_index { |league,i|
      puts "#{i+1}. #{league.name}"
    }
    end

    def self.league_games_numbered_list(league_index)
    binding.pry
      self.all[league_index].games.each_with_index {|game,i|
        puts "#{i+1}. #{game}"
      }
    end

end
