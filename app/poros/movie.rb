class Movie
  attr_reader :id, :rating, :runtime, :title, :poster_path, :genres, :thumbnail

  def initialize(data)
    unless data == nil
      @id = data[:id]
      @rating = data[:attributes][:rating]
      @rating = check_rating(data[:attributes][:rating])
      @runtime = data[:attributes][:runtime]
      @title = data[:attributes][:title]
      @poster_path = "https://www.themoviedb.org/t/p/w600_and_h900_bestv2/#{data[:attributes][:poster_path]}"
      @thumbnail = "https://image.tmdb.org/t/p/w92/#{data[:attributes][:poster_path]}"
      @genres = genres_name(data)
    else
      @id = "corrupt data"
      @rating = "corrupt data"
      @runtime = "corrupt data"
      @title = "corrupt data"
      @poster_path = "corrupt data"
      @genres = "corrupt data"
    end
  end

  def genres_name(data)
    data[:attributes][:genres].map do |data|
      data[:name]
    end
  end

  def check_rating(data)
    if data
      data
    else
      "Rating not found"
    end
  end
end