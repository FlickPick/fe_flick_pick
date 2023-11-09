class User
  attr_reader :id, :name, :email, :role

  def initialize(data)
    @id = data[:id]
    @name = data[:name]
    @email = data[:email]
    @role = data[:role]
  end
end