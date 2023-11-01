class FlickPickFacade
  def users_create(user_data)
    FlickPickService.new.users_create(user_data)
  end
end