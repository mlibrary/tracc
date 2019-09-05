class CycleReviewController < ApplicationController
 protect_from_forgery with: :null_session	

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
