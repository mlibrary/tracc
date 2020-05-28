class TraccUsersController < ApplicationController
include ApplicationHelper

 def index

 if (approve_access)
    @approve_access = true
    @users = User.all 
 else
  flash.now[:notice] = I18n.t('blacklight.no_access')
  @approve_access = false 	
 end	
end

def save
 uname = params["uname"]
 str = "email LIKE '"+uname+"'"
 u = User.where(str)
 u = u.first
 u.destroy!
 #u.reset_password("","")
 #u.save!
end	

end
