class Theme < ApplicationRecord
  belongs_to :user
  
  validates :name, presence: true, length: { maximum: 100 }
  validates :introduction, presence: true, length: { maximum: 50000 }
  validates :objective, presence: true, length: { maximum: 50000 }
  
  has_many :team_themes
  has_many :followed_teams, through: :team_themes, source: :team
  
  def make_relation(team)
    self.team_themes.find_or_create_by(team_id: team.id)
  end
  
  def breaK_relation(team)
    team_theme = self.team_themes.find_by(team_id: team.id)
    team_theme.destroy if team_theme
  end
  
  def relate?(team)
    self.followed_teams.include?(team)
  end
  
  has_many :tasks
  has_many :references
end
