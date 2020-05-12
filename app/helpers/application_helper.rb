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
                       if (parts[1].length == 1)  
                          result = result * 10
                       end 
                       if (result>= 0 && result < 10)
                        fte_rounded = parts[0].to_i 
                       elsif (result> 10 && result < 40)
                        fte_rounded = parts[0].to_i + 0.25 
                       elsif (result>= 40 && result < 50)
                        fte_rounded = parts[0].to_i + 0.50   
                       elsif (result>=50 && result < 65)
                        fte_rounded = parts[0].to_i + 0.50 
                       elsif (result>= 65 && result < 75)
                        fte_rounded = parts[0].to_i + 0.75
                       elsif (result>=75  && result < 85) 
                        fte_rounded = parts[0].to_i + 0.75
                       elsif (result>=85 && result < 90) 
                        fte_rounded = parts[0].to_i + 0.75
                       else
                        fte_rounded = parts[0].to_i + 1
                       end 
                     end 
     return fte_rounded                
                
  end  

end
