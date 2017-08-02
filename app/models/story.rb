class Story < ApplicationRecord
  belongs_to :user
  validates :content, length: { maximum: 128 }, presence: true
end
