global with sharing class DailyLeadProcessor implements Schedulable{

    global void execute(SchedulableContext SC)
    {
        String strQuery='';
        String blanco ='';
        list<lead>lstLeads=[Select Id, LeadSource FROM lead Where LeadSource ='' limit 200];
        for(lead leadactual: lstLeads ) {
            leadactual.LeadSource = 'Dreamforce';
        }
        update lstLeads;
        
    }
}