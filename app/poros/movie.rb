class Movie
  attr_reader :id, :rating, :runtime, :title, :poster_path, :genres

  def initialize(data)
    @id = data[:id]
    @rating = data[:attributes][:rating]
    @runtime = data[:attributes][:runtime]
    @title = data[:attributes][:title]
    @poster_path = data[:attributes][:poster_path]
    @genres = genres_name(data)
  end

  def genres_name(data)
    data[:attributes][:genres].map do |data|
      data[:name]
    end
  end
end