module DashboardHelper
	def get_months
        
nameofmonths = ['','January', 'February','March','April','May','June','July','August', 'September','October','November','December']

cur_cycle = Cycle.where("current_cycle =1")
cycle = cur_cycle.first.cycle_name
s = cur_cycle.first.start.month
stmonth = ""
endmonth = ""


if (s != nil)
  stmonth = nameofmonths[s]
  if s<=8
    s = s +3
  else
    s = s+3 -12 
  end  
  endmonth = nameofmonths[s]
end 

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
		return months
	end	
end
