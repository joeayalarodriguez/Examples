/****************************************************************************************************************
* Avanxo 
* @author           Joe Ayala
* Proyecto:         CAPACITACIÓN
* Descripción:       Gestiona los eventos de CUENTA  
* Cambios (Version)
* -------------------------------------------
*            No.      Fecha               Autor                           Descripción
*           -----   ----------      ---------------------               ---------------
* @version   1.0    19/03/2019      Joe Ayala             				Creación de la clase
****************************************************************************************************************/
trigger /*Oportunidad_tgr*/ClosedOpportunityTrigger on Opportunity (/*before update, before delete*/ after insert , after update) {
  //JA Consulta en la configuración de la metadata personalizada si el trigger debe ejecutarse
	/*Trigger_Control__mdt Control = [SELECT label, Activo__c FROM Trigger_Control__mdt WHERE label = 'Oportunidad_tgr'];
    if(Control.Activo__c){        
           
        if(trigger.Isdelete)
          {
              OpportunityHandler_cls.BeforeDelete(Trigger.old, Trigger.oldMap);             
          }
    } */
     list<task> TaskToadd = new list<task>();
    for (Opportunity opp: trigger.new)
    {
        if (opp.StageName =='Closed Won'){
            task t = new task();
            t.whatID = opp.id; 
            t.Subject='Follow Up Test Task';
            TaskToadd.add(t);
        }
    }
    if(TaskToadd.size() > 0){
        database.insert(TaskToadd);
    }
}