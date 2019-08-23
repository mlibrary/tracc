# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Cycle.create(cycle_name:'FY18:1',start:'July 2017',end:'Oct 2017',current_cycle:0)
Cycle.create(cycle_name:'FY18:2',start:'Nov 2017',end:'Feb 2018',current_cycle:0)
Cycle.create(cycle_name:'FY18:3',start:'Mar 2018',end:'Jun 2018',current_cycle:0)
Cycle.create(cycle_name:'FY19:1',start:'July 2018',end:'Oct 2018',current_cycle:0)
Cycle.create(cycle_name:'FY19:2',start:'Nov 2018',end:'Feb 2019',current_cycle:0)
Cycle.create(cycle_name:'FY19:3',start:'Mar 2019',end:'Jun 2019',current_cycle:0)
Cycle.create(cycle_name:'FY20:1',start:'July 2019',end:'Oct 2019',current_cycle:1)
Cycle.create(cycle_name:'FY20:2',start:'Nov 2019',end:'Feb 2020',current_cycle:0)
Cycle.create(cycle_name:'FY20:3',start:'Mar 2020',end:'Jun 2020',current_cycle:0)
