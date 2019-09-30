function update_score(id) {   

   var value1 = 0;
   var value2 = 0;
   var value3 = 0;
   var value4 = 0;
   var value5 = 0;
   var value6 = 0;
   var value7 = 0;
   var value8 = 0;
   var value9 = 0;
   var value10 = 0;
   var value11 = 0;     

   var value_element = document.getElementById ( "investigation_scope_" + id);
   if (value_element) { value1 = Number(value_element.value); }

   var value_element = document.getElementById ( "tech_knowledge_" + id);
   if (value_element) { value2 = Number(value_element.value); }

   var value_element = document.getElementById ( "team_scope_" + id);
   if (value_element) { value3 = Number(value_element.value); }

   var value_element = document.getElementById ( "divergence_" + id);
   if (value_element) { value4 = Number(value_element.value); }

   var value_element = document.getElementById ( "infrastructure_" + id);
   if (value_element) { value5 = Number(value_element.value); }

   var value_element = document.getElementById ( "application_" + id);
   if (value_element) { value6 = Number(value_element.value); }

   var value_element = document.getElementById ( "front_end_" + id);
   if (value_element) { value7 = Number(value_element.value); }

   var value_element = document.getElementById ( "data_content_" + id);
   if (value_element) { value8 = Number(value_element.value); }

   var value_element = document.getElementById ( "staff_resources_" + id);
   if (value_element) { value9 = Number(value_element.value); }

   var value_element = document.getElementById ( "money_" + id);
   if (value_element) { value10 = Number(value_element.value); }

   var value_element = document.getElementById ( "operational_" + id);
   if (value_element) { value11 = Number(value_element.value); }


   var total_element = document.getElementById ( "total_complexity_score_" + id );


   total_element.innerHTML = value1 + value2 + value3 + value4 + value5 + value6 + value7 + value8 + value9 + value10 + value11;
   
}