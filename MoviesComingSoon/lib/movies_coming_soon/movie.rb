class MoviesComingSoon::Movie
  attr_accessor :name, :release_date, :synopsis
  @@all = []

  def initialize(name, release_date, synopsis)
    @name = name
    @release_date = release_date
    @synopsis = synopsis
    attr_check
    save
  end

  def self.all
    @@all
  end

  def attr_check
    if @release_date.empty?
      @release_date = "To Be Announced"
    end

    if @synopsis.empty?
      @synopsis = "Sorry there is currently no synopsis on this movie. Please check again another time!!"
    end
  end

  def save
    @@all << self
  end

end
