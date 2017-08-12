class Story < ApplicationRecord
  belongs_to :user
  validates :content, length: { maximum: 512 }, presence: true
end
