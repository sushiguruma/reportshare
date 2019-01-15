class Team < ApplicationRecord
  belongs_to :user
  
  validates :name, presence: true, length: { maximum: 20 }
  validates :content, presence: true, length: { maximum: 50000 }
  
  has_many :relationships
  has_many :members, through: :relationships, source: :user
  has_many :team_themes
  has_many :follow_themes, through: :team_themes, source: :theme
  
end
