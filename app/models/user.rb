class User < ApplicationRecord
  has_many :stories
  validates :name, length: { maximum: 32 }, presence: true
  validates :email, length: { maximum: 64 }, presence: true
end
