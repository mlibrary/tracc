class NonlitController < ApplicationController

	def save

      if (!params["fname"].empty? && !params["lname"].empty?)
		track = params["track"]
		t = Track.where("track='"+track+"'")
		track_id = t.first.id
		a = Nonlit.new
		a.fname = params["fname"]
		a.lname = params["lname"]
		a.track_id = track_id
		a.card_id = params["card_id"]
		a.cycle = params["cycle"]
		a.save
	  end 
	end	

	def edit

		# params "1"=>"1", "card_id"=>"1", "cycle"=>"FY20:3"
	 nonl = Nonlit.where("card_id='"+params["card_id"]+"' AND cycle='"+params["cycle"]+"'")
       nonl.each do |ext|
       	 
       	 if (params[ext.id.to_s])
       	   ext.destroy!
       	 end	
       end	
	end	
end