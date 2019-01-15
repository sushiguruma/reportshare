class Reference < ApplicationRecord
  belongs_to :theme
  
  validates :content, length: { maximum: 1000 }
end
