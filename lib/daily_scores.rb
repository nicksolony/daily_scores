require "nokogiri"
require 'open-uri'
require_relative "daily_scores/version"
require_relative "daily_scores/league"
require_relative "daily_scores/country"
require_relative "daily_scores/cli"
require_relative "daily_scores/scraper"


module DailyScores
  class Error < StandardError; end
  # Your code goes here...
end
