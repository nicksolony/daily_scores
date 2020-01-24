class DailyScores::Country
  @@all = []

  attr_accessor :name, :leagues

  def initialize
    @@all << self
  end



  def self.all
    @@all
  end

  def self.numbered_list
    england = self.new
    england.name = "England"
    england.leagues = ["PREMIER LEAGUE","FA Cup"]

    italy = self.new
    italy.name = "Italy"
    italy.leagues = ["SERIE C:: GROUP B"]

    spain = self.new
    spain.name = "Spain"
    spain.leagues = ["COPA DEL REY"]

    self.all.each_with_index { |country,i|
      puts "#{i+1}. #{country.name}"
    }
    end

    def self.leagues_numbered_list(country_index)
      self.all[country_index].leagues.each_with_index {|league,i|
        puts "#{i+1}. #{league}"
      }
    end

end
