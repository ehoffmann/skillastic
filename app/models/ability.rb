# a comment
class Ability < ActiveRecord::Base
  belongs_to :worker
  belongs_to :skill

  validates_uniqueness_of :skill_id, scope: :worker_id
end
