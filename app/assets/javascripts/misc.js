function update_score_investigations(id) {   

   var value1 = 0;
   var value2 = 0;
   var value3 = 0;
   var value4 = 0;
   var value5 = 0;
    

   var value_element = document.getElementById ( "investigation_scope_" + id);
   if (value_element) { value1 = Number(value_element.value); }

   var value_element = document.getElementById ( "tech_knowledge_" + id);
   if (value_element) { value2 = Number(value_element.value); }

   var value_element = document.getElementById ( "team_scope_" + id);
   if (value_element) { value3 = Number(value_element.value); }

   var value_element = document.getElementById ( "cost_" + id);
   if (value_element) { value4 = Number(value_element.value); }

   var value_element = document.getElementById ( "divergence_" + id);
   if (value_element) { value5 = Number(value_element.value); }

   var hidden_element = document.getElementById ( "hidden_total_complexity_score_" + id );
   var display_element = document.getElementById ( "total_complexity_score_" + id );
   var total_complexity_score = (value1 * 0.3) + (value2 * 0.4) + (value3 * 0.3);
   display_element.innerHTML = total_complexity_score;
   hidden_element.value = total_complexity_score;

   var hidden_element = document.getElementById ( "hidden_total_cost_score_" + id );
   var display_element = document.getElementById ( "total_cost_score_" + id );
   var total_cost_score = (value4 * 0.5) + (value5 * 0.5);
   display_element.innerHTML = total_cost_score;
   hidden_element.value = total_cost_score;

   var hidden_element = document.getElementById ( "hidden_weighted_score_" + id );
   var display_element = document.getElementById ( "weighted_score_" + id );
   var weighted_score = (total_complexity_score + total_cost_score)/2;
   display_element.innerHTML = weighted_score;
   hidden_element.value = weighted_score;

}


function update_score_projects(id) {   

   var value1 = 0;
   var value2 = 0;
   var value3 = 0;
   var value4 = 0;
   var value5 = 0;
   var value6 = 0;
   var value7 = 0;
   var value8 = 0;
   var value9 = 0;
   

   var value_element = document.getElementById ( "infrastructure_" + id);
   if (value_element) { value1 = Number(value_element.value); }

   var value_element = document.getElementById ( "application_" + id);
   if (value_element) { value2 = Number(value_element.value); }

   var value_element = document.getElementById ( "front_end_" + id);
   if (value_element) { value3 = Number(value_element.value); }

   var value_element = document.getElementById ( "data_content_" + id);
   if (value_element) { value4 = Number(value_element.value); }

   var value_element = document.getElementById ( "team_scope_" + id);
   if (value_element) { value5 = Number(value_element.value); }

   var value_element = document.getElementById ( "staff_resources_" + id);
   if (value_element) { value6 = Number(value_element.value); }

   var value_element = document.getElementById ( "divergence_" + id);
   if (value_element) { value7 = Number(value_element.value); }

   var value_element = document.getElementById ( "money_" + id);
   if (value_element) { value8 = Number(value_element.value); }

   var value_element = document.getElementById ( "operational_" + id);
   if (value_element) { value9 = Number(value_element.value); }


   var hidden_element = document.getElementById ( "hidden_total_complexity_score_" + id );
   var display_element = document.getElementById ( "total_complexity_score_" + id );
   var total_complexity_score = (value1 + value2 + value3 + value4 + value5) * 0.2;
   display_element.innerHTML = total_complexity_score;
   hidden_element.value = total_complexity_score;

   var hidden_element = document.getElementById ( "hidden_total_cost_score_" + id );
   var display_element = document.getElementById ( "total_cost_score_" + id );
   var total_cost_score = (value6 + value7 + value8) * 0.3 + (value9 * 0.2);
   display_element.innerHTML = total_cost_score;
   hidden_element.value = total_cost_score;

   var hidden_element = document.getElementById ( "hidden_weighted_score_" + id );
   var display_element = document.getElementById ( "weighted_score_" + id );
   var weighted_score = (total_complexity_score + total_cost_score)/2;
   display_element.innerHTML = weighted_score;
   hidden_element.value = weighted_score;

}