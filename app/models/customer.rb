class Customer < ActiveRecord::Base
  include HasName
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
