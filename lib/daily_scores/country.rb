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

  def self.create(name)
    country = new(name)
    country.save
    country
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
    #england = self.new
    #england.name = "England"
    ##england.leagues = ["PREMIER LEAGUE","FA Cup"]

    #italy = self.new
    #italy.name = "Italy"
    #italy.leagues = ["SERIE C:: GROUP B"]

    #spain = self.new
    #spain.name = "Spain"
    #spain.leagues = ["COPA DEL REY"]

    #epl = DailyScores::League.new
    #epl.league_name = "PREMIER LEAGUE"
    #epl.games = ["Wolverhampton Wanderers 1 - 2 Liverpool","asdasdas"]
    #epl.country = england

    #fa_cup = DailyScores::League.new
    #fa_cup.league_name = "FA Cup"
    #fa_cup.games = ["Tranmere Rovers 2 - 1 Watford"]
    #fa_cup.country = england

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
      page = Nokogiri::HTML(open("https://www.scorespro.com"))
      doc = page.css("[id=mainfeed]")
      main = doc.css("div.comp_title__counter")
      main.each_with_index {|block,i|
        #binding.pry
        country_name = main[i].css("a").attribute("title").text.split(":")[0]
        if @@all.any? {|c| c.name == country_name}
          country = @@all.find {|c| c.name == country_name}
        else
          country = new(country_name)
          country.save
        end
        #country = self.new
        #country.name = main[i].css("a").attribute("title").text.split(":")[0]
        league_name = main[i].css("a").text.split(": ")[1].split(" (")[0]
      #  binding.pry
        if country.leagues.any? {|l| l.league_name == league_name}
          #country = @@all.find {|c| c.name == country_name}
        else
          league = DailyScores::League.new(league_name)
          country.add_league(league)
        end




        }


      #name = main.css("div.comp_title__counter")[0].text.split(":")[0]
      #league_name = main.css("div.comp_title__counter")[0].text.split(": ")[1].split(" (")[0]
      #row = main.css("table tbody tr")[0]
      #away_team = if row.css("td[@class='away winteam uc'] a").text == ""
      #              row.css("td[@class='away uc'] a").text
      #            else
      #              row.css("td[@class='away winteam uc'] a").text
      #            end
      #home_team = if row.css("td[@class='home winteam uc'] a").text == ""
      #              row.css("td[@class='home uc'] a").text
      #            else
      #              row.css("td[@class='home winteam uc'] a").text
      #            end
      #score = if row.css("td[@class='score cshas_ended']").text == ""
      #              row.css("td[@class='score']").text
      #            else
      #              row.css("td[@class='score cshas_ended']").text
      #            end
      #game = "#{home_team} #{score} #{away_team}"

    end
    #if game == "  "

end
