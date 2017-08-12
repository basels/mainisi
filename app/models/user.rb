require 'json'

class User < ApplicationRecord
  attr_accessor :remember_token
  before_save { email.downcase! } #self.email = email.downcase
  has_many :stories
  validates :name,  length: { maximum: 32 }, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, length: { maximum: 64 }, presence: true,
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  # as_secure_password includes a separate presence validation that specifically catches nil passwords
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true

  # Returns the hash digest of the given string.
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  # Returns a random token.
  def User.new_token
    SecureRandom.urlsafe_base64
  end

  def User.find_google_images(keyword)
    google_api_key = ENV['GOOGLE_API_KEY']
    google_search_cx = ENV['GOOGLE_SEARCH_CX']
    url_h = "https://www.googleapis.com/customsearch/v1?"
    url_q = {searchType: "image", q: keyword, key: google_api_key, cx: google_search_cx, num: "1" }.to_query
    full_url = url_h + url_q
    begin
      json_results = open(full_url) {|f| f.read };
      results = JSON.parse(json_results)
      items = results['items']
      if items.any?
        first_link = items[0]['link']
      else
        first_link = nil
      end
    rescue Exception
      first_link = nil
    end
    first_link
    # in case we want more than 1, need to change num to X
    #items.each do |item|
    #  puts item['link']
    #end
  end

  # Remembers a user in the database for use in persistent sessions.
  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  # Returns true if the given token matches the digest.
  def authenticated?(remember_token)
    return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end

  # Forgets a user.
  def forget
    update_attribute(:remember_digest, nil)
  end
end
