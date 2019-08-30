class Card < ActiveRecord::Base
  has_one :complexity
  has_one :impact
  has_one :strategic_sorting
  has_many :cycle_review
  after_save :index_record
  # before_destroy :remove_from_index 


  attr_accessor  :lit_dept
 

  def index_record
  	
  	conn = Blacklight.default_index.connection
  	doc = { 
			'id' => self.id,
			'request_type_ssi' => request_type,
			'i_or_p_ssi' => i_or_p,
			'requester_name_ssim' => requester_name,
			'requester_email_ssim' => requester_email,
			'requester_div_ssim' => requester_div,
			'contact_names_ssim' => contact_names,
			'title_ssi' => title,
			'short_description_tsi' => short_description,
			'prev_work_tsi' => prev_work,
			'accomplish_tsim' => accomplish,
			'benefits_tsim' => benefits,
			'oal_alignment_tsim' => goal_alignment,
			'at_stake_tsm' => at_stake,
			'ext_pressure_tsm' => ext_pressure,
			'non_tech_tsm' => non_tech,
			'time_constraints_tsm' => time_constraints,
			'priority_ssi' => priority,
			'sponsor_ssim' => sponsor,
			'more_info_tsm' => more_info,
			'short_name_ssi' => short_name,
			'in_cycle_ssi' => in_cycle,
			'start_cycle_ssi' => start_cycle,
			'done_cycle_ssi' => done_cycle,
			'status_ssi' => card_status,
			'ext_link_ssi' => ext_link,
			'lit_lead_ssim' => lit_lead,
			'lit_dept_ssim' => lit_dept,
			'service_lead_ssim' => service_lead,
			'other_contacts_ssim' => other_contacts,
			'comments_tsim' => comments,
			'recorded_on_dtsi' => recorded_on,
			'created_at_dtsi' => created_at,
			'updated_at_dtsi' => updated_at,
			'last_update_comment_dtsi' =>last_update_comment
		}

	  conn.add doc
	  conn.commit
	
    # SolrService.add(self.to_solr)
    # SolrService.commit
  end

  # def remove_from_index
  #   SolrService.delete_by_id(self.id)
  #   SolrService.commit
  # end
end
