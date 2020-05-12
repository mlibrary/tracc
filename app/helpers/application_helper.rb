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

end
