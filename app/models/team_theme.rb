class TeamTheme < ApplicationRecord
  belongs_to :theme
  belongs_to :team
end
