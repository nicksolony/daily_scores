class DailyScores::Cli

  def call
    list_options
    main_menu
    finish
  end

  def list_options
    puts <<-DOC
Welcome to Daily Scores!

============================================================

    DOC
#Please select a country to check scores from the list below
#(1-8):
#1. England
#2. Spain
#3. Germany
#4. Italy
#5. France
#6. All
#7. Start menu
#8. Exit


    @countries = DailyScores::Country.numbered_list

  end

  def main_menu
    @input = 0
    while @input != "exit" do
      puts "Enter your selection(Start for Start Menue, Exit to finish)"
      @input = gets.strip.downcase
      #case @input
      #when "1"
      if @input == "start"
      list_options
    #    puts "1. Leicester City 4 - 1 West Ham United"
    #    puts "2. Tottenham Hotspur 2 - 1 Norwich City"
    #    puts "3. Manchester United 0 - 2 Burnley"
    #    game_menu
    #  when "2"
    #    puts "following spanish teams played today"
    #    game_menu
    #  when "3"
    #    puts "following german teams played today"
    #  when "4"
    #    puts "following itallian teams played today"
    #  when "5"
    #    puts "following german teams played today"
    #  when "6"
    #    puts "following games happened today"
  elsif @input.to_i <= DailyScores::Country.all.size && @input.to_i !=0
        puts "following teams played in #{DailyScores::Country.all[@input.to_i-1]} today"
      else
        puts "I didn't understand you, please select an option 1-8"
      end
  end
end
def game_menu
      game_input = gets.strip
      case @input
      when "1"
        puts "Select game that was played, select 0 for start menu and X for exit"
        case game_input
          when "1"
            puts "Leicester City 4 - 1 West Ham United - details"
          when "2"
            puts "Tottenham Hotspur 2 - 1 Norwich City details"
          when "3"
            puts "Manchester United 0 - 2 Burnley details"
          when "0"
            list_options
          when "X"
            finish
          else
            puts "I didn't understand you, please select game number, 0 for start menu and X for exit"
          end
        else
          puts "no games were played today"
        end

end
  def finish
    puts "It was a great game! Thank you!"
    exit
  end
end
