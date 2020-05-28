class PlogsController < ApplicationController
	include ApplicationHelper

	def index
	  if (approve_access)
        @approve_access = true
        @logs = Plog.all
      else
      	flash.now[:notice] = I18n.t('blacklight.no_access')
        @approve_access = false 
      end	
	end
		
end
