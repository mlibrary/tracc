class CycleReviewController < ApplicationController
 protect_from_forgery with: :null_session	

  def index
    
  end  

  def edit

  end  

  def add
 
    review_type = params["review_type"]
    cycle = params["cycle"]

    cards = Card.all
    cards.each do |card|
      id = card.id.to_s

      if ( params["cards"][id]!= nil)
        
        s = params["cards"][id][:card_status]
        r = params["cards"][id][:rationale]
        c = params["cards"][id][:comments]
     
        card.rationale = r 
        card.comments = c
        card.card_status = s 
        card.save!
        
        cr1 = CycleReview.where("card_id=? AND review_type=? AND cycle=?",id,review_type,cycle)
        cr = cr1.first
        
        if (cr ==nil)
          cr = CycleReview.new
        end
        
        cr.card_id = id
        cr.status = s
        cr.rationale = r
        cr.notes = c 
        cr.cycle = cycle
        cr.review_type = review_type
        cr.save!

      end
    end  
    

  end
    
  def update

   a = params["status_ids"] 
   cycle = params["cycle"]

   str = "card_status LIKE ''"
   str1 = "card_status LIKE ''"

   if (a.to_s.include?('1'))
    str = str + " OR cycle_reviews.status LIKE 'New'" 
    str1 = str1 + " OR card_status LIKE 'New'" 
   end 
   if (a.to_s.include?('2'))
    str = str + " OR cycle_reviews.status LIKE 'Done'" 
    str1 = str1 + " OR card_status LIKE 'Done'" 
   end 
   if (a.to_s.include?('3'))
    str = str + " OR cycle_reviews.status LIKE 'Stopped'" 
    str1 = str1 + " OR card_status LIKE 'Stopped'" 
   end 
   if (a.to_s.include?('4'))
    str = str + " OR cycle_reviews.status LIKE 'In-Progress'"
    str1 = str1 + " OR card_status LIKE 'In-Progress'" 
   end 
   if (a.to_s.include?('5'))
    str = str + " OR cycle_reviews.status LIKE 'Not-Started' " 
    str1 = str1 + " OR card_status LIKE 'Not-Started' " 
   end 
   if (a.to_s.include?('6'))
    str = str + " OR cycle_reviews.status LIKE 'Not Picked up'" 
    str1 = str1 + " OR card_status LIKE 'Not Picked up'"     
   end 
   if (a.to_s.include?('7'))
    str = str + " OR cycle_reviews.status LIKE 'Behind Schedule'" 
    str1 = str1 + " OR card_status LIKE 'Behind Schedule'" 
   end 
   if (a.to_s.include?('8'))
    str = str + " OR cycle_reviews.status LIKE 'On-Hold'" 
    str1 = str1 + " OR card_status LIKE 'On-Hold'" 
   end 
   if (a.to_s.include?('9'))
    str = str + " OR cycle_reviews.status LIKE 'Other' " 
    str1 = str1 + " OR card_status LIKE 'Other' " 
   end 

   str = str + "AND cycle='"+cycle+"'"
   
   

   @cards = Card.joins(:cycle_review).where(str).order(:in_cycle) 
   if (@cards.first.nil?)
    str1 = str1 + " AND in_cycle <= '"+cycle+"'"
    @cards = Card.where(str1).order(:in_cycle)
   end 
   
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
