class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  #devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
  devise :omniauthable, omniauth_providers: [:google_oauth2]
end
