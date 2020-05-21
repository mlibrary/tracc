class CardsController < ApplicationController
  include ApplicationHelper
  protect_from_forgery with: :null_session
  before_action :set_card, only: [:show, :edit, :update, :destroy]

  # GET /cards
  # GET /cards.json
  def index
    if (approve_access)
      @cards = Card.all
    else
      flash.now[:notice] = I18n.t('blacklight.no_access')
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

  def tactical_progress
    
  end
  
  def tactical_resources
  end  

  def tactical_resources2
    cycle= params["cycle"]
    epic=  params["epic"]

    str = "short_name LIKE '" + epic + "%'"   
    @card_one = Card.where(str)

    #str = "card_id = '" + @card_one.first.id.to_s + "'" 
    #@tracks = Track.where(str) 
    
  
  end
  def resources2
    cycle= params["cycle"]
    epic=  params["epic"]

    str = "short_name LIKE '" + epic + "%'"   
    @card_one = Card.where(str)

    str = "card_id = '" + @card_one.first.id.to_s + "'" 
    @tracks = Track.where(str) 
    
  
  end

  def edit_tracks
  end
  
  def save_tracks
     @cards = Card.where("activity_type LIKE '%Strategic%'")

     @cards.each do |one_c|
       ntrack = "ntrack" + one_c.id.to_s
       otrack = "otrack" + one_c.id.to_s
       
       @tracks = Track.where("card_id='"+one_c.id.to_s+"'")
       @tracks.each do |one_t| 
         t = "t"+ one_t.id.to_s
         o = "o"+ one_t.id.to_s
         
         t_val = params[t]

         if (!t_val.eql? one_t.track)
          #check chip assignment tracks and edit 
          @assign = ChipAssignment.where("trackname='"+one_t.track+"'")
          @assign.each do |a|
            a.trackname = t_val
            a.save!
          end  
          
         end 
         if (t_val.empty?)
           one_t.destroy!
         else 
           one_t.track = t_val
           one_t.disp_order = params[o]
           one_t.save!
         end  
       end 
       # add new track 
       if (!params[ntrack].empty?)
        t = Track.new
        t.card_id = one_c.id
        t.disp_order = params[otrack]
        t.track = params[ntrack]
        t.epic_title = one_c.short_name
        t.save!
       end  
     end 
  end  

  def save_status
    cycle = params["cycle"]
    p_type = params["p_type"]

    if (p_type.eql? "2")
     str = "activity_type LIKE '%Active%'"
    else
     str = "activity_type LIKE '%Strategic%'"
    end

    cards = Card.where(str).order(:card_type)

    cards.each do |card|
     
       s_id = "s" + card.id.to_s + "_0" 
        r_id  = "r" + card.id.to_s + "_0" 
        c_id =  "c" + card.id.to_s + "_0" 
        
        s = params[s_id]
        r = params[r_id]
        c = params[c_id]

        card.rationale = r 
        card.comments = c
        card.card_status = s 
        card.save!

       
      
       if (p_type.eql? "1") 

        c_id =  "c" + card.id.to_s + "_0" 
        c = params[c_id]
        card.comments = c   
        card.save!
             
        tracks = Track.where("card_id='"+card.id.to_s+"'")
        tracks.each do |t|

        s_id = "s" + card.id.to_s + "_" + t.id.to_s
        r_id  = "r" + card.id.to_s + "_" + t.id.to_s
        
        
        s = params[s_id]
        r = params[r_id]
     
        t.rationale = r  
        t.status = s 
        t.save!
       
        
      end #obj.each
     end # if strategic
    end  #card.each
  end
    
  def edit_consultants
     
  end
  
  def save_consultants
  epic=  params["epic"]
     cycle = params["cycle"]
     track = params["track"]
     uniqname1 = params["uniqname1"]

     str = "short_name LIKE '" + epic + "%'"   
     @card_one = Card.where(str)

     str = "card_id = '" + @card_one.first.id.to_s + "' AND cycle= '"+cycle+"' AND trackname= '"+track +"'" 
     @consult = Consultant.where(str)
     @consult.each do |one|
      uname = "uname" + one.id.to_s
      uname_v = params[uname]
      if (uname_v.length > 2)
        one.uniqname =  uname_v
        one.save!
      else
        one.destroy!  
      end #if
     end #consult.each

     if (uniqname1.length >2)
        n_c = Consultant.new
        n_c.uniqname = uniqname1
        n_c.trackname = track
        n_c.cycle = cycle
        n_c.card_id = @card_one.first.id 
        n_c.save!
     end #if
  end  
  
  def save_resources

     epic=  params["epic"]
     cycle = params["cycle"]
     track = params["track"]
     uniqname1 = params["uniqname1"]
     uniqname2 = params["uniqname2"]
     uniqname3 = params["uniqname3"]
     uniqname4 = params["uniqname4"]

     chips1 = params["num_chips1"]
     chips2 = params["num_chips2"]
     chips3 = params["num_chips3"]
     chips4 = params["num_chips4"]

     month1 = params["month1"]
     month2 = params["month2"]
     month3 = params["month3"]
     month4 = params["month4"]


     str = "short_name LIKE '" + epic + "%'"   
     @card_one = Card.where(str)
   i =1 
   while (i<=4) do
    
     
     if (i==1 && month1.length >2 && uniqname1.length >2)
       a = ChipAssignment.new
       a.uniqname = uniqname1
       a.chips = chips1
       a.month = month1 
       a.trackname = track
       a.cycle = cycle
       a.card_id = @card_one.first.id   
       a.save!
     elsif (i==2 && month2.length >2 && uniqname2.length >2)
       a = ChipAssignment.new
       a.uniqname = uniqname2
       a.chips = chips2
       a.month = month2 
       a.trackname = track
       a.cycle = cycle
       a.card_id = @card_one.first.id   
       a.save!
     elsif (i==3 && month3.length >2 && uniqname3.length >2)
       a = ChipAssignment.new
       a.uniqname = uniqname3
       a.chips = chips3
       a.month = month3 
       a.trackname = track
       a.cycle = cycle
       a.card_id = @card_one.first.id   
       a.save!
     elsif (month4.length >2 && uniqname4.length >2)
       a = ChipAssignment.new
       a.uniqname = uniqname4  
       a.chips = chips4
       a.month = month4 
       a.trackname = track
       a.cycle = cycle
       a.card_id = @card_one.first.id   
       a.save!
     end                
     i = i + 1
   end

  end
    
  def update_resources
     epic=  params["epic"]
     cycle = params["cycle"]
     track = params["track"]

nameofmonths = ['','Jan', 'Feb','March','April','May','June','July','Aug', 'Sep','Oct','Nov','Dec'] 
cur_cycle = Cycle.where("cycle_name LIKE '"+cycle+"'")
s = cur_cycle.first.start.month

months = ['','','','','']
i = 1
while (i<=4) do
  months[i] = nameofmonths[s]
  i = i + 1
  s = s+1 
  if (s>12)
    s= 1
  end
end 

    str = "short_name LIKE '" + epic + "%'"   
    @card_one = Card.where(str)


    str = "card_id = '" + @card_one.first.id.to_s + "' AND cycle= '"+cycle+"'" 
    @chips = ChipAssignment.where(str)
# "epic"=>"LSP", "cycle"=>"FY20:3", "track"=>"Development", "card_id"=>"1", "jrothman"=>"3", "timothy"=>"3", "ndallen"=>"3", "megrust"=>"2", "dfulmer"=>"2", "commit"=>"Save", "controller"=>"cards", "action"=>"update_resources"} permitted: true>
    
     @chips.all.each do |chip| 
      
      flag = true
      found = false
      i = 1
      while (flag)
        if ( (chip.month.eql? (months[i])) && (chip.trackname.eql? track))
          flag = false
          found = true
          uniqname_str = chip.uniqname + i.to_s
        end
        i = i +1 
        if (i>6) 
          flag = false 
        end  
      end   
      if (found)     
       chip.chips = params[uniqname_str]
       if (chip.chips.nil?)
        chip.chips = 0 
       end
        
       if (chip.chips <=0)
        chip.destroy!
       else
        chip.save!  
       end  
      end  
     end 


  end  

  def progress2
    cycle= params["cycle"]
    epic=  params["epic"]

    str = "short_name LIKE '" + epic + "%'"   
    one_card = Card.where(str)
    str = "card_id = '" + one_card.first.id.to_s + "' AND cycle LIKE '"+cycle+"'" 
    @track_epic = Objective.where(str) 
 
    @comment = TrackComment.where(str)
    if (@comment.first == nil)
     TrackComment.create(epic_title: epic,cycle:cycle)
     @comment = TrackComment.where(str)
    end  

  end

  def tactical_progress2
    cycle= params["cycle"]
    epic=  params["epic"]

    str = "short_name LIKE '" + epic + "%'"   
    one_card = Card.where(str)
    str = "card_id = '" + one_card.first.id.to_s + "'" 
    @track_epic = Objective.where(str) 

    #str = "epic_title LIKE '" + epic + "' AND cycle LIKE '"+cycle+"'"  
    str = "card_id='" + one_card.first.id.to_s + "' AND cycle='"+ cycle + "'"
    @comment = TrackComment.where(str)
    if (@comment.first == nil)
     TrackComment.create(epic_title: epic,cycle:cycle)
     @comment = TrackComment.where(str)
    end  

  end

  def save_progress
    
  #"LSP"=>"20", "epic"=>"LSP", "comment1"=>"one", "comment2"=>"one2", "comment3"=>"one3", "comment4"=>"one4", "commit"=>"Save", "controller"=>"cards", "action"=>"save_progress"} permitted: true>
    epic=  params["epic"]
    cycle = params["cycle"]
    
    
    cur_month = Date.current.month
    cur_cycle = Cycle.where("cycle_name LIKE '"+cycle+"'")
    s = cur_cycle.first.start.month
    pmonth = cur_month - cur_cycle.first.start.month + 1

    #str = "epic_title LIKE '" + epic + "'"  
    str = "short_name LIKE '" + epic + "%'"   
    one_card = Card.where(str)
    str = "card_id = '" + one_card.first.id.to_s + "' AND cycle LIKE '"+cycle+"'"  
    @track_epic = Objective.where(str) 
    @comment = TrackComment.where(str)
    one = @comment.first
    
    if (one==nil)
     one = TrackComment.new
     one.card_id = one_card.first.id.to_s
     one.epic_title = one_card.first.short_name  
    end  
    one.comment1 = params["comment1"]
    one.comment2 = params["comment2"]
    one.comment3 = params["comment3"]
    one.comment4 = params["comment4"]
    one.cycle = cycle
    one.save!

    @track_epic.all.each do |t| 
      track = t.objective
      t_id = "t" + pmonth.to_s + t.id.to_s
      t_id1 = "t1" + t.id.to_s
      t_id2 = "t2" + t.id.to_s
      t_id3 = "t3" + t.id.to_s
      t_id4 = "t4" + t.id.to_s
      t.status1 = params[t_id1]
      t.status2 = params[t_id2]
      t.status3 = params[t_id3]
      t.status4 = params[t_id4]
      t.status = params[t_id]
      t.save!
    end   
  end  
    
  def edit_objectives
  end

  def edit_objectives2
    cycle= params["cycle"]
    card=  params["card"]

    str = "short_name LIKE '" + card + "%'"   
    one_card = Card.where(str)
    str = "card_id = '" + one_card.first.id.to_s + "' AND cycle='"+cycle +"'" 
    @obj = Objective.where(str) 
  end

  def save_objectives
    epic=  params["epic"]
    cycle = params["cycle"]
    nobj = params["nobj"]
    #str = "epic_title LIKE '" + epic + "'"  
    str = "short_name LIKE '" + epic + "%'"   
    one_card = Card.where(str)
    str = "card_id = '" + one_card.first.id.to_s + "' AND cycle LIKE '"+cycle+"'"  
    @track_epic = Objective.where(str) 
    

    @track_epic.all.each do |t| 
      obj = 'uobj' + t.id.to_s
      track = params[obj]
    
      if (track.empty?)
        t.destroy!
      else
        t.objective = track
        t.save!  
      end  
      
    end  #for all

    if (nobj.empty?)
    else
      obj_new = Objective.new
      obj_new.card_id = one_card.first.id.to_s
      obj_new.objective = nobj
      obj_new.cycle = cycle
      obj_new.save
    end  

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

def edit_status
  status = Status.all
  status.each do |s|
    s_id = s.id
    nst = 'nst' + s_id.to_s
    s.status = params[nst]
    s.save!
    if (s.status.eql? '')
      s.destroy!
    end  
  end  
  # add new status
  if (!params["status_n"].empty?)
    s = Status.new
    s.status = params["status_n"]
    s.save!
  end   

end  

def edit_rationale
  status = Rationale.all
  status.each do |s|
    s_id = s.id
    nst = 'nst' + s_id.to_s
    s.rationale = params[nst]
    s.save!
    if (s.rationale.eql? '')
      s.destroy!
    end  
  end  
  # add new status
  if (!params["status_n"].empty?)
    s = Rationale.new
    s.rationale = params["status_n"]
    s.save!
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
