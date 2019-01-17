class AddReferenceToThemes < ActiveRecord::Migration[5.0]
  def change
    add_column :themes, :reference, :string
  end
end
