User.create(name:'Nabeela Jaffer',email:'njaffer@umich.edu',password: 'topsecret')
User.create(name:'Gordon Leacock',email:'gordonl@umich.edu',password: '123456')
User.create(name:'Gordon Leacock',email:'gordonl@lit.edu',password: '123456')
User.create(name:'View Only User',email:'view@umich.edu',password: '123456')


Permit.create(email:'njaffer@umich.edu', level: 0)
Permit.create(email:'gordonl@umich.edu', level: 0)
Permit.create(email:'marianle@umich.edu', level: 0)
Permit.create(email:'skorner@umich.edu', level: 0)
Permit.create(email:'mcyork@umich.edu', level: 0)
Permit.create(email:'khage@umich.edu', level: 0)
Permit.create(email:'gordonl@lit.edu', level: 0)
Permit.create(email:'view@umich.edu', level: 9)


Status.create(status:'New') ;
Status.create(status:'Done') ;
Status.create(status:'Active') ;
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

Cycle.create(cycle_name:'FY20:1',start:'2019-07-01',end:'',current_cycle:0)
Cycle.create(cycle_name:'FY20:2',start:'2019-11-01',end:'',current_cycle:0)
Cycle.create(cycle_name:'FY20:3',start:'2020-03-01',end:'',current_cycle:1)
Cycle.create(cycle_name:'FY21:1',start:'2020-07-01',end:'',current_cycle:0)
Cycle.create(cycle_name:'FY21:2',start:'2020-11-01',end:'',current_cycle:0)
Cycle.create(cycle_name:'FY21:3',start:'2021-03-01',end:'',current_cycle:0)
Cycle.create(cycle_name:'FY22:1',start:'2021-07-01',end:'',current_cycle:0)
Cycle.create(cycle_name:'FY22:2',start:'2021-11-01',end:'',current_cycle:0)
Cycle.create(cycle_name:'FY22:3',start:'2022-03-01',end:'',current_cycle:0)