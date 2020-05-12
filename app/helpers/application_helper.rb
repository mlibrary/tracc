module ApplicationHelper
  def check_current_access
    # access levels - See wiki https://github.com/mlibrary/tracc/wiki/Permissions
    # 0=super user
    # 1=Cycle Planning Coordinator and the team Admin
    # 2=LIT Coordinating Group User
    # 3=LIT Project/Tech Leads Guest
    # 9=view options only

    puts ">>>>> user_signed_in? is #{user_signed_in?}"
    puts ">>>>> current_user is #{current_user}" if user_signed_in?

    return 9 unless user_signed_in?

    str = "email='" + current_user.email + "'"
    perm = Permit.where(str)

    # Handle case of no record
    return 9 if perm.first.nil?

    puts ">>>>> current_user perm.first.level is #{perm.first.level}"

    return perm.first.level

  end


  def roundup(fte)
    fte_rounded = fte.round(2) 
                
                       parts = fte_rounded.to_s.split(".")
                       if (parts.count>1)
                         result = parts[1].to_i
                       if (result> 0 && result < 25)
                        fte_rounded = parts[0].to_i 
                       elsif (result> 25 && result < 50)
                        fte_rounded = parts[0].to_i + 0.25 
                       elsif (result> 50 && result < 75)
                        fte_rounded = parts[0].to_i + 0.5
                       elsif (result> 50 && result < 75) 
                        fte_rounded = parts[0].to_i + 0.75
                       elsif (result> 75 && result < 95) 
                        fte_rounded = parts[0].to_i + 0.75
                        
                       end 
                     end 
     return fte_rounded                
                
  end  

end
