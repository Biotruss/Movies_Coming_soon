class MoviesComingSoon::CLI

  def call
    puts "Welcome to my Upcoming Movies CLI Project!"
    puts "------------------------------------------"
    fetch_coming_soon
    list_movies
    fetch_user_movie
  end

  def fetch_coming_soon
    @cs = MoviesComingSoon::ComingSoon.all
  end

  def list_movies
    puts "Here is a list of movies coming soon!"
    @cs.each.with_index(1) do |movie, index|
      puts "#{index}. #{movie.name}"
    end
  end

  def fetch_user_movie
    input = nil
    @counter = 0
    ui_text
    while input != "exit"
      input = gets.strip.downcase
      if input.to_i > 0 && input.to_i <= @cs.length
        @mcs = @cs[input.to_i - 1]
        MoviesComingSoon::Scraper.scrape_movie(@mcs.name, @mcs.ref)
        um = MoviesComingSoon::Movie.all
        puts "---------------------------------------------------------------------------"
        puts "#{um[@counter].name} - #{um[@counter].release_date}"
        puts "------------------------------------"
        puts "#{um[@counter].synopsis}"
        @counter += 1
        ui_text
      elsif input == "list"
        list_movies
      else
        puts "Check back again soon to discover new movies!"
      end
    end
  end

  def ui_text
    puts "---------------------------------------------------------------------------"
    puts "Choose a movie to learn more."
    puts "Or you can also type list to see the list of movies again or exit to leave."
    puts "---------------------------------------------------------------------------"
  end
end
