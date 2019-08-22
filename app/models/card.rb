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
			'card_request_type_ssi' => request_type,
			'card_i_or_p_ssi' => i_or_p,
			'card_requester_name_ssim' => requester_name,
			'card_requester_email_ssim' => requester_email,
			'card_requester_div_ssim' => requester_div,
			'card_contact_names_ssim' => contact_names,
			'card_titlel_tsim' => title,
			'card_short_description_ssi' => short_description,
			'card_prev_work_tsim' => prev_work,
			'card_accomplish_tsim' => accomplish,
			'card_benefits_tsim' => benefits,
			'card_goal_alignment_tsim' => goal_alignment,
			'card_at_stake_tsm' => at_stake,
			'card_ext_pressure_tsm' => ext_pressure,
			'card_non_tech_tsm' => non_tech,
			'card_time_constraints_tsm' => time_constraints,
			'card_priority_ssi' => priority,
			'card_sponsor_ssim' => sponsor,
			'card_more_info_tsm' => more_info,
			'card_short_name_ssi' => short_name,
			'card_start_cycle_ssi' => start_cycle,
			'card_done_cycle_ssi' => done_cycle,
			'card_card_status_tsi' => card_status,
			'card_ext_link_tsm' => ext_link,
			'card_lit_lead_tsim' => lit_lead,
			'card_lit_dept_tsim' => lit_dept,
			'card_service_lead_tsim' => service_lead,
			'card_other_contacts_tsm' => other_contacts,
			'card_comments_tsim' => comments,
			'card_recorded_on_dtsi' => recorded_on,
			'card_created_at_dtsi' => created_at,
			'card_updated_at_dtsi' => updated_at
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
