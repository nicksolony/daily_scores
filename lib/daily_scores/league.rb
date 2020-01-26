class DailyScores::League
  @@all = []

  attr_accessor :league_name, :games, :country

  def initialize(league_name)
    @league_name = league_name
    @@all << self
    @games=[]
  end

  def save
    @@all << self
  end

  def self.create(league_name)
    league = new(league_name)
    league.save
  end


  def self.all
    @@all
  end

  def country=country
    @country = country
   country.add_league(self)
  end


  def self.numbered_games_list


    self.all.each_with_index { |league,i|
      puts "#{i+1}. #{league.league_name}"
    }
    end

    def self.league_games_numbered_list(league_index)

      self.all[league_index].games.each_with_index {|game,i|
        puts "#{i+1}. #{game}"
      }
    end

    def league_games_numbered_list

        @games.each_with_index {|game,i|
        puts "#{i+1}. #{game}"
      }
    end



end
