class ReportsController < ApplicationController
	protect_from_forgery with: :null_session

    def show

    end	
	def generate
# "cycle"=>"All", "status"=>"Any", "activity_type"=>"All", "chart"=>"Requests vs Cycle", "chart_type"=>"Bar",
      status = params["status"]
	  atype = params["activity_type"]
	  type = params["chart"]
	  cycle = params["cycle"]
      
      str = "card_status LIKE ''"

      if (status != "All")
      	str= str+ " OR card_status='"+status+"'"
      else 
        str = str + "OR card_status LIKE '%'"   
      end
      
      if (cycle != "All")
        str = str + " AND in_cycle='"+cycle+"'"
      end
	  @cards = Card.where(str) 
		
		
	end	

	def export
		 
      status = params["status"]
	  atype = params["activity_type"]
	  type = params["chart"]
	  cycle = params["cycle"]
      
      str = "card_status LIKE ''"

      if (status != "All")
      	str= str+ " OR card_status='"+status+"'"
      else 
        str = str + "OR card_status LIKE '%'"  
      end
      
      if (cycle != "All")
        str = str + " AND in_cycle='"+cycle+"'"  
      end

    
	  @cards = Card.where(str) 

   respond_to do |format|
    format.html
    format.csv { send_data @cards.to_csv }
  end
 end

 

	
end
