/***************************************************************************************************************
* Avanxo 
* @author          	Joe Alexander Ayala
* Proyecto:         XXXXXXXX
* Descripción:      Servicio REST utilizado para xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx.
* Cambios (Version)
* -------------------------------------------
*           No.     Fecha           Autor                               Descripción
*           -----   ----------      ---------------------               ---------------
* @version   1.0    21/09/2018      Joe Alexander Ayala               Creación de la clase

{
   "numeroCaso" : "00001002",
   "tareaAuraportal" : "789"
}


****************************************************************************************************************/
@RestResource(urlMapping='/ActualizarCaso/*')
global with sharing class F1_EstructuraServicioREST {
    
    @HttpPost
    global static responsews doPost(String numeroCaso, String tareaAuraportal) {
    	RestRequest reuest = RestContext.request;
        RestResponse response = RestContext.response;
        response.addHeader('Content-Type', 'application/json');
        
        responsews responsews = new  responsews();
        if(numeroCaso <> null && numeroCaso <> ''){
            if(tareaAuraportal <> null && tareaAuraportal <> ''){
                list<Case> CaseUpdate = [SELECT Status, F1_TareaAuraportal__c, CaseNumber, Id FROM Case WHERE CaseNumber =: numeroCaso limit 1];
                if(CaseUpdate <> null && CaseUpdate.size() > 0){
                    CaseUpdate[0].F1_TareaAuraportal__c = tareaAuraportal;
                    if(CaseUpdate[0].Status =='Abierto'){
                       CaseUpdate[0].Status = 'En Gestión';
                    }                    
                    CaseUpdate[0].F1_TareaAuraportal__c = tareaAuraportal;
                    
                    try{
                        update CaseUpdate;
                        responsews.succes = true;
		    			responsews.message = 'Caso ' + numeroCaso + ' actualizado correctamente.';
                    }catch(Exception ex){
                        responsews.succes = false;
		    			responsews.message = 'Se presentó un error al intentar modificar el caso '  + numeroCaso + ', error presentado: ' + ex;  
                    }
                    
                    return responsews; 
                }else{
                	responsews.succes = False;
		    		responsews.message = 'No se encontró ningun caso en Salesforce con el numero ' + numeroCaso + ' por favor verifique nuevamente.';
                	return responsews; 
                }
            }else{
                responsews.succes = False;
		    	responsews.message = 'No se recibió número de tarea de AuraPortal ' ;
                return responsews;
            }
        }else{
            responsews.succes = False;
		    responsews.message = 'No se recibió número de caso Salesforce ' ;
            return responsews;
        }
        
    }  
    
    global class responsews {
        Boolean succes;
        String message;        
    }
    
  
}