class CycleReview < ApplicationRecord
	belongs_to :card
    after_save :index_record

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
