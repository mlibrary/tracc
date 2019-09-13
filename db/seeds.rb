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

#FY18:3
Card.create(title:'EPTF Revamp [DO]',short_name:'EPTF',i_or_p:'Investigation',in_cycle:'FY18:3',card_status:'none',start_cycle:'FY18:3')
Card.create(title:'User Experience Assessment: Public-Facing Components of the Special Collections Library’s Aeon Implementation [COL]',short_name:'UX Assessment',i_or_p:'Investigation',in_cycle:'FY18:3',card_status:'none',start_cycle:'FY18:3')
Card.create(title:'Campus Partnership Map [MPUB]',short_name:'Partnership Map',i_or_p:'Investigation',in_cycle:'FY18:3',card_status:'none',start_cycle:'FY18:3')
Card.create(title:'Real-time Readership Activity Map [MPUB]',short_name:'Readership Map',i_or_p:'Investigation',in_cycle:'FY18:3',card_status:'none',start_cycle:'FY18:3')
Card.create(title:'Bibliographic rights algorithm [HT]',short_name:'Bib rights',i_or_p:'Investigation',in_cycle:'FY18:3',card_status:'none',start_cycle:'FY18:3')
Card.create(title:'Review/restructuring of HathiTrust Drupal website environment and tools [HT]',short_name:'HT website',i_or_p:'Investigation',in_cycle:'FY18:3',card_status:'none',start_cycle:'FY18:3')
Card.create(title:'Replace ERRWPC with better preservation and access focused service [X-DIV]',short_name:'ERRWPC',i_or_p:'Project',in_cycle:'FY18:3',card_status:'none',start_cycle:'FY18:3')
Card.create(title:'URI Enrichment in MARC Records [COL]',short_name:'MARC Records',i_or_p:'Project',in_cycle:'FY18:3',card_status:'',start_cycle:'FY18:3')
Card.create(title:'Develop bidirectional workflow between HTRC Workset Builder and HTDL Collection Builder for exporting collections [HT]',short_name:'HT workflow',i_or_p:'Project',in_cycle:'FY18:3',card_status:'none',start_cycle:'FY18:3')
Card.create(title:'Fishrappr++ (Detroit Jewish News) [LIT]',short_name:'Fishrappr',i_or_p:'Project',in_cycle:'FY18:3',card_status:'none',start_cycle:'FY18:3')
Card.create(title:'ArcLight Fall 2017 [LIT]',short_name:'ArcLight',i_or_p:'Project',in_cycle:'FY18:3',card_status:'none',start_cycle:'FY18:3')

#FY18:2 

Card.create(title:'Enterprise Level Workflow/Communication Tool Request [X-DIV]',short_name:'Workflow Tool',i_or_p:'Investigation',in_cycle:'FY18:2',card_status:'none',start_cycle:'FY18:2')
Card.create(title:'LIT preservation principles [LIT]',short_name:'Preservation principles',i_or_p:'Investigation',in_cycle:'FY18:2',card_status:'',start_cycle:'FY18:2')
Card.create(title:'Improving collection of and analysis of usage data (from Google Analytics and log data) [HT]',short_name:'HT Usage Data',i_or_p:'Investigation',in_cycle:'FY18:2',card_status:'none',start_cycle:'FY18:2')
Card.create(title:'Define needs and use cases for collection analysis to support digital collection development, shared print program, and Federal documents program, including selection of analysis tools (Systems advice on tool selection only) [HT]
',short_name:'HT Collection Analysis',i_or_p:'Investigation',in_cycle:'FY18:2',card_status:'none',start_cycle:'FY18:2')
Card.create(title:'Develop plan to open up front matter [HT]',short_name:'HT Front Matter',i_or_p:'Investigation',in_cycle:'FY18:2',card_status:'none',start_cycle:'FY18:2')
Card.create(title:'SALI Improvements [L&T]',short_name:'SALI',i_or_p:'Project',in_cycle:'FY18:2',card_status:'none',start_cycle:'FY18:2')
Card.create(title:'Aeon update to facilitate container IDs [LIT]',short_name:'Aeon',i_or_p:'Project',in_cycle:'FY18:2',card_status:'none',start_cycle:'FY18:2')
Card.create(title:'Middle English Compendium renovation [LIT]',short_name:'MEC',i_or_p:'Project',in_cycle:'FY18:2',card_status:'none',start_cycle:'FY18:2')
Card.create(title:'Update Digitized Audio ingest script [LIT]',short_name:'Audio Ingest',i_or_p:'Project',in_cycle:'FY18:2',card_status:'none',start_cycle:'FY18:2')
Card.create(title:'Digital Collections Audit [LIT]',short_name:'DC Audit',i_or_p:'Project',in_cycle:'FY18:2',card_status:'none',start_cycle:'FY18:2')
Card.create(title:'Michigan Service Hub Development (DPLA) [LIT]',short_name:'DPLA dev',i_or_p:'Project',in_cycle:'FY18:2',card_status:'none',start_cycle:'FY18:2')
Card.create(title:'Deep Blue Data Fall 2017 [LIT]',short_name:'DB Data',i_or_p:'Project',in_cycle:'FY18:2',card_status:'none',start_cycle:'FY18:2')
Card.create(title:'Omeka Improvements, Phase 2 [LIT]',short_name:'Omeka',i_or_p:'Project',in_cycle:'FY18:2',card_status:'none',start_cycle:'FY18:2')
Card.create(title:'Search Beta Phase 5 [LIT]',short_name:'Search',i_or_p:'Project',in_cycle:'FY18:2',card_status:'none',start_cycle:'FY18:2')
Card.create(title:'Favorites Phase 4 [LIT]',short_name:'Favorites',i_or_p:'Project',in_cycle:'FY18:2',card_status:'none',start_cycle:'FY18:2')
Card.create(title:'Library Analytics [LIT]',short_name:'Analytics',i_or_p:'Project',in_cycle:'FY18:2',card_status:'none',start_cycle:'FY18:2')
Card.create(title:'Deep Blue Documents Fall 2017 [LIT]',short_name:'DB Docs',i_or_p:'Project',in_cycle:'FY18:2',card_status:'none',start_cycle:'FY18:2')
Card.create(title:'Building ObjectClass - Phase 4 [LIT]',short_name:'ObjectClass',i_or_p:'Project',in_cycle:'FY18:2',card_status:'',start_cycle:'FY18:2')
Card.create(title:'Improvement of Interfaces for DLXS Bentley TextClass Collections: Phase 2 [LIT]',short_name:'Bentley TextClass',i_or_p:'Project',in_cycle:'FY18:2',card_status:'none',start_cycle:'FY18:2')
Card.create(title:'Develop RFP for outside consultant to conduct broader user experience assessment of HTDL (Consulting on RFP development only) [HT]
',short_name:'HT assessment',i_or_p:'Project',in_cycle:'FY18:2',card_status:'none',start_cycle:'FY18:2')
Card.create(title:'Connect Qualtrics and JIRA via email [RSR]
',short_name:'Qualtrics & Jira',i_or_p:'Project',in_cycle:'FY18:2',card_status:'none',start_cycle:'FY18:2')
Card.create(title:'User interface for access to CoreLogic Data [RSR]
',short_name:'CoreLogic interface',i_or_p:'Project',in_cycle:'FY18:2',card_status:'none',start_cycle:'FY18:2')
Card.create(title:'Review metadata data model across all HT/HTRC data stores [HT]
',short_name:'HT Data model review',i_or_p:'Project',in_cycle:'FY18:2',card_status:'none',start_cycle:'FY18:2')
Card.create(title:'Review metadata data model across all HT/HTRC data stores [HT]
',short_name:'HT Data model review',i_or_p:'Project',in_cycle:'FY18:2',card_status:'none',start_cycle:'FY18:2')




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
#FY19:1
Card.create(title:'Consultation Service Design Scheduling, Knowledgebase and CRM Tool Pilot [X-DIV]',short_name:'Service Design and CRM',i_or_p:'Project',in_cycle:'FY19:1',start_cycle:'FY19:1',card_status:'none')
Card.create(title:'Lexis Nexis Web Services Kit [X-DIV]',short_name:'Lexis Nexis',i_or_p:'Project',in_cycle:'FY19:1',start_cycle:'FY19:1',card_status:'none')
Card.create(title:'Open Michigan',short_name:'Open MI',i_or_p:'Project',in_cycle:'FY19:1',start_cycle:'FY19:1',card_status:'none')
Card.create(title:'Infrastructure Support for “The Impact of the Academic Library on Learning in the University” IMLS Grant [LIT]',short_name:'Impact of the Academic Library',i_or_p:'Project',in_cycle:'FY19:1',start_cycle:'FY19:1',card_status:'none')
Card.create(title:'War of the Worlds Primary Source Materials Online Access [RSR]',short_name:'War of the Worlds',i_or_p:'Investigation',in_cycle:'FY19:1',start_cycle:'FY19:1',card_status:'none')
Card.create(title:'Website Redesign Phase 2: HathiTrust website revamp/redesign',short_name:'HT Website Phase 2',i_or_p:'Project',in_cycle:'FY19:1',start_cycle:'FY19:1',card_status:'none')
Card.create(title:'Create a process and policies for recruiting users for testing of HTDL applications',short_name:'HTDL User Policies',i_or_p:'Project',in_cycle:'FY19:1',start_cycle:'FY19:1',card_status:'none')
Card.create(title:'LIT Space Redesign, Phase 1: North Buhr',short_name:'Space Redesign-1',i_or_p:'Project',in_cycle:'FY19:1',start_cycle:'FY19:1',card_status:'none')
Card.create(title:'LIT Space Redesign, Phase 2: 4th Floor Hatcher North',short_name:'Space Redesign-2',i_or_p:'Project',in_cycle:'FY19:1',start_cycle:'FY19:1',card_status:'none')
Card.create(title:'Deep Blue Data Upgrade To Hyrax 2.0',short_name:'DBD Upgrade',i_or_p:'Project',in_cycle:'FY19:1',start_cycle:'FY19:1',card_status:'none')
Card.create(title:'DSpace to Hyrax data migration',short_name:'DSpace 2 Hyrax',i_or_p:'Project',in_cycle:'FY19:1',start_cycle:'FY19:1',card_status:'none')

#FY20:1
Card.create(title:'Create common libraries to deal with search/advanced search',short_name:'Common Libraries',i_or_p:'Project',in_cycle:'FY20:1',start_cycle:'FY20:1',card_status:'none')
Card.create(title:'Retire Debian 8',short_name:'Retire Debian 8',i_or_p:'Project',in_cycle:'FY20:1',start_cycle:'FY20:1',card_status:'none')
Card.create(title:'Migrate SCRC and Clements Aeon to Atlas hosting',short_name:'Aeon hosting',i_or_p:'Project',in_cycle:'FY20:1',start_cycle:'FY20:1',card_status:'none')
Card.create(title:'Migrate Fulcrum to an isolated hosting environment',short_name:'Fulcrum hosting',i_or_p:'Project',in_cycle:'FY20:1',start_cycle:'FY20:1',card_status:'none')
Card.create(title:'Footprints succession',short_name:'Footprints succession',i_or_p:'Project',in_cycle:'FY20:1',start_cycle:'FY20:1',card_status:'none')
Card.create(title:'Millennium Project websites',short_name:'Millennium websites',i_or_p:'Project',in_cycle:'FY20:1',start_cycle:'',card_status:'none')
Card.create(title:'Non-HLB Expertise',short_name:'Non-HLB expertise',i_or_p:'Project',in_cycle:'FY20:1',start_cycle:'',card_status:'none')
Card.create(title:'Catalog Search Holdings Redesign',short_name:'Catalog Search Holdings',i_or_p:'Project',in_cycle:'FY20:1',start_cycle:'FY20:1',card_status:'none')
#Card.create(title:'',short_name:'Common Libraries',i_or_p:'Project',in_cycle:'FY20:1',start_cycle:'')










