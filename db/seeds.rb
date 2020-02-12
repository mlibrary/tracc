# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.create(name:'Nabeela Jaffer',email:'njaffer@umich.edu',password: 'topsecret')
User.create(name:'Gordon Leacock',email:'gordonl@umich.edu',password: '123456')
User.create(name:'Gordon Leacock',email:'gordonl@lit.edu',password: '123456')
User.create(name:'View Only User',email:'view@umich.edu',password: '123456')


Permit.create(email:'njaffer@umich.edu', level: 0)
Permit.create(email:'gordonl@umich.edu', level: 0)
Permit.create(email:'gordonl@lit.edu', level: 0)
Permit.create(email:'view@umich.edu', level: 9)


Status.create(status:'New') ;
Status.create(status:'Done') ;
Status.create(status:'Stopped') ;
Status.create(status:'In-Progress') ;
Status.create(status:'Not-Started') ;
Status.create(status:'Not Pickedup') ;
Status.create(status:'Behind Schedule') ;
Status.create(status:'On-Hold') ;
Status.create(status:'Other') ;


Rationale.create(rationale: 'As-Expected') ;
Rationale.create(rationale: 'Waiting on SH') ;
Rationale.create(rationale: 'SH not Engaged') ;
Rationale.create(rationale: 'Lack of Resources') ;
Rationale.create(rationale: 'Scope Altered') ;
Rationale.create(rationale: 'Other') ;

Cycle.create(cycle_name:'FY18:1',start:'July 2017',end:'Oct 2017',current_cycle:0)
Cycle.create(cycle_name:'FY18:2',start:'Nov 2017',end:'Feb 2018',current_cycle:0)
Cycle.create(cycle_name:'FY18:3',start:'Mar 2018',end:'Jun 2018',current_cycle:0)
Cycle.create(cycle_name:'FY19:1',start:'July 2018',end:'Oct 2018',current_cycle:0)
Cycle.create(cycle_name:'FY19:2',start:'Nov 2018',end:'Feb 2019',current_cycle:0)
Cycle.create(cycle_name:'FY19:3',start:'Mar 2019',end:'Jun 2019',current_cycle:0)
Cycle.create(cycle_name:'FY20:1',start:'July 2019',end:'Oct 2019',current_cycle:0)
Cycle.create(cycle_name:'FY20:2',start:'Nov 2019',end:'Feb 2020',current_cycle:1)
Cycle.create(cycle_name:'FY20:3',start:'Mar 2020',end:'Jun 2020',current_cycle:0)
Cycle.create(cycle_name:'FY21:1',start:'July 2020',end:'Oct 2020',current_cycle:1)
Cycle.create(cycle_name:'FY21:2',start:'Nov 2020',end:'Feb 2021',current_cycle:0)
Cycle.create(cycle_name:'FY21:3',start:'Mar 2021',end:'Jun 2021',current_cycle:0)
Cycle.create(cycle_name:'FY22:1',start:'July 2021',end:'Oct 2021',current_cycle:1)
Cycle.create(cycle_name:'FY22:2',start:'Nov 2021',end:'Feb 2022',current_cycle:0)
Cycle.create(cycle_name:'FY22:3',start:'Mar 2022',end:'Jun 2022',current_cycle:0)

#FY18:3
Card.create(title:'EPTF Revamp [DO]',short_name:'EPTF',activity_type:'Investigation',in_cycle:'FY18:3',card_status:'In-Progress',start_cycle:'FY18:3')
Card.create(title:'User Experience Assessment: Public-Facing Components of the Special Collections Library’s Aeon Implementation [COL]',short_name:'UX Assessment',activity_type:'Investigation',in_cycle:'FY18:3',card_status:'In-Progress',start_cycle:'FY18:3')
Card.create(title:'Campus Partnership Map [MPUB]',short_name:'Partnership Map',activity_type:'Investigation',in_cycle:'FY18:3',card_status:'In-Progress',start_cycle:'FY18:3')
Card.create(title:'Real-time Readership Activity Map [MPUB]',short_name:'Readership Map',activity_type:'Investigation',in_cycle:'FY18:3',card_status:'In-Progress',start_cycle:'FY18:3')
Card.create(title:'Bibliographic rights algorithm [HT]',short_name:'Bib rights',activity_type:'Investigation',in_cycle:'FY18:3',card_status:'In-Progress',start_cycle:'FY18:3')
Card.create(title:'Review/restructuring of HathiTrust Drupal website environment and tools [HT]',short_name:'HT website',activity_type:'Investigation',in_cycle:'FY18:3',card_status:'In-Progress',start_cycle:'FY18:3')
Card.create(title:'Replace ERRWPC with better preservation and access focused service [X-DIV]',short_name:'ERRWPC',activity_type:'Project',in_cycle:'FY18:3',card_status:'In-Progress',start_cycle:'FY18:3')
Card.create(title:'URI Enrichment in MARC Records [COL]',short_name:'MARC Records',activity_type:'Project',in_cycle:'FY18:3',card_status:'In-Progress',start_cycle:'FY18:3')
Card.create(title:'Develop bidirectional workflow between HTRC Workset Builder and HTDL Collection Builder for exporting collections [HT]',short_name:'HT workflow',activity_type:'Project',in_cycle:'FY18:3',card_status:'In-Progress',start_cycle:'FY18:3')
Card.create(title:'Fishrappr++ (Detroit Jewish News) [LIT]',short_name:'Fishrappr',activity_type:'Project',in_cycle:'FY18:3',card_status:'In-Progress',start_cycle:'FY18:3')
Card.create(title:'ArcLight Fall 2017 [LIT]',short_name:'ArcLight',activity_type:'Project',in_cycle:'FY18:3',card_status:'In-Progress',start_cycle:'FY18:3')

#FY18:2 

Card.create(title:'Enterprise Level Workflow/Communication Tool Request [X-DIV]',short_name:'Workflow Tool',activity_type:'TASC Investigation',in_cycle:'FY18:2',card_status:'In-Progress',start_cycle:'FY18:2')
Card.create(title:'LIT preservation principles [LIT]',short_name:'Preservation principles',activity_type:'Investigation',in_cycle:'FY18:2',card_status:'In-Progress',start_cycle:'FY18:2')
Card.create(title:'Improving collection of and analysis of usage data (from Google Analytics and log data) [HT]',short_name:'HT Usage Data',activity_type:'Investigation',in_cycle:'FY18:2',card_status:'In-Progress',start_cycle:'FY18:2')
Card.create(title:'Define needs and use cases for collection analysis to support digital collection development, shared print program, and Federal documents program, including selection of analysis tools (Systems advice on tool selection only) [HT]
',short_name:'HT Collection Analysis',activity_type:'Investigation',in_cycle:'FY18:2',card_status:'In-Progress',start_cycle:'FY18:2')
Card.create(title:'Develop plan to open up front matter [HT]',short_name:'HT Front Matter',activity_type:'Investigation',in_cycle:'FY18:2',card_status:'In-Progress',start_cycle:'FY18:2')
Card.create(title:'SALI Improvements [L&T]',short_name:'SALI',activity_type:'Project',in_cycle:'FY18:2',card_status:'In-Progress',start_cycle:'FY18:2')
Card.create(title:'Aeon update to facilitate container IDs [LIT]',short_name:'Aeon',activity_type:'Project',in_cycle:'FY18:2',card_status:'In-Progress',start_cycle:'FY18:2')
Card.create(title:'Middle English Compendium renovation [LIT]',short_name:'MEC',activity_type:'Project',in_cycle:'FY18:2',card_status:'In-Progress',start_cycle:'FY18:2')
Card.create(title:'Update Digitized Audio ingest script [LIT]',short_name:'Audio Ingest',activity_type:'Project',in_cycle:'FY18:2',card_status:'In-Progress',start_cycle:'FY18:2')
Card.create(title:'Digital Collections Audit [LIT]',short_name:'DC Audit',activity_type:'Project',in_cycle:'FY18:2',card_status:'In-Progress',start_cycle:'FY18:2')
Card.create(title:'Michigan Service Hub Development (DPLA) [LIT]',short_name:'DPLA dev',activity_type:'Project',in_cycle:'FY18:2',card_status:'In-Progress',start_cycle:'FY18:2')
Card.create(title:'Deep Blue Data Fall 2017 [LIT]',short_name:'DB Data',activity_type:'Project',in_cycle:'FY18:2',card_status:'In-Progress',start_cycle:'FY18:2')
Card.create(title:'Omeka Improvements, Phase 2 [LIT]',short_name:'Omeka',activity_type:'Project',in_cycle:'FY18:2',card_status:'In-Progress',start_cycle:'FY18:2')
Card.create(title:'Search Beta Phase 5 [LIT]',short_name:'Search',activity_type:'Project',in_cycle:'FY18:2',card_status:'In-Progress',start_cycle:'FY18:2')
Card.create(title:'Favorites Phase 4 [LIT]',short_name:'Favorites',activity_type:'Project',in_cycle:'FY18:2',card_status:'In-Progress',start_cycle:'FY18:2')
Card.create(title:'Library Analytics [LIT]',short_name:'Analytics',activity_type:'Project',in_cycle:'FY18:2',card_status:'In-Progress',start_cycle:'FY18:2')
Card.create(title:'Deep Blue Documents Fall 2017 [LIT]',short_name:'DB Docs',activity_type:'Project',in_cycle:'FY18:2',card_status:'In-Progress',start_cycle:'FY18:2')
Card.create(title:'Building ObjectClass - Phase 4 [LIT]',short_name:'ObjectClass',activity_type:'Project',in_cycle:'FY18:2',card_status:'In-Progress',start_cycle:'FY18:2')
Card.create(title:'Improvement of Interfaces for DLXS Bentley TextClass Collections: Phase 2 [LIT]',short_name:'Bentley TextClass',activity_type:'Project',in_cycle:'FY18:2',card_status:'In-Progress',start_cycle:'FY18:2')
Card.create(title:'Develop RFP for outside consultant to conduct broader user experience assessment of HTDL (Consulting on RFP development only) [HT]
',short_name:'HT assessment',activity_type:'Project',in_cycle:'FY18:2',card_status:'In-Progress',start_cycle:'FY18:2')
Card.create(title:'Connect Qualtrics and JIRA via email [RSR]
',short_name:'Qualtrics & Jira',activity_type:'Project',in_cycle:'FY18:2',card_status:'In-Progress',start_cycle:'FY18:2')
Card.create(title:'User interface for access to CoreLogic Data [RSR]
',short_name:'CoreLogic interface',activity_type:'Project',in_cycle:'FY18:2',card_status:'In-Progress',start_cycle:'FY18:2')
Card.create(title:'Review metadata data model across all HT/HTRC data stores [HT]
',short_name:'HT Data model review',activity_type:'Project',in_cycle:'FY18:2',card_status:'In-Progress',start_cycle:'FY18:2')
Card.create(title:'Review metadata data model across all HT/HTRC data stores [HT]
',short_name:'HT Data model review',activity_type:'Project',in_cycle:'FY18:2',card_status:'In-Progress',start_cycle:'FY18:2')




#FY19:3
Card.create(title:'Virtual Reading Room',short_name:'Virtual Ref Room',activity_type:'Investigation',in_cycle:'FY19:3',card_status:'On-Hold',start_cycle:'FY19:3')
Card.create(title:'Brunnhilde VM Front Door Card',short_name:'Brunnhilde',activity_type:'Project',in_cycle:'FY19:3',card_status:'In-Progress',start_cycle:'FY19:3')
Card.create(title:'Investigating the Viability of the ArchivesSpace Public User Interface',short_name:'ArchivesSpace UI',activity_type:'Investigation',in_cycle:'FY19:3',card_status:'In-Progress',start_cycle:'FY19:3')
Card.create(title:'Digital Archives Access Options Investigation',short_name:'Archives Access',activity_type:'Project',in_cycle:'FY19:3',card_status:'In-Progress',start_cycle:'FY19:3')
Card.create(title:'Mapping Disability Inclusion Database',short_name:'Disability DB',activity_type:'Investigation',in_cycle:'FY19:3',card_status:'On-Hold',start_cycle:'FY19:3')
Card.create(title:'DBUG: Deep Blue Unity MVP',short_name:'DBUG',activity_type:'Project',in_cycle:'FY19:3',card_status:'In-Progress')
Card.create(title:'Update design for new "clementsead" to new Clements website design',short_name:'Clements EADs',activity_type:'Project',in_cycle:'FY19:3',card_status:'Done',start_cycle:'FY19:3')
Card.create(title:'Refresh of Research Guides Portal/Home Page',short_name:'Research Guides',activity_type:'Project',in_cycle:'FY19:3',card_status:'Done',start_cycle:'FY19:3')
Card.create(title:'Position Tracker',short_name:'Position Tracker',activity_type:'Project',in_cycle:'FY19:3',card_status:'Done',start_cycle:'FY19:3')
Card.create(title:'Buhr Inventory Numbers/Date added to Datamart report',short_name:'Buhr Inventory',activity_type:'Project',in_cycle:'FY19:3',card_status:'Done',start_cycle:'FY19:3')
Card.create(title:'Deep Blue Data: Collaboration with Indiana University and UI/UX updates',short_name:'DBD Collaboration',activity_type:'Project',in_cycle:'FY19:3',card_status:'Done',start_cycle:'FY19:3')
Card.create(title:'Workflows for Adjacent Applications',short_name:'Adjacent Apps',activity_type:'Project',in_cycle:'FY19:3',card_status:'Done',start_cycle:'FY19:3')
Card.create(title:'Move the Civil Rights Litigation Clearinghouse to AWS',short_name:'Clearinghouse Move',activity_type:'Project',in_cycle:'FY19:3',card_status:'Done',start_cycle:'FY19:3')
# FY19:2
Card.create(title:'Undergraduate Student Library Assignment Calculator/Research Scheduler',short_name:'Research Scheduler',activity_type:'Investigation',in_cycle:'FY19:2',card_status:'On-Hold',start_cycle:'FY19:2')
Card.create(title:'Canvas LTI Integration, Library PageBuilder',short_name:'Canvas PageBuilder',activity_type:'Investigation',in_cycle:'FY19:2',card_status:'In-Progress',start_cycle:'FY19:2')
Card.create(title:'Technology to support Bibframe analysis',short_name:'Bibframe Analysis',activity_type:'TASC Investigation',in_cycle:'FY19:2',card_status:'In-Progress',start_cycle:'FY19:2')
Card.create(title:'Investigate IIIF Solutions Appropriate for Michigan Service Hub (DPLA)',short_name:'IIIF for DPLA',activity_type:'Investigation',in_cycle:'FY19:2',card_status:'In-Progress',start_cycle:'FY19:2')
Card.create(title:'Exploring better ways to integrate Google Sheets and Trello for LIT CG',short_name:'Trello API',activity_type:'Investigation',in_cycle:'FY19:2',card_status:'Done',start_cycle:'FY19:2')
Card.create(title:'LIT Documentation Standards',short_name:'LIT Doc Standards',activity_type:'Investigation',in_cycle:'FY19:2',card_status:'Done',start_cycle:'FY19:2')
Card.create(title:'Upgrade tool to identify rare/unique print copies',short_name:'Rare Print Copies',activity_type:'Project',in_cycle:'FY19:2',card_status:'In-Progress',start_cycle:'FY19:2')
Card.create(title:'Dark Blue Enhancements',short_name:'Dark Blue',activity_type:'Project',in_cycle:'FY19:2',card_status:'In-Progress',start_cycle:'FY19:2')
Card.create(title:'An improved UI for Combine (Michigan Service Hub)',short_name:'Combine UI',activity_type:'Project',in_cycle:'FY19:2',card_status:'On-Hold',start_cycle:'')
Card.create(title:'Set up Combine for the Michigan Service Hub',short_name:'Setup Combine',activity_type:'Project',in_cycle:'FY19:2',card_status:'Done',start_cycle:'FY19:2')
Card.create(title:'Deep Blue Data: Collaboration with Indiana University',short_name:'Deep Blue Data',activity_type:'Project',in_cycle:'FY19:2',card_status:'Done',start_cycle:'FY19:2')
Card.create(title:'ArcLight Fall/Winter 2018 [LIT]',short_name:'ArcLight',activity_type:'Project',in_cycle:'FY19:2',card_status:'In-Progress',start_cycle:'FY19:2')
Card.create(title:'Metadata Aggregation Tools for Michigan Service Hub (DPLA Combine) [LIT]
',short_name:'Aggregation Tool',activity_type:'Project',in_cycle:'FY19:2',card_status:'In-Progress',start_cycle:'FY19:2')
Card.create(title:'Rebuild HathiTrust SLIP indexing process',short_name:'HT SLIP',activity_type:'Project',in_cycle:'FY19:2',card_status:'In-Progress',start_cycle:'FY19:2')
Card.create(title:'Tool/Interface for HathiTrust staff to change approved users'' elevated access to in-copyright materials',short_name:'HT SLIP',activity_type:'Project',in_cycle:'FY19:2',card_status:'In-Progress',start_cycle:'FY19:2')

#Card.create(title:'',short_name:'',activity_type:'Project',in_cycle:'FY19:1')
#Card.create(title:'',short_name:'',activity_type:'Investigation',in_cycle:'FY19:1')
#FY19:1
Card.create(title:'Consultation Service Design Scheduling, Knowledgebase and CRM Tool Pilot [X-DIV]',short_name:'Service Design and CRM',activity_type:'Project',in_cycle:'FY19:1',start_cycle:'FY19:1',card_status:'In-Progress')
Card.create(title:'Lexis Nexis Web Services Kit [X-DIV]',short_name:'Lexis Nexis',activity_type:'Project',in_cycle:'FY19:1',start_cycle:'FY19:1',card_status:'In-Progress')
Card.create(title:'Open Michigan',short_name:'Open MI',activity_type:'Project',in_cycle:'FY19:1',start_cycle:'FY19:1',card_status:'In-Progress')
Card.create(title:'Infrastructure Support for “The Impact of the Academic Library on Learning in the University” IMLS Grant [LIT]',short_name:'Impact of the Academic Library',activity_type:'Project',in_cycle:'FY19:1',start_cycle:'FY19:1',card_status:'In-Progress')
Card.create(title:'War of the Worlds Primary Source Materials Online Access [RSR]',short_name:'War of the Worlds',activity_type:'TASC Investigation',in_cycle:'FY19:1',start_cycle:'FY19:1',card_status:'In-Progress')
Card.create(title:'Website Redesign Phase 2: HathiTrust website revamp/redesign',short_name:'HT Website Phase 2',activity_type:'Project',in_cycle:'FY19:1',start_cycle:'FY19:1',card_status:'In-Progress')
Card.create(title:'Create a process and policies for recruiting users for testing of HTDL applications',short_name:'HTDL User Policies',activity_type:'Project',in_cycle:'FY19:1',start_cycle:'FY19:1',card_status:'In-Progress')
Card.create(title:'LIT Space Redesign, Phase 1: North Buhr',short_name:'Space Redesign-1',activity_type:'Project',in_cycle:'FY19:1',start_cycle:'FY19:1',card_status:'In-Progress')
Card.create(title:'LIT Space Redesign, Phase 2: 4th Floor Hatcher North',short_name:'Space Redesign-2',activity_type:'Project',in_cycle:'FY19:1',start_cycle:'FY19:1',card_status:'In-Progress')
Card.create(title:'Deep Blue Data Upgrade To Hyrax 2.0',short_name:'DBD Upgrade',activity_type:'Project',in_cycle:'FY19:1',start_cycle:'FY19:1',card_status:'In-Progress')
Card.create(title:'DSpace to Hyrax data migration',short_name:'DSpace 2 Hyrax',activity_type:'Project',in_cycle:'FY19:1',start_cycle:'FY19:1',card_status:'In-Progress')

#FY20:1
Card.create(title:'Campus LTI PageBuilder Implementation',short_name:'Canvas',activity_type:'Project',in_cycle:'FY20:1',start_cycle:'FY20:1',card_status:'Other',card_type: 'Other')
Card.create(title:'Retire Debian 8',short_name:'Retire Debian 8',activity_type:'Project',in_cycle:'FY20:1',start_cycle:'FY20:1',card_status:'In-Progress', card_type: 'Other')
Card.create(title:'Migrate SCRC and Clements Aeon to Atlas hosting',short_name:'Aeon hosting',activity_type:'Project',in_cycle:'FY20:1',start_cycle:'FY20:1',card_status:'In-Progress', card_type: 'Other')
Card.create(title:'Migrate Fulcrum to an isolated hosting environment',short_name:'Fulcrum hosting',activity_type:'Project',in_cycle:'FY20:1',start_cycle:'FY20:1',card_status:'In-Progress')
Card.create(title:'Footprints succession',short_name:'Footprints succession',activity_type:'Project',in_cycle:'FY20:1',start_cycle:'FY20:1',card_status:'In-Progress')
Card.create(title:'Millennium Project websites',short_name:'Millennium websites',activity_type:'Project',in_cycle:'FY20:1',start_cycle:'',card_status:'In-Progress')
Card.create(title:'Non-HLB Expertise',short_name:'Non-HLB expertise',activity_type:'Project',in_cycle:'FY20:1',start_cycle:'',card_status:'In-Progress', card_type: 'Other')
Card.create(title:'Deep Blue Data',short_name:'DB Data',activity_type:'Project',in_cycle:'FY20:1',start_cycle:'',card_status:'In-Progress', card_type: 'Strategic', epic: 'Deep Blues')
Card.create(title:'Catalog Search Holdings Redesign',short_name:'Catalog Search Holdings',activity_type:'Project',in_cycle:'FY20:1',start_cycle:'FY20:1',card_status:'Other', card_type: 'Strategic', epic: 'Search')
Card.create(title:'Create common libraries to deal with search/advanced search',short_name:'Common Libraries',activity_type:'Project',in_cycle:'FY20:1',start_cycle:'')

#Milestone.create(card_id: '129', milestone: 'Project started.', cycle: 'FY20:1', status: '', recorded_on: '')
#Milestone.create(card_id: '129', milestone: 'Project staffed.', cycle: 'FY20:1', status: '', recorded_on: '')

#Comment.create(card_id: '129', uemail: '', comment_txt: 'Great idea!', recorded_on: '')

#FY20:2
Card.create(title:'Transfer & Graduate Student Interative Game',short_name:'Interactive Game',activity_type:'Project',in_cycle:'FY20:2',start_cycle:'',card_status:'Other', card_type: 'Other')
Card.create(title:'Deep Blue Unity',short_name:'DBU',activity_type:'Project',in_cycle:'FY20:2',start_cycle:'',card_status:'Other', card_type: 'Strategic',epic: 'Deep Blues')
Card.create(title:'ArchiveSpace PUI Implementation for SCRC',short_name:'ArchiveSpace PUI',activity_type:'Project',in_cycle:'FY20:2',start_cycle:'',card_status:'Other', card_type: 'Other')
Card.create(title:'Update mechanism through which record metadata is provided to the Library searchuser interface',short_name:'Lib Search-Rec Metadata',activity_type:'Project',in_cycle:'FY20:2',start_cycle:'',card_status:'Other', card_type: 'Strategic', epic:'Search')
Card.create(title:'Cycle Planning Tool - Phase 2',short_name:'tracc',activity_type:'Project',in_cycle:'FY20:2',start_cycle:'',card_status:'Other', card_type: 'Other')
Card.create(title:'Workflow and Communication Tool Pilot',short_name:'Workflow Tool',activity_type:'Project',in_cycle:'FY20:2',start_cycle:'',card_status:'Other', card_type: 'Other')
Card.create(title:'DSpace Upgrade',short_name:'DSpace Upgrade',activity_type:'Project',in_cycle:'FY20:2',start_cycle:'',card_status:'Other', card_type: 'Strategic', epic: 'Deep Blues')
Card.create(title:'Hyrax Working Group',short_name:'Hyrax WG',activity_type:'Project',in_cycle:'FY20:2',start_cycle:'',card_status:'Other', card_type: 'Strategic', epic: 'Deep Blues')

#FY20:3
Card.create(title:'Creating a User interface for the New Digital Collections Platform: Phase 3',short_name:'UI for DCP',activity_type:'Project',in_cycle:'FY20:3',start_cycle:'',card_status:'New', card_type: 'Strategic',epic: 'DCP')
Card.create(title:'ArcLight Solution Investigation',short_name:'ArcLight',activity_type:'Project',in_cycle:'FY20:3',start_cycle:'',card_status:'Other', card_type: 'Strategic', epic: 'DCP')
Card.create(title:'Campus Map Extension-DBRRDS partnerships',short_name:'Campus Map',activity_type:'Project',in_cycle:'FY20:3',start_cycle:'',request_type: 'Consultation', card_status:'New', card_type: 'Strategic', epic: 'Deep Blues')
Card.create(title:'Campus Partnership Map Extension-Mapping Deposits made to Deep Blue and Deep Blue Data',short_name:'Readership Map',activity_type:'Project',in_cycle:'FY20:3',start_cycle:'', request_type: 'Consultation',card_status:'New', card_type: 'Strategic',epic: 'Deep Blues')
Card.create(title:'Building ObjectClass (FY20:3 Phase)',short_name:'ObjectClass',activity_type:'Project',in_cycle:'FY20:3',start_cycle:'',card_status:'New', card_type: 'Strategic', epic: 'DCP')
Card.create(title:'Rationalize application hosting - Phase 1',short_name:'App Hosting',activity_type:'Project',in_cycle:'FY20:3',start_cycle:'',card_status:'New', card_type: 'Other')



