class PermitController < ApplicationController
include ApplicationHelper

 def index

 if (approve_access)
     
    @approve_access = true
   
  @allp = Permit.all
  @all_levels = ["LIT CG", "Strategic Lead","LIT Contact", "Guest"]
  @all_levels_val = ["1", "2","3", "9"]

   temp_chips = Chip.order(:uniqname)
    @chips = ['']
    temp_chips.each do |t|
      @chips << t.uniqname
    end

  # check and remove if there are any other domains email addresses 
  @allp.each do |one_p|
  	flag = one_p.email.index("umich")

  	if (!flag)
  		one_p.destroy!
    end
  end	
  
  else
      flash.now[:notice] = I18n.t('blacklight.no_access')
    @approve_access = false  
    end

 end

 def save
    u = params["uniqname"]
    role = params["role"]
    all_levels = ["LIT CG", "Strategic Lead","LIT Contact", "Guest"]
    all_levels_val = ["1", "2","3", "9"]
    pos = all_levels.find_index(role)
    if (!u.empty?)
     p = Permit.new
     p.email = u+"@umich.edu"
     p.level = all_levels_val[pos]
     p.save!
    end	
 end	
end
