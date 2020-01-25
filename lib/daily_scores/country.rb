class DailyScores::Country
  @@all = []

  attr_accessor :name, :leagues

  def initialize
    @@all << self
    @leagues = []
  end



  def self.all
    @@all
  end

  def self.reset_all
    @all = []
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
    self.scrape
    england = self.new
    england.name = "England"
    #england.leagues = ["PREMIER LEAGUE","FA Cup"]

    italy = self.new
    italy.name = "Italy"
    italy.leagues = ["SERIE C:: GROUP B"]

    spain = self.new
    spain.name = "Spain"
    spain.leagues = ["COPA DEL REY"]

    epl = DailyScores::League.new
    epl.league_name = "PREMIER LEAGUE"
    epl.games = ["Wolverhampton Wanderers 1 - 2 Liverpool","asdasdas"]
    epl.country = england

    fa_cup = DailyScores::League.new
    fa_cup.league_name = "FA Cup"
    fa_cup.games = ["Tranmere Rovers 2 - 1 Watford"]
    fa_cup.country = england

    self.all.each_with_index { |country,i|
      puts "#{i+1}. #{country.name}"
    }
    end

    def self.leagues_numbered_list(country_index)
      self.all[country_index].leagues.each_with_index {|league,i|
        puts "#{i+1}. #{league.league_name}"
      }
    end

    def self.scrape
      self.reset_all
      doc = Nokogiri::HTML(open("https://www.scorespro.com"))
      name = doc.css("div.comp_title__counter").each {|country|
      }
      binding.pry
      name = doc.search("div.comp_title__counter").first.text.split(":")[0]


    end


end
