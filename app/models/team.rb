class Team < ApplicationRecord
  belongs_to :user
  
  validates :name, presence: true, length: { maximum: 20 }
  validates :content, presence: true, length: { maximum: 50000 }
end
