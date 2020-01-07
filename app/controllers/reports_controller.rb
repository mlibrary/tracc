class ReportsController < ApplicationController
	protect_from_forgery with: :null_session

    def show

    end	
	def generate
# "cycle"=>"All", "status"=>"Any", "activity_type"=>"All", "chart"=>"Requests vs Cycle", "chart_type"=>"Bar",

		
	end	

	def export
		 
      status = params["status"]
	  atype = params["activity_type"]
	  type = params["chart"]
	  cycle = params["cycle"]
      
      str = "card_status LIKE ''"

      if (status != "All")
      	str= str+ " OR card_status='"+status+"'"
      end
      
      if (cycle != "All")
        str = str + " AND in_cycle='"+cycle+"'"
      end
	  @cards = Card.where(str) 

	end	
end
