module ApplicationHelper
	def check_current_access
		# access levels
		# 0=view only; 1=view plus search; 2=view, search, modify cards; 3= super user/dev

		puts ">>>>> user_signed_in? is #{user_signed_in?}"
	  puts ">>>>> current_user is #{current_user}" if user_signed_in?

	  return 0 unless user_signed_in?

	  case current_user.email
	  when 'gordonl@lit.edu', 'gordonl@umich.edu', 'njaffer@umich.edu'
	  	return 3
	  else
	  	return 0
	  end

	end

end
