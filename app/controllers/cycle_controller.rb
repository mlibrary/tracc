class CycleController < ApplicationController

	def new
		@cname = Cycle.all
		
	end	

	def save
		cur_cycle = Cycle.where("current_cycle =1") 
		cur_cycle.each do |one|
			one.current_cycle = 0 
			one.save!
		end
	    str = "cycle_name='" + params["cycle"]+ "'" 
		new_cycle = Cycle.where(str)
		new_cycle.each do |one|
			one.current_cycle = 1 
			one.save!
		end
	end	
end
