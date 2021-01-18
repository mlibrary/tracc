class CycleController < ApplicationController
include ApplicationHelper

	def new
		@cname = Cycle.all
		
	end	

	def save
		cur_cycle = Cycle.where("current_cycle =1") 
		cur_cycle_name = cur_cycle.first.cycle_name
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
	ch = Chip.where("cycle='"+cur_cycle_name+"'")

	ch.each do |ch_one|
		
		ch_cur_cycle = Chip.where("cycle='"+params["cycle"]+"' AND uniqname='"+ch_one.uniqname+"'") 
	  
	  if (ch_cur_cycle.count <=0)
		one_chip = Chip.new  
		one_chip.uniqname = ch_one.uniqname
        one_chip.fname = ch_one.fname
        one_chip.lname= ch_one.lname
        one_chip.dept = ch_one.dept
        one_chip.project = ch_one.project
        one_chip.ops= ch_one.ops
        one_chip.cycle = params["cycle"]
        one_chip.save!
      end 
	end

	end	
		

end
