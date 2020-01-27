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
         
    case type
    when "Requests"
      if (status != "All")
        str += " OR card_status='"+status+"'"
         @cards = Card.where(str).order(:card_status, :in_cycle)
      else 
        str += "OR card_status LIKE '%'"   
         @cards = Card.where(str).order(:in_cycle)
      end
      
      if (cycle != "All")
        str += " AND in_cycle='"+cycle+"'"
         @cards = Card.where(str).order(:card_status)
      end
      
     

    when "Complexity"
    when "Impact"
    when "Mid-Cycle Review"
    when "End-Cycle Review"
    when "Cycle Review"
      if (status != "All")
        str += " OR card_status='"+status+"'"
      else 
        str += "OR card_status LIKE '%'"   
      end
      
      if (cycle != "All")
        str += " AND in_cycle='"+cycle+"'"
      end
      
      @cards = Card.where(str).order(:card_status) 
      
   end 
	end	

	def export
		 
    status = params["status"]
	  atype = params["activity_type"]
	  type = params["chart"]
	  cycle = params["cycle"]
      
    str = "card_status LIKE ''"

    if (status != "All")
    	str += " OR card_status='"+status+"'"
    else 
      str += "OR card_status LIKE '%'"  
    end
    
    if (cycle != "All")
      str += " AND in_cycle='"+cycle+"'"  
    end

    
	  @cards = Card.where(str) 

   respond_to do |format|
    format.html
    format.csv { send_data @cards.to_csv }
  end
 end

end
