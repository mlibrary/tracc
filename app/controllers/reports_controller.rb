class ReportsController < ApplicationController
	protect_from_forgery with: :null_session

	def generate
# "cycle"=>"All", "status"=>"Any", "activity_type"=>"All", "chart"=>"Requests vs Cycle", "chart_type"=>"Bar",

		byebug
	end	
end
