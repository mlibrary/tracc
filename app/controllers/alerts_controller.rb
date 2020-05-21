class AlertsController < ApplicationController
  include ApplicationHelper

  def index
      if (approve_access)
      @access_flag = true
    else
      flash.now[:notice] = I18n.t('blacklight.no_access')
    end
  end  

  def show
  end
    
	def save
	  
	 
	 card_id = params["card_id"]

       @alerts = Alert.where("card_id='"+ card_id + "'")
       @alerts.each do |one_a| 
         comments = "a"+one_a.id.to_s
         status = "s"+one_a.id.to_s

         if (params[status].nil?)
         	one_a.status = 0 
         else
         	one_a.status = 1
         end
         
         if (params[comments].blank?)
         	one_a.destroy!
          addlog(6,"AI Deleted",one_a.comments)
    
         else

           one_a.comments = params[comments]
           one_a.save!
           addlog(6,"AI Updated",one_a.comments)
      
         end # save or destroy
         
         	
       end  # for all alerts
       
       comments = params["nItem"]

       if (!comments.empty?)
         t_id = params["track"]
	     owner = params["owner"]
       nstatus = params["nstatus"]

	  	nalert = Alert.new
	  	nalert.card_id = card_id
	  	nalert.track_id = t_id
	  	nalert.comments = comments
	  	nalert.owner = owner
	  	nalert.status = nstatus

	  	nalert.save!
      addlog(6,"New AI Created",one_a.comments)
      
	  	
	  end #if new comment	
	end # save
		
end
