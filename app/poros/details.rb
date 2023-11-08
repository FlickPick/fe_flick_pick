class Details
  attr_reader :id, :movie_title, :movie_poster, :cast, :trailer

  def initialize(data)
    @id = data&.[](:party)&.[](:data)&.[](:id)


    @movie_title = data&.[](:movie)&.[](:original_title)
    @movie_poster = "https://www.themoviedb.org/t/p/w600_and_h900_bestv2#{data&.[](:movie)&.[](:poster_path)}"

    @cast = data&.[](:cast)

    @trailer = "https://www.youtube.com/watch?v=#{data&.[](:trailer)&.[](:trailer)}"
  end
end