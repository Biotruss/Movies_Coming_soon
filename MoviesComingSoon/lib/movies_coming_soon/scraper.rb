class MoviesComingSoon::Scraper

  def self.scrape_upcoming_movies
    doc = Nokogiri::HTML(open("https://www.rottentomatoes.com/browse/upcoming"))

    names = doc.css("div.media-list__title").map { |n| n.text }
    refs = doc.css(".media-list__movie-info a").map { |a| a["href"] }

    names.each_index do |i|
      name = names[i]
      ref = refs[i]
      MoviesComingSoon::ComingSoon.new(name, ref)
    end
  end

  def self.scrape_movie(name, ref)
    url = "https://www.rottentomatoes.com/#{ref}"
    doc = Nokogiri::HTML(open(url))

    n = name
    synopsis = doc.css("div#movieSynopsis.movie_synopsis.clamp.clamp-6.js-clamp").text.strip
    release_date = doc.css("p.mop-ratings-wrap__prerelease-text").css("strong").text.strip
    MoviesComingSoon::Movie.new(n, release_date, synopsis)
  end
end
