class Worker < ActiveRecord::Base
  include HasName
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :abilities, :dependent => :destroy
  has_many :skills, through: :abilities

  default_scope { order(:id) }



end
