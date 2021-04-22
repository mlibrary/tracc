class User < ApplicationRecord

  # Connects this user object to Blacklights Bookmarks.
  include Blacklight::User
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:google_oauth2]       

  # Method added by Blacklight; Blacklight uses #to_s on your
  # user class to get a user-displayable login/identifier for
  # the account.
  def to_s
    email
  end


  
  def self.from_omniauth(auth)
    where(email: auth.info.email).first_or_initialize do |user|
      user.user_name = auth.info.name
      user.email = auth.info.email
      user.password = SecureRandom.hex
    end
  end
end
