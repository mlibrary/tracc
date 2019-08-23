class CreateCards < ActiveRecord::Migration[5.2]
  def change
    create_table :cards do |t|

      t.string :request_type
      t.string :i_or_p
      t.string :requester_name
      t.string :requester_fname
      t.string :requester_lname     
      t.string :requester_email
      t.string :requester_div
      t.string :contact_names
      t.string :title
      t.string :short_description
      t.string :prev_work
      t.string :accomplish
      t.string :accomplish_details, array: true
      t.string :benefits
      t.string :benefits_details, array: true
      t.string :goal_alignment
      t.string :at_stake
      t.string :at_stake_details, array: true
      t.string :ext_pressure
      t.string :ext_pressure_details, array: true
      t.string :non_tech
      t.string :non_tech_details, array: true
      t.string :time_constraints
      t.string :time_constraints_details, array: true
      t.string :priority
      t.string :sponsor
      t.string :more_info
      t.string :short_name
      t.string :in_cycle      
      t.string :start_cycle
      t.string :done_cycle  
      t.string :exp_start_month
      t.string :exp_end_month  
      t.string :lib_divisions
      t.string :card_status
      t.string :ext_link
      t.string :lit_lead
      t.string :lit_depts    
      t.string :service_lead
      t.string :other_contacts
      t.string :comments
#strategic sorting
      t.string :domain
      t.string :enthusiasm
      t.string :knowledge
      t.string :resource   
      t.string :comments     
# complexity
      t.string :investigation_scope
      t.string :tech_knowledge
      t.string :team_scope
      t.string :infrastructure
      t.string :iapplication
      t.string :front_end
      t.string :investigation_scope
      t.string :data_content
      t.decimal :total_complexity_score
      t.string :cost 
      t.string :divergence
      t.string :staff_resources
      t.string :money
      t.string :operational
      t.decimal :total_cost_score
      t.decimal :weighted_score
# impact
      t.decimal :benefit_score
      t.decimal :accomplish_score
      t.decimal :at_stake_score
      t.decimal :pressures_score
      t.decimal :change_score
      t.decimal :impact_score
      t.decimal :gut_check

      t.datetime :card_since

      t.datetime :recorded_on ,  default: -> { 'CURRENT_TIMESTAMP' }
      t.timestamps
    end
  end
end
