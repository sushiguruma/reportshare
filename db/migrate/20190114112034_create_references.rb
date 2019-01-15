class CreateReferences < ActiveRecord::Migration[5.0]
  def change
    create_table :references do |t|
      t.references :theme, foreign_key: true

      t.timestamps
    end
  end
end
