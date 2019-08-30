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

#FY19:3
Card.create(title:'Virtual Reading Room',short_name:'Virtual Ref Room',i_or_p:'Investigation',in_cycle:'FY19:3',card_status:'On-Hold',start_cycle:'FY19:3')
Card.create(title:'Brunnhilde VM Front Door Card',short_name:'Brunnhilde',i_or_p:'Project',in_cycle:'FY19:3',card_status:'In-Progress',start_cycle:'FY19:3')
Card.create(title:'Investigating the Viability of the ArchivesSpace Public User Interface',short_name:'ArchivesSpace UI',i_or_p:'Investigation',in_cycle:'FY19:3',card_status:'In-Progress',start_cycle:'FY19:3')
Card.create(title:'Digital Archives Access Options Investigation',short_name:'Archives Access',i_or_p:'Project',in_cycle:'FY19:3',card_status:'In-Progress',start_cycle:'FY19:3')
Card.create(title:'Mapping Disability Inclusion Database',short_name:'Disability DB',i_or_p:'Investigation',in_cycle:'FY19:3',card_status:'On-Hold',start_cycle:'FY19:3')
Card.create(title:'DBUG: Deep Blue Unity MVP',short_name:'DBUG',i_or_p:'Project',in_cycle:'FY19:3',card_status:'In-Progress')
Card.create(title:'Update design for new "clementsead" to new Clements website design',short_name:'Clements EADs',i_or_p:'Project',in_cycle:'FY19:3',card_status:'Done',start_cycle:'FY19:3')
Card.create(title:'Refresh of Research Guides Portal/Home Page',short_name:'Research Guides',i_or_p:'Project',in_cycle:'FY19:3',card_status:'Done',start_cycle:'FY19:3')
Card.create(title:'Position Tracker',short_name:'Position Tracker',i_or_p:'Project',in_cycle:'FY19:3',card_status:'Done',start_cycle:'FY19:3')
Card.create(title:'Buhr Inventory Numbers/Date added to Datamart report',short_name:'Buhr Inventory',i_or_p:'Project',in_cycle:'FY19:3',card_status:'Done',start_cycle:'FY19:3')
Card.create(title:'Deep Blue Data: Collaboration with Indiana University and UI/UX updates',short_name:'DBD Collaboration',i_or_p:'Project',in_cycle:'FY19:3',card_status:'Done',start_cycle:'FY19:3')
Card.create(title:'Workflows for Adjacent Applications',short_name:'Adjacent Apps',i_or_p:'Project',in_cycle:'FY19:3',card_status:'Done',start_cycle:'FY19:3')
Card.create(title:'Move the Civil Rights Litigation Clearinghouse to AWS',short_name:'Clearinghouse Move',i_or_p:'Project',in_cycle:'FY19:3',card_status:'Done',start_cycle:'FY19:3')
# FY19:2
Card.create(title:'Undergraduate Student Library Assignment Calculator/Research Scheduler',short_name:'Research Scheduler',i_or_p:'Investigation',in_cycle:'FY19:2',card_status:'On-Hold',start_cycle:'FY19:2')
Card.create(title:'Canvas LTI Integration, Library PageBuilder',short_name:'Canvas PageBuilder',i_or_p:'Investigation',in_cycle:'FY19:2',card_status:'In-Progress',start_cycle:'FY19:2')
Card.create(title:'Technology to support Bibframe analysis',short_name:'Bibframe Analysis',i_or_p:'Investigation',in_cycle:'FY19:2',card_status:'In-Progress',start_cycle:'FY19:2')
Card.create(title:'Investigate IIIF Solutions Appropriate for Michigan Service Hub (DPLA)',short_name:'IIIF for DPLA',i_or_p:'Investigation',in_cycle:'FY19:2',card_status:'In-Progress',start_cycle:'FY19:2')
Card.create(title:'Exploring better ways to integrate Google Sheets and Trello for LIT CG',short_name:'Trello API',i_or_p:'Investigation',in_cycle:'FY19:2',card_status:'Done',start_cycle:'FY19:2')
Card.create(title:'LIT Documentation Standards',short_name:'LIT Doc Standards',i_or_p:'Investigation',in_cycle:'FY19:2',card_status:'Done',start_cycle:'FY19:2')
Card.create(title:'Upgrade tool to identify rare/unique print copies',short_name:'Rare Print Copies',i_or_p:'Project',in_cycle:'FY19:2',card_status:'In-Progress',start_cycle:'FY19:2')
Card.create(title:'Dark Blue Enhancements',short_name:'Dark Blue',i_or_p:'Project',in_cycle:'FY19:2',card_status:'In-Progress',start_cycle:'FY19:2')
Card.create(title:'An improved UI for Combine (Michigan Service Hub)',short_name:'Combine UI',i_or_p:'Project',in_cycle:'FY19:2',card_status:'On-Hold',start_cycle:'')
Card.create(title:'Set up Combine for the Michigan Service Hub',short_name:'Setup Combine',i_or_p:'Project',in_cycle:'FY19:2',card_status:'Done',start_cycle:'FY19:2')
Card.create(title:'Deep Blue Data: Collaboration with Indiana University',short_name:'Deep Blue Data',i_or_p:'Project',in_cycle:'FY19:2',card_status:'Done',start_cycle:'FY19:2')
Card.create(title:'ArcLight Fall/Winter 2018 [LIT]',short_name:'ArcLight',i_or_p:'Project',in_cycle:'FY19:2',card_status:'In-Progress',start_cycle:'FY19:2')
Card.create(title:'Metadata Aggregation Tools for Michigan Service Hub (DPLA Combine) [LIT]
',short_name:'Aggregation Tool',i_or_p:'Project',in_cycle:'FY19:2',card_status:'In-Progress',start_cycle:'FY19:2')
Card.create(title:'Rebuild HathiTrust SLIP indexing process',short_name:'HT SLIP',i_or_p:'Project',in_cycle:'FY19:2',card_status:'In-Progress',start_cycle:'FY19:2')
Card.create(title:'Tool/Interface for HathiTrust staff to change approved users'' elevated access to in-copyright materials',short_name:'HT SLIP',i_or_p:'Project',in_cycle:'FY19:2',card_status:'In-Progress',start_cycle:'FY19:2')

#Card.create(title:'',short_name:'',i_or_p:'Project',in_cycle:'FY19:1')
#Card.create(title:'',short_name:'',i_or_p:'Investigation',in_cycle:'FY19:1')
Card.create(title:'Consultation Service Design Scheduling, Knowledgebase and CRM Tool Pilot [X-DIV]',short_name:'Service Design and CRM',i_or_p:'Project',in_cycle:'FY19:1',start_cycle:'FY19:1')
Card.create(title:'Lexis Nexis Web Services Kit [X-DIV]',short_name:'Lexis Nexis',i_or_p:'Project',in_cycle:'FY19:1',start_cycle:'FY19:1')
Card.create(title:'Open Michigan',short_name:'Open MI',i_or_p:'Project',in_cycle:'FY19:1',start_cycle:'FY19:1')
Card.create(title:'Infrastructure Support for “The Impact of the Academic Library on Learning in the University” IMLS Grant [LIT]',short_name:'Impact of the Academic Library',i_or_p:'Project',in_cycle:'FY19:1',start_cycle:'FY19:1')
Card.create(title:'War of the Worlds Primary Source Materials Online Access [RSR]',short_name:'War of the Worlds',i_or_p:'Investigation',in_cycle:'FY19:1',start_cycle:'FY19:1')
Card.create(title:'Website Redesign Phase 2: HathiTrust website revamp/redesign',short_name:'HT Website Phase 2',i_or_p:'Project',in_cycle:'FY19:1',start_cycle:'FY19:1')
Card.create(title:'Create a process and policies for recruiting users for testing of HTDL applications',short_name:'HTDL User Policies',i_or_p:'Project',in_cycle:'FY19:1',start_cycle:'FY19:1')
Card.create(title:'LIT Space Redesign, Phase 1: North Buhr',short_name:'Space Redesign-1',i_or_p:'Project',in_cycle:'FY19:1',start_cycle:'FY19:1')
Card.create(title:'LIT Space Redesign, Phase 2: 4th Floor Hatcher North',short_name:'Space Redesign-2',i_or_p:'Project',in_cycle:'FY19:1',start_cycle:'FY19:1')
Card.create(title:'Deep Blue Data Upgrade To Hyrax 2.0',short_name:'DBD Upgrade',i_or_p:'Project',in_cycle:'FY19:1',start_cycle:'FY19:1')
Card.create(title:'DSpace to Hyrax data migration',short_name:'DSpace 2 Hyrax',i_or_p:'Project',in_cycle:'FY19:1',start_cycle:'FY19:1')

Card.create(title:'Create common libraries to deal with search/advanced search',short_name:'Common Libraries',i_or_p:'Project',in_cycle:'FY20:1',start_cycle:'FY20:1')
Card.create(title:'Retire Debian 8',short_name:'Retire Debian 8',i_or_p:'Project',in_cycle:'FY20:1',start_cycle:'FY20:1')
Card.create(title:'Migrate SCRC and Clements Aeon to Atlas hosting',short_name:'Aeon hosting',i_or_p:'Project',in_cycle:'FY20:1',start_cycle:'FY20:1')
Card.create(title:'Migrate Fulcrum to an isolated hosting environment',short_name:'Fulcrum hosting',i_or_p:'Project',in_cycle:'FY20:1',start_cycle:'FY20:1')
Card.create(title:'Footprints succession',short_name:'Footprints succession',i_or_p:'Project',in_cycle:'FY20:1',start_cycle:'FY20:1')
Card.create(title:'Millennium Project websites',short_name:'Millennium websites',i_or_p:'Project',in_cycle:'FY20:1',start_cycle:'')
Card.create(title:'Non-HLB Expertise',short_name:'Non-HLB expertise',i_or_p:'Project',in_cycle:'FY20:1',start_cycle:'')
Card.create(title:'Catalog Search Holdings Redesign',short_name:'Catalog Search Holdings',i_or_p:'Project',in_cycle:'FY20:1',start_cycle:'FY20:1')
#Card.create(title:'',short_name:'Common Libraries',i_or_p:'Project',in_cycle:'FY20:1',start_cycle:'')










