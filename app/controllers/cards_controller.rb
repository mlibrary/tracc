class CardsController < ApplicationController
  protect_from_forgery with: :null_session
  before_action :set_card, only: [:show, :edit, :update, :destroy]

  # GET /cards
  # GET /cards.json
  def index
    @cards = Card.all
  end

  # GET /cards/1
  # GET /cards/1.json
  def show
    @one_card = Card.find( params[:id] )   
  end

  def import
  end

  def import_card
  end

  def import_impact
  end

  def import_complexity
  end


  # GET /cards/new
  def new 
    @card = Card.new
  end

  # GET /cards/1/edit
  def edit
    @card = Card.find( params[:id] )
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
        row_hash[:accomplish] = row_hash.delete "Q5"
        
        details = Array.new
        details[0] = row_hash["Q5_1_TEXT"]
        details[1] = row_hash["Q5_2_TEXT"]
        details[2] = row_hash["Q5_3_TEXT"]
        details[3] = row_hash["Q5_4_TEXT"]
        details[4] = row_hash["Q5_5_TEXT"]
        
        row_hash.merge!(accomplish_details: details)
        row_hash.delete "Q5_1_TEXT"
        row_hash.delete "Q5_2_TEXT"
        row_hash.delete "Q5_3_TEXT"
        row_hash.delete "Q5_4_TEXT"
        row_hash.delete "Q5_5_TEXT"
        
        row_hash[:benefits] = row_hash.delete "Q6"
        #Array.new

        details[0] = row_hash["Q6_1_TEXT"]
        details[1] = row_hash["Q6_2_TEXT"]
        details[2] = row_hash["Q6_3_TEXT"]
        details[3] = row_hash["Q6_4_TEXT"]
        details[4] = row_hash["Q6_5_TEXT"]
        details[5] = row_hash["Q6_6_TEXT"]
        details[6] = row_hash["Q6_7_TEXT"]

        row_hash.merge!(benefits_details: details)
        row_hash.delete "Q6_1_TEXT"
        row_hash.delete "Q6_2_TEXT"
        row_hash.delete "Q6_3_TEXT"
        row_hash.delete "Q6_4_TEXT"
        row_hash.delete "Q6_5_TEXT"
        row_hash.delete "Q6_6_TEXT"
        row_hash.delete "Q6_7_TEXT"
        
        row_hash[:goal_alignment] = row_hash.delete "Q7"

        row_hash[:at_stake] = row_hash.delete "Q8"
        details[0] = row_hash["Q8_1_TEXT"]
        details[1] = row_hash["Q8_2_TEXT"]
        details[2] = row_hash["Q8_3_TEXT"]
        details[3] = row_hash["Q8_4_TEXT"]
        details[4] = details[5] = details[6]= ""
        
        row_hash.merge!(at_stake_details: details)
        row_hash.delete "Q8_1_TEXT"
        row_hash.delete "Q8_2_TEXT"
        row_hash.delete "Q8_3_TEXT"
        row_hash.delete "Q8_4_TEXT"
       
        row_hash[:ext_pressure] = row_hash.delete "Q9"
        details[0] = row_hash["Q9_1_TEXT"]
        details[1] = row_hash["Q9_2_TEXT"]
        details[2] = row_hash["Q9_3_TEXT"]
        details[3] = row_hash["Q9_4_TEXT"]
        details[4] = row_hash["Q9_5_TEXT"]
        details[5] = row_hash["Q9_6_TEXT"]
        details[6]= ""
        
        row_hash.merge!(ext_pressure_details: details)
        row_hash.delete "Q9_1_TEXT"
        row_hash.delete "Q9_2_TEXT"
        row_hash.delete "Q9_3_TEXT"
        row_hash.delete "Q9_4_TEXT"
        row_hash.delete "Q9_5_TEXT"
        row_hash.delete "Q9_6_TEXT"

        row_hash[:non_tech] = row_hash.delete "Q10"
        details[0] = row_hash["Q10_1_TEXT"]
        details[1] = row_hash["Q10_2_TEXT"]
        details[2] = row_hash["Q10_3_TEXT"]
        details[3] = row_hash["Q10_4_TEXT"]
        details[4] = row_hash["Q10_5_TEXT"]
        details[5] = ""
       
        
        row_hash.merge!(non_tech_details: details)
        row_hash.delete "Q10_1_TEXT"
        row_hash.delete "Q10_2_TEXT"
        row_hash.delete "Q10_3_TEXT"
        row_hash.delete "Q10_4_TEXT"
        row_hash.delete "Q10_5_TEXT"
        

        row_hash[:time_constraints] = row_hash.delete "Q11"
        details[0] = row_hash["Q11_1_TEXT"]
        details[1] = row_hash["Q11_2_TEXT"]
        details[2] = row_hash["Q11_3_TEXT"]
        details[3] = row_hash["Q11_4_TEXT"]
        details[4] = row_hash["Q11_5_TEXT"]
        details[5] = ""
       
        
        row_hash.merge!(time_constraints_details: details)
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
      params.require(:card).permit(:request_type, :i_or_p, :requester_name, :requester_email, :requester_div, :contact_names, :title, :short_description, :prev_work, :accomplish, :benefits, :goal_alignment, :at_stake, :ext_pressure, :non_tech, :time_constraints, :priority, :sponsor, :more_info, :short_name, :in_cycle, :start_cycle, :done_cycle, :card_status, :ext_link, :lit_lead, :lit_dept, :service_lead, :other_contacts, :comments, :at_stake_details)
    end

    
end
