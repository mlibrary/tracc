class DashboardController < ApplicationController
protect_from_forgery with: :null_session  
	def cycle_board
    cycle = params['cycle']
    type = params['type']


    if ( (type.eql? 'Strategic') || (type.eql? 'All Boards'))
      @pro_list = Card.where("activity_type LIKE 'Strategic'")
    end
    
    if ( (type.eql? 'Tactical') || (type.eql? 'All Boards') )
      @pro_list1 = Card.where("activity_type LIKE '%Active%'")
    end

  end  
end
