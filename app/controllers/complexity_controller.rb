class ComplexityController < ApplicationController

	def update
		
		cycle =  params["cycle"]
		@all_cards = Card.where( "in_cycle LIKE ?",cycle) 
	end	
end
