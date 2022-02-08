/******************************************************************************************************************
 * Autor		Joe Ayala
 * Proyecto		CAPACITACION UAO
 * Decripción	Gestiona los eventos de la cuenta	
 * ______________________________________________________
 * Version 	1.0		20-03-2019		Joe Ayala	Creación de la clase
 * Version 	1.1		20-03-2019		Joe Ayala	modifica el método xxxx
*******************************************************************************************************************/
trigger Cuenta_tgr on Account (before update, after update) {
   //comentario una linea
   Trigger_Control__mdt control = [SELECT label, Activo__c FROM Trigger_Control__mdt WHERE label = 'Cuenta_tgr'];
    if(control.Activo__c){
        system.debug('Entre al trigger de cuentas ' + trigger.new);        
        //MODIFICACION--------------------------------------------------------------
        if(trigger.isupdate){
            system.debug(' ES MODIFICACION' ); 
            if(trigger.isafter){
            	system.debug('ES AFTER ' );
            }else if(trigger.isbefore){
                system.debug('ES BEFORE ' + trigger.new); 
                CuentaHandler_cls.beforeUpdate(trigger.new);  
                limits.getQueries();
            }            
        }
        
        //ELIMINACION
        //INSERT
        
        
        
        
        
    }else{
        system.debug('////// NO ESTA ACTIVO ');
    } 
   
}