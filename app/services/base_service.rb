class BaseService
  # constructor
  def initialize
  end

  # Check is id?
  def is_id?(id)
    id.to_s == id.to_i.to_s
  end

end