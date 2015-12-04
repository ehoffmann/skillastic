class CreateAbilities < ActiveRecord::Migration
  def change
    create_table :abilities do |t|
      t.integer :level
      t.integer :year_of_xp
      t.belongs_to :worker, index: true
      t.belongs_to :skill, index: true

      t.timestamps null: false
    end
  end
end
