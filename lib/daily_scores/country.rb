class DailyScores::Country
  @@all = ["england","italy","spain"]




  def self.all
    @@all
  end

  def self.numbered_list
    ["england","italy","spain"].each_with_index { |country,i|
      puts "#{i+1}. #{country}"
    }
  end

end
