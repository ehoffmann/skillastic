class Skill < ActiveRecord::Base
  has_many :abilities, :dependent => :destroy
  has_many :workers, through: :abilities

  default_scope { order(:name) }

  def to_s
    name
  end

end
