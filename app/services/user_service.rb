class UserService < BaseService
  def save_user(user)
    user.save
  end

  def update_user(user, params)
    user.update(params)
  end

  def destroy_user(user)
    user.destroy
  end
end