require 'pry'
class DailyScores::Cli

  def call
    list_options_new
    main_menu
    finish
  end

  def list_options_new
    puts <<-DOC
Welcome to Daily Scores!

============================================================

    DOC
    DailyScores::Country.reset_all
    @countries = DailyScores::Country.numbered_list


  end

  def list_options
    puts <<-DOC
Welcome to Daily Scores!

============================================================

    DOC
    #DailyScores::Country.reset_all
    @countries = DailyScores::Country.all.each_with_index {|country,i|
      puts"#{i+1}. #{country.name}"}


  end

  def main_menu
    @country_input = 0
    while @country_input != "exit" do
      puts "Enter your selection(Start for Start Menu, Exit to finish)"
      @country_input = gets.strip.downcase
      #case @input
      #when "1"
      if @country_input == "start"
        list_options
      elsif @country_input.to_i <= DailyScores::Country.all.size && @country_input.to_i !=0
        league_menu
      else
        puts "I didn't understand you, please proceed with selection"
      end
    end
  end

  def league_menu
    puts "In #{DailyScores::Country.all[@country_input.to_i-1].name} following leagues had games played today"
    puts ""
    scores
  end

  def scores
    @league_input = ""
    while @league_input != "back" do
      puts "Select league to view or Back to go to main menu)"

      DailyScores::Country.leagues_numbered_list(@country_input.to_i-1)
      @league_input = gets.strip.downcase

      if @league_input.to_i <= DailyScores::League.all.size && @league_input.to_i !=0

        puts "#{DailyScores::Country.all[@country_input.to_i-1].name} #{DailyScores::League.all[@league_input.to_i-1].league_name}"

        DailyScores::League.league_games_numbered_list(@league_input.to_i-1)

        puts ""
      elsif @league_input == "back"

      else
        puts "I didn't understand you, please proceed with selection"
      end
    end
    list_options
  end



  #def not_done
  #  @league_input = 0
  #  @league_input = gets.strip
  #  case @input
  #  when "1"
  #    puts "Select game that was played, select 0 for start menu and X for exit"
  #    case game_input
  #      when "1"
  #        puts "Leicester City 4 - 1 West Ham United - details"
  #      when "2"
  #        puts "Tottenham Hotspur 2 - 1 Norwich City details"
  #      when "3"
  #        puts "Manchester United 0 - 2 Burnley details"
  #      when "0"
  #        list_options
  #      when "X"
  #        finish
  #      else
  #        puts "I didn't understand you, please select game number, 0 for start menu and X for exit"
  #      end
  #    else
  #      puts "no games were played today"
  #    end

  #  end
def finish
  puts "It was a great game! Thank you!"
  exit
end
  end
