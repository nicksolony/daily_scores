class DailyScores::Country
  @@all = []

  attr_accessor :name
  attr_reader :leagues

  def initialize(name)
    @name = name
    @leagues = []
  end

  def save
    @@all << self
  end

  #def self.create(name)
  #  country = new(name)
  #  country.save
  #  country
  #end


  def self.all
    @@all
  end

  def self.reset_all
    @@all = []
  end


  def add_league(league)
   if league.country == nil
     league.country = self
   else
     league.country
   end
   if @leagues.include? league
    else
      @leagues << league
    end
  end




  def self.numbered_list
      self.all.each_with_index { |country,i|
      puts "#{i+1}. #{country.name}"
    }
    end

    def self.leagues_numbered_list(country_index)
      self.all[country_index].leagues.each_with_index {|league,i|
        puts "#{i+1}. #{league.league_name}"
      }
    end


end
