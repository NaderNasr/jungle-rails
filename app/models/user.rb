class User < ActiveRecord::Base
  has_secure_password

  validates :first_name, length: { maximum: 30 }, presence: true
  validates :last_name, length: { maximum: 30 }, presence: true
  validates :email, case_sensitive: false, presence: true
  validates :password, length: { minimum: 3 }, presence: true
  validates :password_confirmation, length: { minimum: 3 }, presence: true

  def self.authenticate_with_credentials email, password
    # '     test@TEST.com ' => 'test@test.com'
    formatedEmail = email.downcase.strip
    # if user == email && password is authenticated
    if User.find_by_email(formatedEmail)&.authenticate(password)
      # sign in with user email
      User.find_by_email(formatedEmail)
    else
      nil
    end
  end
end
