class User
  attr_reader :id, :name, :email, :role, :movie_history

  def initialize(data)
    @id = data[:id]
    @name = data[:name]
    @email = data[:email]
    @role = data[:role]
    @movie_history = data[:movie_history]
  end
end