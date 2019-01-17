class AddFigureToTasks < ActiveRecord::Migration[5.0]
  def change
    add_column :tasks, :figure, :string
  end
end
