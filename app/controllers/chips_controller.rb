class ChipsController < ApplicationController
protect_from_forgery with: :null_session	
include ApplicationHelper

	def resources
	end
	
  def staff_chips
  
     if (approve_access)
      @approve_access = true
    else
      flash.now[:notice] = I18n.t('blacklight.no_access')
      @approve_access = false  
    end
  end 

	def save_chips
     
     id = params["id"]
     str = "id='"+id+"'"
     
     if (id.empty?)
	   one_chip = Chip.new      	
     else
       one_chip = Chip.where(str)
       one_chip = one_chip.first
     end  
     
       
	   
     if (!one_chip.nil?) 
       if (params["uniqname"].empty?)
       	one_chip.destroy!
        note = "Chip deleted: " +  one_chip.uniqname
        addlog(5,"Chip",note)
       else
        one_chip.uniqname = params["uniqname"]
        one_chip.fname = params["fname"]
        one_chip.lname= params["lname"]
        one_chip.dept = params["dept"]
        one_chip.project = params["project"]
        one_chip.ops= params["ops"]
        one_chip.save!
        note = "Chip updated: " +  one_chip.uniqname
        addlog(5,"Chip",note)
      end
	end
end 
	
		
end
