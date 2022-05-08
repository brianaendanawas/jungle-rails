class User < ActiveRecord::Base

  has_secure_password

  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :password, length: { minimum: 3 }

  def self.authenticate_with_credentials(email, password)
    fixed_email = email.downcase.strip
    user = User.find_by(email: fixed_email)
    if user && user.authenticate(password)
      user
    else
      nil
    end
  end
  
end
