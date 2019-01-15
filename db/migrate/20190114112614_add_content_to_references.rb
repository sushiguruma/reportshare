class AddContentToReferences < ActiveRecord::Migration[5.0]
  def change
    add_column :references, :content, :string
  end
end
