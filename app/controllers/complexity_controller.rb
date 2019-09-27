class ComplexityController < ApplicationController

	def edit
		cycle =  params["cycle"]
		@all_cards = Card.where( "in_cycle LIKE ?",cycle) 
		
		#For testing this is useful in cases where there is no value in_cycle field.
		#@all_cards = Card.all 

	end	


	def update

		all_cards = Card.all

        types = ["investigation_scope", "tech_knowledge", "team_scope", "divergence", "infrastructure", "application", "front_end", "data_content", "team_scope", "staff_resources", "divergence", "money", "operational"]

        all_cards.each { |card|
           	types.each { |type| 
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
