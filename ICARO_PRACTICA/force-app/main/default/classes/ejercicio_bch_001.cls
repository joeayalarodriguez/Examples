global class ejercicio_bch_001 implements Database.Batchable<sObject>, Database.Stateful {
    
    global Database.QueryLocator start(Database.BatchableContext BC){
     String query='SELECT Id, Name FROM account ';
     system.debug('Este es mi query ==>>' + query) ;
     return Database.getQueryLocator(query);

    } 
    
    global void execute(Database.BatchableContext BC, List<sObject> scope){
        
    }
    
    global void finish(Database.BatchableContext BC){
      Task tarea = new Task();
        tarea.OwnerId = system.userinfo.getUserId();
        tarea.ReminderDateTime = system.now();
        tarea.Subject = 'esta es una tarea creada por el batch';
        insert tarea;
        system.debug(' --------------------esta es mi tarea ' + tarea);
    }
}