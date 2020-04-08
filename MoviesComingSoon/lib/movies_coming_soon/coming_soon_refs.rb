class MoviesComingSoon::ComingSoonRefs
  attr_accessor :ref
  @@all = []

  def initialize(ref)
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
