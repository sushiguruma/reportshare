class Task < ApplicationRecord
  belongs_to :user
  belongs_to :theme
  
  validates :title, presence: true, length: { maximum: 50 }
  validates :overview, length: { maximum: 500 }
  validates :objective, presence: true, length: { maximum: 50 }
  validates :method, presence: true, length: { maximum: 50000 }
  validates :result, presence: true, length: { maximum: 50000 }
end
