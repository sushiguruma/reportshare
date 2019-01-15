class CreateTasks < ActiveRecord::Migration[5.0]
  def change
    create_table :tasks do |t|
      t.string :title
      t.string :objective
      t.string :method
      t.string :result
      t.references :user, foreign_key: true
      t.references :theme, foreign_key: true

      t.timestamps
    end
  end
end
