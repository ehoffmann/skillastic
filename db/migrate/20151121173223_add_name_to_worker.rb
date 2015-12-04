class AddNameToWorker < ActiveRecord::Migration
  def change
    add_column :workers, :first_name, :string
    add_column :workers, :last_name, :string
  end
end
