global class LeadProcessor implements Database.Batchable<sObject> {
    
   global Database.QueryLocator start(Database.BatchableContext bc) {
        return Database.getQueryLocator(
            'Select Id, LeadSource FROM lead'            
        );
    }
    global void execute(Database.BatchableContext bc, List<lead> scope){
        // process each batch of records
        for (lead leadsfor : scope) {
            leadsfor.LeadSource = 'Dreamforce';
        }
        update scope;
    }    
    global void finish(Database.BatchableContext bc){
        
    }  
}