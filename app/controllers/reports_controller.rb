class ReportsController < ApplicationController
  protect_from_forgery with: :null_session
  before_action :authenticate_user!
  
  include ApplicationHelper

    
  def show
  end 

  def chip_assignment 
     @ch = Chip.order(:dept)

  end  

  def objectives
    
  end  
  def generate
# "cycle"=>"All", "status"=>"Any", "activity_type"=>"All", "chart"=>"Requests vs Cycle", "chart_type"=>"Bar",
    status = params["status"]
    atype = params["activity_type"]
    itype = params["i_type"]
    type = params["chart"]
    cycle_from = params["cycle_from"]
    cycle_to = params["cycle_to"]

    str = "card_status LIKE ''"

    # Switch values if cycle_from is later than cycle_to
    if cycle_from > cycle_to
      temp = cycle_to
      cycle_to = cycle_from
      cycle_from = temp
    end

    cycle_str = " AND in_cycle>='"+cycle_from+"' "  
    cycle_str += " AND in_cycle<='"+cycle_to+"' "

    if (atype == "All")
      activity_str = ' '
    else
      activity_str = " AND activity_type LIKE'"+atype+"' "
    end

    if (itype == "All")
      #activity_str = ' '
    else
      activity_str = activity_str + " AND card_type LIKE'"+itype+"' "
    end

         
    case type
    when "Requests"
      if (status != "All")
        str += " OR card_status LIKE '"+status+"' "
        str += cycle_str + activity_str
        puts "filtering string is #{str}"
         @cards = Card.where(str).order(:card_status, :in_cycle)
      else 
        str += "OR card_status LIKE '%' "
        str += cycle_str + activity_str
        puts "filtering string is #{str}"
         @cards = Card.where(str).order(:in_cycle)
      end    
     
    when "Complexity"
    when "Impact"
    when "Mid-Cycle Review"
      str = "review_type=1 AND cycle >= '"+params['cycle_from']+"' AND cycle <='"+params['cycle_to']+"'"
      @cards = CycleReview.where(str).order(:status) 
      
      #Card.joins(:cycle_review).where(str)

    when "End-Cycle Review"
        str = "review_type=2 AND cycle >= '"+params['cycle_from']+"' AND cycle <='"+params['cycle_to']+"'"
      @cards = CycleReview.where(str).order(:status) 
     
    when "Cycle Review"
      if (status != "All")
        str += " OR card_status='"+status+"'"
      else 
        str += "OR card_status LIKE '%'"   
      end
      
      str += cycle_str + activity_str

      
      @cards = Card.where(str).order(:card_status) 
      
   end 
   
  end 

  def export
     
   
    type = params["type"]
      
    if (type.eql? 'Projects')
      @result = Card.all
    elsif (type.eql? "Staff Chips")
      @result = Chip.all
    elsif (type.eql? "Assignments")
      @result = ChipAssignment.all
    elsif (type.eql? "Objectives")
      @result = Objective.all
    elsif (type.eql? "Cycle Review")
      @result = CycleReview.all
    elsif (type.eql? "Project Tracks")  
      @result = Track.all
    elsif (type.eql? "Comments")    
      @result = TrackComment.all      
    end

    respond_to do |format|
      format.html
      format.csv { send_data @result.to_csv }
    end
  end

  

end
