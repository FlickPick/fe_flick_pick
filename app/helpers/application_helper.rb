module ApplicationHelper
  def movie_quick_show(movie_id)
    MovieFacade.new
               .movie(movie_id)
  end
end
