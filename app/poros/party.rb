class Party
  attr_reader :id, :access_code, :max_rating, :max_duration, :genres, :services, :languages, :format, :movie_id

  def initialize(data)
    @id = data[:id]
    @access_code = data[:access_code]
    @max_rating = data[:max_rating]
    @max_duration = data[:max_duration]
    @genres = data[:genres]
    @services = data[:services]
    @languages = data[:languages]
    @format = data[:format]
    @movie_id = data[:movie_id]
  end
end