class CycleReviewController < ApplicationController
 protect_from_forgery with: :null_session	
 include ApplicationHelper

  def index
    
  end  

  def edit

  end  

  def add
 

    review_type = params["review_type"]
    cycle = params["cycle"]
    p_type = params["p_type"]

    if (p_type.eql? "2")
     str = "activity_type LIKE '%Active%' AND card_status <> 'Done'"
    else
     str = "activity_type LIKE '%Strategic%'"
    end

    cards = Card.where(str).order(:title)

    cards.each do |card|
     
       s_id = "s" + card.id.to_s + "_0" 
        r_id  = "r" + card.id.to_s + "_0" 
        c_id =  "c" + card.id.to_s + "_0" 
        
        s = params[s_id]
        r = params[r_id]
        c = params[c_id]

        card.rationale = r 
        card.comments = c
        card.card_status = s 
        card.save!

        cr1 = CycleReview.where("card_id=? AND obj_id=? AND review_type=? AND cycle=?",card.id,0,review_type,cycle)
        cr = cr1.first
        
        if (cr ==nil)
          cr = CycleReview.new
        end
        
        cr.card_id = card.id
        cr.status = s
        cr.rationale = r
        cr.notes = c 
        cr.cycle = cycle
        cr.review_type = review_type
        cr.obj_id = 0
        cr.save!
      
       if (p_type.eql? "1") 
            
        tracks = Track.where("card_id='"+card.id.to_s+"' AND cycle='"+cycle+"'")
        tracks.each do |t|

        s_id = "s" + card.id.to_s + "_" + t.id.to_s
        r_id  = "r" + card.id.to_s + "_" + t.id.to_s
        c_id =  "c" + card.id.to_s + "_" + t.id.to_s
        
        s = params[s_id]
        r = params[r_id]
        c = params[c_id]
        

        t.rationale = r 
        #o.comments = c
        t.status = s 
        t.save!
        
        cr1 = CycleReview.where("card_id=? AND obj_id=? AND review_type=? AND cycle=?",card.id,t.id,review_type,cycle)
        cr = cr1.first
        
        if (cr ==nil)
          cr = CycleReview.new
        end
        
        
        cr.card_id = card.id
        cr.status = s
        cr.rationale = r
        cr.notes = c 
        cr.cycle = cycle
        cr.review_type = review_type
        cr.obj_id = t.id
        cr.save!

      end #obj.each
     end # if strategic
    end  #card.each
    
  end
    
  def update
   
   
   #a = params["status_ids"] 
   cycle = params["cycle"]
   r_type = params["review_type"]
   p_type = params["p_type"]
   
   if (p_type.eql? "2")
     str = "activity_type LIKE '%Active%' AND card_status <> 'Done'"
   else
     str = "activity_type LIKE '%Strategic%'"
   end

   #str1 = str + "AND cycle='"+cycle+"'"
   
   #@cards = Card.joins(:cycle_review).where(str1).order(:in_cycle) 
   
   
   #if (@cards.first.nil?) # no cyclereview found
    #str1 = str1 + " AND in_cycle <= '"+cycle+"'"
     @cards = Card.where(str).order(:title)
   #end 
   
  end 

  def import_cycle_review
  
  #filename=\"NewService20-1.csv\"\r\nContent-Type: text/csv\r\n">, "cycle"=>"FY18:1", "review_type"=>"1" (mid cycle)
  uploaded_csv = params[:file]
    csv_text = File.read(uploaded_csv.path)
    csv = CSV.parse(csv_text, :headers => true, :encoding => 'windows-1251:utf-8')
     #csv = CSV.parse(csv_text, :headers => true, :encoding =>'iso-8859-1:utf-8')
  
    csv.each do |row|
       
      row_hash = row.to_hash
      title =  "%"+row_hash["title"]+"%"
      d = Card.where("title LIKE ?", title)   
      d1 = d.first
      
      if (d1 !=nil)
        row_hash.merge!(card_id: d1.id)
        row_hash.merge!(cycle: params[:cycle])
        row_hash.merge!(review_type: params[:review_type])
        row_hash.delete "title"
        row_hash.delete "Short Name"
        row_hash.delete_if { |k, v| v.nil? }
        
        s =  CycleReview.new (row_hash)
        s.save!

        d1.card_status = row_hash["status"]
        d1.rationale = row_hash["rationale"]
        d1.save! 

     else
     	 Rails.logger.debug(row_hash)
     	 
     end
    end

  end

  def export_cycle_review
  end

end
