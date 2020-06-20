class ChipAssignmentController < ApplicationController
include ApplicationHelper
  protect_from_forgery with: :null_session

  def tactical_resources

  end  

  def tactical_resources2
    if (approve_access)
      cycle= params["cycle"]
      epic=  params["epic"]
      str = "short_name LIKE '" + epic + "%'"   
      @card_one = Card.where(str)
      @approve_access = true
    else
      flash.now[:notice] = I18n.t('blacklight.no_access')
      @approve_access = false  
    end
    
  end

  def resources2

     if (approve_access)
      @approve_access = true
      cycle= params["cycle"]
      epic=  params["epic"]
      str = "short_name LIKE '" + epic + "%'"   
      @card_one = Card.where(str)

      str = "card_id = '" + @card_one.first.id.to_s + "' AND cycle='"+cycle+"'" 
      @tracks = Track.where(str) 
    else
      flash.now[:notice] = I18n.t('blacklight.no_access')
      @approve_access = false  
    end

  end
	def save_resources

     epic=  params["epic"]
     cycle = params["cycle"]
     track = params["track"]
     uniqname1 = params["uniqname1"]
     uniqname2 = params["uniqname2"]
     uniqname3 = params["uniqname3"]
     uniqname4 = params["uniqname4"]

     chips1 = params["num_chips1"]
     chips2 = params["num_chips2"]
     chips3 = params["num_chips3"]
     chips4 = params["num_chips4"]

     month1 = params["month1"]
     month2 = params["month2"]
     month3 = params["month3"]
     month4 = params["month4"]


     str = "short_name LIKE '" + epic + "%'"   
     @card_one = Card.where(str)
   i =1 
   while (i<=4) do
    
     
     if (i==1 && month1.length >2 && uniqname1.length >2)
       a = ChipAssignment.new
       a.uniqname = uniqname1
       a.chips = chips1
       a.month = month1 
       a.trackname = track
       a.cycle = cycle
       a.card_id = @card_one.first.id   
       a.save!
     elsif (i==2 && month2.length >2 && uniqname2.length >2)
       a = ChipAssignment.new
       a.uniqname = uniqname2
       a.chips = chips2
       a.month = month2 
       a.trackname = track
       a.cycle = cycle
       a.card_id = @card_one.first.id   
       a.save!
     elsif (i==3 && month3.length >2 && uniqname3.length >2)
       a = ChipAssignment.new
       a.uniqname = uniqname3
       a.chips = chips3
       a.month = month3 
       a.trackname = track
       a.cycle = cycle
       a.card_id = @card_one.first.id   
       a.save!
     elsif (month4.length >2 && uniqname4.length >2)
       a = ChipAssignment.new
       a.uniqname = uniqname4  
       a.chips = chips4
       a.month = month4 
       a.trackname = track
       a.cycle = cycle
       a.card_id = @card_one.first.id   
       a.save!
     end                
     i = i + 1
   end

  end
    
  def update_resources
     epic=  params["epic"]
     cycle = params["cycle"]
     track = params["track"]

nameofmonths = ['','Jan', 'Feb','March','April','May','June','July','Aug', 'Sep','Oct','Nov','Dec'] 
cur_cycle = Cycle.where("cycle_name LIKE '"+cycle+"'")
s = cur_cycle.first.start.month

months = ['','','','','']
i = 1
while (i<=4) do
  months[i] = nameofmonths[s]
  i = i + 1
  s = s+1 
  if (s>12)
    s= 1
  end
end 

    str = "short_name LIKE '" + epic + "%'"   
    @card_one = Card.where(str)


    str = "card_id = '" + @card_one.first.id.to_s + "' AND cycle= '"+cycle+"'" 
    @chips = ChipAssignment.where(str)
# "epic"=>"LSP", "cycle"=>"FY20:3", "track"=>"Development", "card_id"=>"1", "jrothman"=>"3", "timothy"=>"3", "ndallen"=>"3", "megrust"=>"2", "dfulmer"=>"2", "commit"=>"Save", "controller"=>"cards", "action"=>"update_resources"} permitted: true>
    
     @chips.all.each do |chip| 
      
      flag = true
      found = false
      i = 1
      while (flag)
        byebug
        if ( (chip.month.eql? (months[i])) && (chip.trackname.eql? track))
          flag = false
          found = true
          uniqname_str = chip.uniqname + i.to_s
        end

        if ( (chip.month.eql? (months[i])) && (chip.trackname.eql? nil))
          flag = false
          found = true
          uniqname_str = chip.uniqname + i.to_s
        end

        i = i +1 
        if (i>6) 
          flag = false 
        end  
      end   
      if (found)     
       chip.chips = params[uniqname_str]
       if (chip.chips.nil?)
        chip.chips = 0 
       end
        
       if (chip.chips <=0)
        chip.destroy!
       else
        chip.save!  
       end  
      end  
     end 


  end  
end
