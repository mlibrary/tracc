class CardsController < ApplicationController
  include ApplicationHelper
  protect_from_forgery with: :null_session
  before_action :set_card, only: [:show, :edit, :update, :destroy]

  # GET /cards
  # GET /cards.json
  def index
    access_level = check_current_access
    if (access_level == 0 || access_level == 1)
      @cards = Card.all
    else
      flash.now[:notice] = "Sorry, you aren't allowed to do that. Try searching!"
    end
  end

  def setup_for_display

    @at_stake_list = Array.new
    @at_stake_list << "It will place the Library at risk"
    @at_stake_list << "It will leave the Library at a competitive disadvantage"
    @at_stake_list << "It will create or perpetuate a gap or a less efficient workaround"
    @at_stake_list << "Other"

    @accomplish_list = Array.new
    @accomplish_list << "Advance Library/campus strategic initiative"
    @accomplish_list << "Improve outward-facing Library services or processes"
    @accomplish_list << "Improve internal operational efficiency"
    @accomplish_list << "Enhance the Library's reputation"
    @accomplish_list << "Other"

    @benefits_list = Array.new
    @benefits_list << "Students"
    @benefits_list << "Faculty & Researchers"
    @benefits_list << "UM Library Staff" 
    @benefits_list << "Stakeholders of other UM campus units"           
    @benefits_list << "External partners"   
    @benefits_list << "Researchers and Students beyond UM"
    @benefits_list << "Other"

    @ext_pressure_list = Array.new
    @ext_pressure_list << "Political"
    @ext_pressure_list << "Reputation & Integrity"
    @ext_pressure_list << "Timeliness"
    @ext_pressure_list << "Financial"    
    @ext_pressure_list << "Legal"
    @ext_pressure_list << "Other"

    @non_tech_list = Array.new
    @non_tech_list << "Service model change"
    @non_tech_list << "New workflows, processes, or other organizational changes"
    @non_tech_list << "Hard to get people on board"
    @non_tech_list << "Need for new training programs and documentation"
    @non_tech_list << "Other"

    @time_constraints_list = Array.new
    @time_constraints_list << "Grant or award"
    @time_constraints_list << "University or department mandate"
    @time_constraints_list << "External collaborations"
    @time_constraints_list << "Compliance"
    @time_constraints_list << "None/Other"
   
    @card_one = Card.find( params[:id] )
    if @card_one.at_stake.nil?
      @card_one.at_stake =""
    end 
    if @card_one.at_stake_details.nil?
      @card_one.at_stake_details =""
    end 

    if @card_one.non_tech.nil?
      @card_one.non_tech =""
    end 
    if @card_one.non_tech_details.nil?
      @card_one.non_tech_details =""
    end 

    if @card_one.accomplish.nil?
      @card_one.accomplish =""
    end 
    if @card_one.accomplish_details.nil?
      @card_one.accomplish_details =""
    end 

    if @card_one.time_constraints.nil?
      @card_one.time_constraints =""
    end 
    if @card_one.time_constraints_details.nil?
      @card_one.time_constraints_details =""
    end 

    if @card_one.ext_pressure.nil?
      @card_one.ext_pressure =""
    end 
    if @card_one.ext_pressure_details.nil?
      @card_one.ext_pressure_details =""
    end  

    if @card_one.benefits.nil?
      @card_one.benefits =""
    end 
    if @card_one.benefits_details.nil?
      @card_one.benefits_details =""
    end  

  end


  # GET /cards/1
  # GET /cards/1.json
  def show
    @card_one = Card.find( params[:id] )
    setup_for_display 
  end

  def import
  end

  def import_card
  end

  def import_impact
  end  
  
  def import_impact_ratings
  
    uploaded_csv = params[:file]
    csv_text = File.read(uploaded_csv.path)
    csv = CSV.parse(csv_text, :headers => true, :encoding => 'windows-1251:utf-8')
    
  
    csv.each do |row|

    row_hash = row.to_hash

    if (row_hash["Investigations"]) != nil
      title = row_hash["Investigations"]
    else 
      title = row_hash["Projects"]
    end

    d = Card.where("title LIKE ?", title)   
    d1 = d.first
      
      if (d1 !=nil)
     
        d1.benefit_score= row_hash["BENEFIT"]
        d1.accomplish_score = row_hash["ACCOMPLISH"]
        d1.at_stake_score = row_hash["AT STAKE"]
        d1.pressures_score = row_hash["PRESSURES"]
        d1.change_score = row_hash["CHANGE"]
        d1.impact_score = row_hash["IMPACT SCORE"]
        d1.gut_check = row_hash["GUT CHECK"]
        d1.impact_notes = row_hash["Notes"]
        

        d1.save!
      end  
    end
  end

  def import_complexity
  end
    
  def import_complexity_ratings
    uploaded_csv = params[:file]
    csv_text = File.read(uploaded_csv.path)
    csv = CSV.parse(csv_text, :headers => true, :encoding => 'windows-1251:utf-8')
    
  
    csv.each do |row|
     
    row_hash = row.to_hash
    

    if (row_hash["Requests: INVESTIGATIONS"]) != nil
      title = row_hash["Requests: INVESTIGATIONS"]
    else 
      title = row_hash["Requests: PROJECTS"]
    end

    d = Card.where("title LIKE ?", title)   
    d1 = d.first
      
      if (d1 !=nil)
     
        d1.infrastructure= row_hash["Infrastructure"]
        d1.application = row_hash["Application"]
        d1.front_end = row_hash["Front End Development / Research / Design"]
        d1.data_content = row_hash["Data & Content"]
        d1.staff_resources = row_hash["Staff Resources"]
        d1.money = row_hash["Money"]
        d1.operational = row_hash["Operational"]
        d1.total_complexity_score = row_hash["Total Complexity Score"]
        d1.weighted_score = row_hash["Weighted Effort Score"]
        d1.short_name = row_hash["Request Short Name"]
        d1.domain = row_hash["Domain"]
        d1.investigation_scope = row_hash["Investigation Scope"]
        d1.tech_knowledge = row_hash["Technical Knowledge/ Expertise"]
        d1.team_scope = row_hash["Team Scope"]
        d1.cost = row_hash["Cost"]
        d1.divergence = row_hash["Potential Divergence from Platform"]
        d1.total_cost_score= row_hash["Total Cost Score"]
        d1.complexity_notes = row_hash["Notes"]
        d1.save!
      end  
    end
  end


  # GET /cards/new
  def new 
    @card = Card.new
  end

  # GET /cards/1/edit
  def edit
    @card_one = Card.find( params[:id] )
    setup_for_display
  end

  # POST /cards
  # POST /cards.json
  def create
    @card = Card.new(card_params)

    respond_to do |format|
      if @card.save
        format.html { redirect_to @card, notice: 'Card was successfully created.' }
        format.json { render :show, status: :created, location: @card }
      else
        format.html { render :new }
        format.json { render json: @card.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cards/1
  # PATCH/PUT /cards/1.json
  def update

    @card = Card.find( params[:id] )

    if params[:card][:at_stake].nil?
      params[:card][:at_stake] =""
    else
        params[:card][:at_stake] = params[:card][:at_stake]*"__|__" 
    end
    params[:card][:at_stake_details] = params[:card][:at_stake_details]*"__|__" unless params[:card][:at_stake_details].nil?

    if params[:card][:accomplish].nil?
      params[:card][:accomplish] =""
    else
        params[:card][:accomplish] = params[:card][:accomplish]*"__|__" 
    end
    params[:card][:accomplish_details] = params[:card][:accomplish_details]*"__|__" unless params[:card][:accomplish_details].nil?

    if params[:card][:non_tech].nil?
      params[:card][:non_tech] =""
    else
        params[:card][:non_tech] = params[:card][:non_tech]*"__|__" 
    end
    params[:card][:non_tech_details] = params[:card][:non_tech_details]*"__|__"  unless params[:card][:non_tech_details].nil?

    if params[:card][:time_constraints].nil?
      params[:card][:time_constraints] =""
    else
        params[:card][:time_constraints] = params[:card][:time_constraints]*"__|__" 
    end
    params[:card][:time_constraints_details] = params[:card][:time_constraints_details]*"__|__" unless params[:card][:time_constraints_details].nil?

    if params[:card][:ext_pressure].nil?
      params[:card][:ext_pressure] =""
    else
        params[:card][:ext_pressure] = params[:card][:ext_pressure]*"__|__" 
    end
    params[:card][:ext_pressure_details] = params[:card][:ext_pressure_details]*"__|__" unless params[:card][:ext_pressure_details].nil?

    if params[:card][:benefits].nil?
      params[:card][:benefits] =""
    else
        params[:card][:benefits] = params[:card][:benefits]*"__|__" 
    end
    params[:card][:benefits_details] = params[:card][:benefits_details]*"__|__" unless params[:card][:benefits_details].nil?

    if (params[:exp_start_month_month].nil? || params[:exp_start_month_year].nil?)
      params[:card][:exp_start_month] = ""
    else
      params[:card][:exp_start_month] = params[:exp_start_month_month] + " " + params[:exp_start_month_year]
    end

    if (params[:exp_end_month_month].nil? || params[:exp_end_month_year].nil?)
      params[:card][:exp_end_month] = ""
    else
      params[:card][:exp_end_month] = params[:exp_end_month_month] + " " + params[:exp_end_month_year]
    end

    respond_to do |format|
      if @card.update(card_params)
        format.html { redirect_to @card, notice: 'Card was successfully updated.' }
        format.json { render :show, status: :ok, location: @card }
      else
        format.html { render :edit }
        format.json { render json: @card.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cards/1
  # DELETE /cards/1.json
  def destroy
    card = Card.find( params[:id] )
    card.destroy
    respond_to do |format|
      format.html { redirect_to cards_url, notice: 'Card was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def import_new_cards #new service cards
    
    uploaded_csv = params[:file]
    csv_text = File.read(uploaded_csv.path)
    csv = CSV.parse(csv_text, :headers => true, :encoding => 'windows-1251:utf-8')
     #csv = CSV.parse(csv_text, :headers => true, :encoding =>'iso-8859-1:utf-8')
  
    csv.each do |row|
    
      row_hash = row.to_hash
      #flag = false

      #if (flag)  
        #if (row_hash["Status"]== "Survey Preview")
        if (row_hash["Status"] ==  "IP Address")
        
        row_hash.delete "StartDate"
        row_hash.delete "EndDate"
        row_hash.delete "Status"
        row_hash.delete "IPAddress"
        row_hash.delete "Progress"
        row_hash.delete "Duration (in seconds)"
        row_hash.delete "Finished"
        row_hash.delete "ResponseId"
        row_hash.delete "RecipientLastName"
        row_hash.delete "RecipientFirstName"
        row_hash.delete "RecipientEmail"
        row_hash.delete "ExternalReference"
        row_hash.delete "LocationLatitude"
        row_hash.delete "LocationLongitude"
        row_hash.delete "DistributionChannel"
        row_hash.delete "UserLanguage"
        
        row_hash[:request_type] = "New Service" 
        row_hash[:title] = row_hash.delete "Q1"
        row_hash[:requester_fname] = row_hash.delete "first name"
        row_hash[:requester_lname] = row_hash.delete "last name"
        if ( (row_hash[:requester_fname] != nil) && (row_hash[:requester_fname] != nil) )
          row_hash[:requester_name] = row_hash[:requester_fname] + " " + row_hash[:requester_lname] 
        end
        row_hash[:requester_email] = row_hash.delete "email"
        row_hash[:requester_div] = row_hash.delete "Q16"
        row_hash[:short_description] = row_hash.delete "Q3"
        row_hash[:prev_work] = row_hash.delete "Q4"

        row_hash["Q5"].gsub!( /\s+/, " " ) unless row_hash["Q5"].nil?   
        row_hash["Q5"].gsub!( /,\w+/, "__|__" ) unless row_hash["Q5"].nil?                
        row_hash[:accomplish] = row_hash.delete "Q5"
        
        details = Array.new
        details[0] = row_hash["Q5_1_TEXT"]
        details[1] = row_hash["Q5_2_TEXT"]
        details[2] = row_hash["Q5_3_TEXT"]
        details[3] = row_hash["Q5_4_TEXT"]
        details[4] = row_hash["Q5_5_TEXT"]
           
        row_hash[:accomplish_details] = details.join('__|__')
        row_hash.delete "Q5_1_TEXT"
        row_hash.delete "Q5_2_TEXT"
        row_hash.delete "Q5_3_TEXT"
        row_hash.delete "Q5_4_TEXT"
        row_hash.delete "Q5_5_TEXT"
        
        row_hash["Q6"].gsub!( /\s+/, " " ) unless row_hash["Q6"].nil?
        row_hash["Q6"].gsub!( /,\w+/, "__|__" ) unless row_hash["Q6"].nil? 
        row_hash[:benefits] = row_hash.delete "Q6"
        #Array.new
        details = []

        details[0] = row_hash["Q6_1_TEXT"]
        details[1] = row_hash["Q6_2_TEXT"]
        details[2] = row_hash["Q6_3_TEXT"]
        details[3] = row_hash["Q6_4_TEXT"]
        details[4] = row_hash["Q6_5_TEXT"]
        details[5] = row_hash["Q6_6_TEXT"]
        details[6] = row_hash["Q6_7_TEXT"]

        row_hash[:benefits_details] = details.join('__|__')
        row_hash.delete "Q6_1_TEXT"
        row_hash.delete "Q6_2_TEXT"
        row_hash.delete "Q6_3_TEXT"
        row_hash.delete "Q6_4_TEXT"
        row_hash.delete "Q6_5_TEXT"
        row_hash.delete "Q6_6_TEXT"
        row_hash.delete "Q6_7_TEXT"
        
        row_hash[:goal_alignment] = row_hash.delete "Q7"

        row_hash["Q8"].gsub!( /\s+/, " " ) unless row_hash["Q8"].nil?
        row_hash["Q8"].gsub!( /,\w+/, "__|__" ) unless row_hash["Q8"].nil?
        row_hash[:at_stake] = row_hash.delete "Q8"
        details = []
        details[0] = row_hash["Q8_1_TEXT"]
        details[1] = row_hash["Q8_2_TEXT"]
        details[2] = row_hash["Q8_3_TEXT"]
        details[3] = row_hash["Q8_4_TEXT"]
        details[4] = details[5] = details[6]= ""
        
        row_hash[:at_stake_details] = details.join('__|__')
        row_hash.delete "Q8_1_TEXT"
        row_hash.delete "Q8_2_TEXT"
        row_hash.delete "Q8_3_TEXT"
        row_hash.delete "Q8_4_TEXT"
       
        row_hash["Q9"].gsub!( /\s+/, " " )  unless row_hash["Q9"].nil? 
        row_hash["Q9"].gsub!( /,\w+/, "__|__" ) unless row_hash["Q9"].nil?    
        row_hash[:ext_pressure] = row_hash.delete "Q9"
        details = []
        details[0] = row_hash["Q9_1_TEXT"]
        details[1] = row_hash["Q9_2_TEXT"]
        details[2] = row_hash["Q9_3_TEXT"]
        details[3] = row_hash["Q9_4_TEXT"]
        details[4] = row_hash["Q9_5_TEXT"]
        details[5] = row_hash["Q9_6_TEXT"]
        details[6]= ""
        
        row_hash[:ext_pressure_details] = details.join('__|__')
        row_hash.delete "Q9_1_TEXT"
        row_hash.delete "Q9_2_TEXT"
        row_hash.delete "Q9_3_TEXT"
        row_hash.delete "Q9_4_TEXT"
        row_hash.delete "Q9_5_TEXT"
        row_hash.delete "Q9_6_TEXT"

        row_hash["Q10"].gsub!( /\s+/, " " ) unless row_hash["Q10"].nil?
        row_hash["Q10"].gsub!( /,\w+/, "__|__" ) unless row_hash["Q10"].nil?
        row_hash[:non_tech] = row_hash.delete "Q10" 
        details = []
        details[0] = row_hash["Q10_1_TEXT"]
        details[1] = row_hash["Q10_2_TEXT"]
        details[2] = row_hash["Q10_3_TEXT"]
        details[3] = row_hash["Q10_4_TEXT"]
        details[4] = row_hash["Q10_5_TEXT"]
        details[5] = ""
       
        
        row_hash[:non_tech_details] = details.join('__|__')
        row_hash.delete "Q10_1_TEXT"
        row_hash.delete "Q10_2_TEXT"
        row_hash.delete "Q10_3_TEXT"
        row_hash.delete "Q10_4_TEXT"
        row_hash.delete "Q10_5_TEXT"
        

        row_hash["Q11"].gsub!( /\s+/, " " ) unless row_hash["Q11"].nil?
        row_hash["Q11"].gsub!( /,\w+/, "__|__" ) unless row_hash["Q11"].nil?
        row_hash[:time_constraints] = row_hash.delete "Q11"
        details = []
        details[0] = row_hash["Q11_1_TEXT"]
        details[1] = row_hash["Q11_2_TEXT"]
        details[2] = row_hash["Q11_3_TEXT"]
        details[3] = row_hash["Q11_4_TEXT"]
        details[4] = row_hash["Q11_5_TEXT"]
        details[5] = ""
       
        
        row_hash[:time_constraints_details] = details.join('__|__')
        row_hash.delete "Q11_1_TEXT"
        row_hash.delete "Q11_2_TEXT"
        row_hash.delete "Q11_3_TEXT"
        row_hash.delete "Q11_4_TEXT"
        row_hash.delete "Q11_5_TEXT"

        row_hash[:more_info] = row_hash.delete "Q14"
        row_hash[:priority] = row_hash.delete "Q12"
        row_hash[:other_contacts] = row_hash.delete "Q13"

        #row_hash[:sponsor] = row_hash.delete "Q23"
        row_hash[:card_since] = row_hash.delete "RecordedDate"
        row_hash.delete_if { |k, v| v.nil? }

        row_hash.merge!(in_cycle: params[:cycle])
        c = Card.new (row_hash)
        c.save!
        id = c.id
      #complexity_hash = Hash["card_id" => id, "status" => "Not Recorded"]
      #Complexity.create!(complexity_hash) 
      #Impact.create!(complexity_hash) 
        #comment_hash = Hash["card_id" => id, "comment_txt" => "New card created", "uemail" => "njaffer@umich.edu"] 
        #Comment.create!(comment_hash)
    end  
  end
end 


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_card
    #  @card = Card.find(params[:id])
    end

    #:request_type, :i_or_p, :requester_name, :requester_email, :requester_div, :contact_names, :title, :short_description, :prev_work, :accomplish, :benefits, :goal_alignment, :at_stake, :ext_pressure, :non_tech, :time_constraints, :priority, :sponsor, :more_info, :short_name, :in_cycle, :start_cycle, :done_cycle, :card_status, :ext_link, :lit_lead, :lit_dept, :service_lead, :other_contacts, :comments,

    # Never trust parameters from the scary internet, only allow the white list through.
    def card_params
      params.require(:card).permit(:request_type, :activity_type, :requester_name, :requester_email, :requester_div, :contact_names, :title, :short_description, :prev_work, :accomplish, :benefits, :goal_alignment, :at_stake, :ext_pressure, :non_tech, :time_constraints, :priority, :sponsor, :more_info, :short_name, :in_cycle, :start_cycle, :done_cycle, :card_status, :ext_link, :lit_lead, :lit_dept, :service_lead, :other_contacts, :comments, :at_stake_details, :accomplish_details, :non_tech_details, :benefits_details, :ext_pressure_details, :time_constraints_details, :exp_start_month, :exp_start_month_month, :exp_start_month_year, :exp_end_month, :exp_end_month_month, :exp_end_month_year, :epic)
    end
    
end
