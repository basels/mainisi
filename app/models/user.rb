class User < ApplicationRecord
  before_save { email.downcase! } #self.email = email.downcase

  has_many :stories

  validates :name,  length: { maximum: 32 }, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, length: { maximum: 64 }, presence: true,
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
end
