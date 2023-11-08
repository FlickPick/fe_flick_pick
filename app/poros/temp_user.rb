class TempUser
  attr_reader :id, :name, :party_id

  def initialize(data)
    @id = data[:id]
    @name = data[:attributes][:name]
    @party_id = data[:attributes][:party_id]
  end
end