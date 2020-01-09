class Card < ActiveRecord::Base
  has_one :complexity
  has_one :impact
  has_one :strategic_sorting
  has_many :cycle_review
  after_save :index_record
  before_destroy :remove_from_index 

  attr_accessor  :lit_dept
 
  def self.to_csv
  
    CSV.generate do |csv|
      csv << column_names
      all.each do |result|
        csv << result.attributes.values_at(*column_names)
      end
    end
  end

  def remove_from_index
  	conn = Blacklight.default_index.connection
    conn.delete_by_id self.id
	conn.commit
  end

  def index_record
  		
	#'accomplish_ssim' => ['9aaaa aaa', '9bbbb bbb'],
    accomplish_array = []
    accomplish_array = accomplish.split("__|__") unless time_constraints.nil?
	benefits_array = []
	benefits_array = benefits.split("__|__") unless time_constraints.nil?
	at_stake_array = []
	at_stake_array = at_stake.split("__|__") unless time_constraints.nil?
	ext_pressure_array = []
	ext_pressure_array = ext_pressure.split("__|__") unless time_constraints.nil?
	non_tech_array = []
	non_tech_array = non_tech.split("__|__") unless time_constraints.nil?
	time_constraints_array = []
	time_constraints_array = time_constraints.split("__|__") unless time_constraints.nil?

	# using gitle_tesim for search becasue according to Bill ti will:
	# The deafult blacklight dynamic fields will interpret that as “string, stored, indexed”, so you’re not 
	# going to get any tokenization, so the only searches that will work will be exact and full string 
	# matches (including, e.g., punctuation and capitalization). 
	# This is the case with title_ssi
	# But with title_tesim you will get tokenization.

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
			'title_tesim' => title,

			'short_description_tsi' => short_description,
			'prev_work_tsi' => prev_work,
			'accomplish_ssim' => accomplish_array,
			'benefits_ssim' => benefits_array,
			'at_stake_ssim' => at_stake_array,
			'ext_pressure_ssim' => ext_pressure_array,
			'non_tech_ssim' => non_tech_array,
			'time_constraints_ssim' => time_constraints_array,

			'goal_alignment_tsim' => goal_alignment,
			'priority_ssi' => priority,
			'sponsor_ssim' => sponsor,
			'more_info_tsm' => more_info,
			'short_name_ssi' => short_name,
			'in_cycle_ssi' => in_cycle,
			'start_cycle_ssi' => start_cycle,
			'done_cycle_ssi' => done_cycle,
			'status_ssi' => card_status,
			'rationale_ssi' => rationale,
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
