class User < ApplicationRecord
  has_secure_password

  validates :email, presence: true, uniqueness: true
  
  before_create :generate_api_key
  
  private
  
  def generate_api_key
    self.api_key = SecureRandom.hex(16)
    # user is being given random api key to access page after creation and login
    # generates a random string of 16 hex characters to secure api key
  end
end