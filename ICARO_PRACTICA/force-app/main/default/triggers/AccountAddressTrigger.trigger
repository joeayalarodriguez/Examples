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
trigger AccountAddressTrigger /*Account_tgr*/ on Account (before insert,before update/*, before delete*/) {
  //JA Consulta en la configuración de la metadata personalizada si el trigger debe ejecutarse
	/*Trigger_Control__mdt Control = [SELECT label, Activo__c FROM Trigger_Control__mdt WHERE label = 'Account_tgr'];
    if(Control.Activo__c){
        
    	if(trigger.isUpdate)
          {
              AccountHandler_cls.BeforeUpdate(Trigger.new);             
          }
        
        if(trigger.Isdelete)
          {
              AccountHandler_cls.BeforeDelete(Trigger.old, Trigger.oldMap);             
          }
    } */
     for(Account ac : Trigger.new){
        If (ac.Match_Billing_Address__c == true && ac.BillingPostalCode!=Null) {
            ac.ShippingPostalCode = ac.BillingPostalCode;
        }   
    }
    
}