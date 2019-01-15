class CreateTeamThemes < ActiveRecord::Migration[5.0]
  def change
    create_table :team_themes do |t|
      t.references :team, foreign_key: true
      t.references :theme, foreign_key: true

      t.timestamps
    end
  end
end
