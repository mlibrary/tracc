class ComplexityController < ApplicationController
	protect_from_forgery with: :null_session

    @@types = ["investigation_scope", "tech_knowledge", "team_scope", "cost", "divergence", 
               "infrastructure", "application", "front_end", "data_content", "staff_resources", 
               "money", "operational", "total_complexity_score", "total_cost_score", "weighted_score"]


	def edit
		cycle =  params["cycle"]
		@all_cards = Card.where( "in_cycle LIKE ?",cycle) 
		

		#For testing this is useful in cases where there is no value in_cycle field.
		#@all_cards = Card.all 

	end	


	def update

		all_cards = Card.all

        all_cards.each { |card|
           	@@types.each { |type| 
	        	param_type = type + "_" + card.id.to_s
    	    	unless params[param_type].nil?
        	  		card.send(type + "=", params[param_type])
        		end
 	       }
 	       card.save
        }

        redirect_to complexity_index_path

	end	
end
