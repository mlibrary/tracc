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

Card.create(title:'Virtual Reading Room',short_name:'Virtual Ref Room',i_or_p:'Investigation',in_cycle:'FY19:3',card_status:'On-Hold')
Card.create(title:'Brunnhilde VM Front Door Card',short_name:'Brunnhilde',i_or_p:'Project',in_cycle:'FY19:3',card_status:'In-Progress')
Card.create(title:'Investigating the Viability of the ArchivesSpace Public User Interface',short_name:'ArchivesSpace UI',i_or_p:'Investigation',in_cycle:'FY19:3',card_status:'In-Progress')
Card.create(title:'Digital Archives Access Options Investigation',short_name:'Archives Access',i_or_p:'Project',in_cycle:'FY19:3',card_status:'In-Progress')
Card.create(title:'Mapping Disability Inclusion Database',short_name:'Disability DB',i_or_p:'Investigation',in_cycle:'FY19:3',card_status:'On-Hold')
Card.create(title:'DBUG: Deep Blue Unity MVP',short_name:'DBUG',i_or_p:'Project',in_cycle:'FY19:3',card_status:'In-Progress')
Card.create(title:'Update design for new "clementsead" to new Clements website design',short_name:'Clements EADs',i_or_p:'Project',in_cycle:'FY19:3',card_status:'Done')
Card.create(title:'Refresh of Research Guides Portal/Home Page',short_name:'Research Guides',i_or_p:'Project',in_cycle:'FY19:3',card_status:'Done')
Card.create(title:'Position Tracker',short_name:'Position Tracker',i_or_p:'Project',in_cycle:'FY19:3',card_status:'Done')
Card.create(title:'Buhr Inventory Numbers/Date added to Datamart report',short_name:'Buhr Inventory',i_or_p:'Project',in_cycle:'FY19:3',card_status:'Done')
Card.create(title:'Deep Blue Data: Collaboration with Indiana University and UI/UX updates',short_name:'DBD Collaboration',i_or_p:'Project',in_cycle:'FY19:3',card_status:'Done')
Card.create(title:'Workflows for Adjacent Applications',short_name:'Adjacent Apps',i_or_p:'Project',in_cycle:'FY19:3',card_status:'Done')
Card.create(title:'Move the Civil Rights Litigation Clearinghouse to AWS',short_name:'Clearinghouse Move',i_or_p:'Project',in_cycle:'FY19:3',card_status:'Done')


#Card.create(title:'',short_name:'',i_or_p:'',in_cycle:'')
#Card.create(title:'',short_name:'',i_or_p:'',in_cycle:'')
#Card.create(title:'',short_name:'',i_or_p:'',in_cycle:'')
#Card.create(title:'',short_name:'',i_or_p:'',in_cycle:'')
#Card.create(title:'',short_name:'',i_or_p:'',in_cycle:'')
#Card.create(title:'',short_name:'',i_or_p:'',in_cycle:'')









