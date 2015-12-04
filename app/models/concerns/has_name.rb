module HasName
  extend ActiveSupport::Concern

  def fullname
    "#{first_name} #{last_name}"
  end

end
