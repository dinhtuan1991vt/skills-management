class UserService < BaseService
  # Save user
  def save_user(user)
    user.save
  end

  # Update user
  def update_user(user, params)
    user.update(params)
  end

  # Delete user
  def destroy_user(user)
    user.destroy
  end

  # Check is id?
  def is_id?(id)
    id.to_s == id.to_i.to_s
  end
end