class CycleReviewController < ApplicationController
 protect_from_forgery with: :null_session	

  def index
    
  end  

  def edit

  end  

  def add
 
    cards = Card.all
    cards.each do |card|
      id = card.id.to_s

      if ( params["cards"][id]!= nil)
        r = params["cards"][id][:rationale]
        c = params["cards"][id][:comments]
     
        card.rationale = r 
        card.comments = c
        card.save!
      end
    end  
    

  end
    
  def update

   a = params["status_ids"] 
   str = "card_status LIKE ''"

   if (a.to_s.include?('1'))
    str = str + " OR card_status LIKE 'In-Progress'" 
   end 
   if (a.to_s.include?('2'))
    str = str + " OR card_status LIKE 'Done'" 
   end 
   if (a.to_s.include?('3'))
    str = str + " OR card_status LIKE 'Stopped'" 
   end 
   if (a.to_s.include?('4'))
    str = str + " OR card_status LIKE 'Not Started'" 
   end 
   if (a.to_s.include?('5'))
    str = str + " OR card_status LIKE 'Not Picked up' " 
   end 
   if (a.to_s.include?('6'))
    str = str + " OR card_status LIKE 'Behind Schedule'" 
   end 
   if (a.to_s.include?('7'))
    str = str + " OR card_status LIKE 'On-Hold'" 
   end 
   if (a.to_s.include?('8'))
    str = str + " OR card_status LIKE 'Other'" 
   end 

   @cards = Card.where(str) 
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
