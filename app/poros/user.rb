class User
  attr_reader :id, :name, :email, :role, :language_pref, :movie_history

  def initialize(data)
    @id = data[:id]
    @name = data[:name]
    @email = data[:email]
    @role = data[:role]
    @language_pref = data[:language_pref]
    @movie_history = data[:movie_history]
  end
end