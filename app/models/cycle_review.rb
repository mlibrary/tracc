class CycleReview < ApplicationRecord
	belongs_to :card
    #after_save :index_record
    
  def self.to_csv
  
    CSV.generate do |csv|
      csv << column_names
      all.each do |result|
        csv << result.attributes.values_at(*column_names)
      end
    end
  end
  def index_record
	# conn = Blacklight.default_index.connection
 #  	doc = { 
	# 		'id' => self.id,
	# 		 'status_ssi'=> status,
 #             'rationale_ssi'=> rationale,
 #             'review_cycle_ssi' =>cycle,
 #             'review_notes_ssi' =>notes, 
 #             'review_type' =>review_type 
			
	# 	}
	# conn.add doc
	# conn.commit
  end
  
end
