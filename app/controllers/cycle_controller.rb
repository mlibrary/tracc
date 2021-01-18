class CycleController < ApplicationController
include ApplicationHelper

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
		# edit cycle name and start date
		str = "cycle_name='" + params["cycle"]+ "'" 
		cycle_all = Cycle.all
		cycle_all.each do |one|
		  cyclename = "name"+one.id.to_s
		  startdt = "s" + one.id.to_s
		  enddt = "e" + one.id.to_s
		  one.cycle_name = params[cyclename]
		  one.start = params[startdt]
		  one.end = params[enddt]
		  one.save!
		end	

		#add new
		if (!params["namen"].empty?)
		  one = Cycle.new
		  one.cycle_name = params["namen"]
		  one.start = params["stn"]
		  one.save!
	    end

	    #save staff chips
	ch = Chip.all
	ch.each do |ch_one|
		if (ch_one.cycle.nil?)
			ch_one.cycle = params["cycle"]
			ch_one.save!
		end	
	end
	end	
		

end
