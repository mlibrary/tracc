class CreateCards < ActiveRecord::Migration[5.2]
  def change
    create_table :cards do |t|

      t.string :request_type
      t.string :i_or_p
      t.string :requester_name
      t.string :requester_email
      t.string :requester_div
      t.string :contact_names
      t.string :title
      t.string :short_description
      t.string :prev_work
      t.string :accomplish
      t.string :benefits
      t.string :goal_alignment
      t.string :at_stake
      t.string :ext_pressure
      t.string :non_tech
      t.string :time_constraints
      t.string :priority
      t.string :sponsor
      t.string :more_info
      t.string :short_name
      t.string :start_cycle
      t.string :done_cycle  
      t.string :card_status
      t.string :ext_link
      t.string :lit_lead
      t.string :lit_dept    
      t.string :service_lead
      t.string :other_contacts
      t.string :comments
      
      
      #t.datetime :card_since

      t.datetime :recorded_on ,  default: -> { 'CURRENT_TIMESTAMP' }
      t.timestamps
    end
  end
end
