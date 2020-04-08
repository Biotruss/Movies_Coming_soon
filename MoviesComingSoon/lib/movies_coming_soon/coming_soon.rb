class MoviesComingSoon::ComingSoon
  attr_accessor :name, :ref
  @@all = []

  def initialize(name, ref)
    @name = name
    @ref = ref
    save
  end

  def self.all
    MoviesComingSoon::Scraper.scrape_upcoming_movies if @@all.empty?
    @@all
  end

  def save
    @@all << self
  end
end
