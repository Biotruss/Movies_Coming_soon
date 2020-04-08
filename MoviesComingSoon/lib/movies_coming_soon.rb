require_relative "./movies_coming_soon/version"
require_relative "./movies_coming_soon/cli"
require_relative "./movies_coming_soon/coming_soon"
require_relative "./movies_coming_soon/movie"
require_relative "./movies_coming_soon/scraper"

require 'nokogiri'
require 'open-uri'
require 'pry'


module MoviesComingSoon
  class Error < StandardError; end
  # Your code goes here...
end
