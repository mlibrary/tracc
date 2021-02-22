class DashboardController < ApplicationController
protect_from_forgery with: :null_session  
before_action :authenticate_user!

include ApplicationHelper
	def cycle_board
    cycle = params['cycle']
    type = params['type']

    if (type.nil?)
      type = "All Boards"
    end

    if (cycle.nil?)
      cur_cycle = Cycle.where("current_cycle =1")
      cycle = cur_cycle.first.cycle_name
    end 
      
    if ( (type.eql? 'Strategic') || (type.eql? 'All Boards'))
      @pro_list = Card.where("activity_type LIKE 'Strategic'")
    end
    
    if ( (type.eql? 'Tactical') || (type.eql? 'All Boards') )
      @pro_list1 = Card.where("activity_type LIKE '%Tactical%'")
    end

  end  

  
end
