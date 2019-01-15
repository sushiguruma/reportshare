class AddOverviewToTasks < ActiveRecord::Migration[5.0]
  def change
    add_column :tasks, :overview, :string
  end
end
