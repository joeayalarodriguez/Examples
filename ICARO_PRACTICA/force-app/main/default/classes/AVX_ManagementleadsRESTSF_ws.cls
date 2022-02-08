/******************************************************************************************************************************************************************
* Proyecto		Capacitacion
* Descripción	Servicio REST que administra candidatos	
*****************************************************************************************************************************************************************/
@RestResource(urlMapping='/ManagementLead/*')
global with sharing class AVX_ManagementleadsRESTSF_ws {
	
    @HttpDelete
    global static responsews deleteLeads(){
       responsews respuesta = new responsews();
        
       RestRequest request = RestContext.request;
       RestResponse response = RestContext.response;
       String leadId = request.requestURI.substring(request.requestURI.lastIndexOf('/')+1); 
       system.debug('Id de candidato a borrar ' + leadId);  
             
       
        try{
            lead leadtoDelete = [SELECT Id FROM lead WHERE Id =: leadId];
            system.debug('Se encontró el siguiente lead para borrar ' + leadtoDelete); 
            delete leadtoDelete;
             //enviar una respuesta
            respuesta.salesforceId = leadId;
            respuesta.EntidadComercial = 'Lead';
            respuesta.Estatus = 'Succes';
            respuesta.Errorcode = '';
            respuesta.Mensage = 'Candidato borrado satisfactoriamente ';
        }catch(Exception ex){
            respuesta.salesforceId = leadId;
            respuesta.EntidadComercial = 'Lead';
            respuesta.Estatus = 'Error';
            respuesta.Errorcode = 'NOT FOUND';
            respuesta.Mensage = 'Se produjo el siguiente error  ' + ex;
        }
       
       return respuesta;
    }
    
    @HttpGet
    global static list<lead> getlead(){
        list<lead> listleads = [SELECT Address,City,Company,Email,Id,LastName,LeadSource,Name,Phone,Rating,Title FROM Lead];
        return listleads;
    }
   
    @HttpPost
    global static list<responsews> dopost(clsLeadsf candidato){
        system.debug('Candidatos recibidos ' + candidato);
        list<responsews> lstresponse = new list<responsews>();
        Lead leadacrear;
        RestRequest request = RestContext.request;
        RestResponse response = RestContext.response;
        response.addHeader('Content-Type', 'application/json');
        responsews respuesta = new responsews();
        
        if(candidato <> null){
            leadacrear = new lead();
            leadacrear.Company = candidato.Company;
            leadacrear.LastName = candidato.LastName;            
            leadacrear.Title = candidato.Title;
            try{
                insert leadacrear;
                respuesta.salesforceId = leadacrear.Id;
                respuesta.EntidadComercial = 'Lead';
                respuesta.Estatus = 'Succes';
                respuesta.Errorcode = '';
                respuesta.Mensage = 'Candidato ' + leadacrear.LastName + ' creado satisfactoriamente ';
                lstresponse.add(respuesta);
            }catch(exception ex){
                respuesta.salesforceId = '';
                respuesta.EntidadComercial = 'Lead';
                respuesta.Estatus = 'Error';
                respuesta.Errorcode = 'NOT FOUND';
                respuesta.Mensage = 'Se produjo el siguiente error  ' + ex;
                lstresponse.add(respuesta);
            }
        }else{
            respuesta.salesforceId = '';
            respuesta.EntidadComercial = 'Lead';
            respuesta.Estatus = 'Error';
            respuesta.Errorcode = 'Vacio';
            respuesta.Mensage = 'Se esperaba información  ';
            lstresponse.add(respuesta);
        }
        return lstresponse;
    }
    
    @HttpPatch
    global static responsews updateleadfields(){
        responsews respuesta = new responsews();
        RestRequest request = RestContext.request;
        String strleadId = request.requestURI.substring(request.requestURI.lastIndexOf('/')+1);
        lead objcandidato = [SELECT Id FROM Lead WHERE Id =:strleadId];
        
        map<String,Object> mapparams = (map<String,Object>)JSON.deserializeUntyped(request.requestBody.tostring());
        for(String fieldname: mapparams.KeySet()){
            objcandidato.put(fieldname, mapparams.get(fieldname));               
        }        
        try{
            update objcandidato;
            respuesta.salesforceId = strleadId;
            respuesta.EntidadComercial = 'Lead';
            respuesta.Estatus = 'Succes';
            respuesta.Errorcode = '';
            respuesta.Mensage = ' El candidato  se actualizó correctamente  ';
        }catch(exception ex){
            respuesta.salesforceId = strleadId;
            respuesta.EntidadComercial = 'Lead';
            respuesta.Estatus = 'Error';
            respuesta.Errorcode = 'Not Found';
            respuesta.Mensage = 'Se produjo un error al actualizar el candidato ' + ex;
        }         
        return respuesta;
    }
    
    @HttpPut
    global static Id upsertLead(String strTitle, String strStatus, String strFirstName, String strLastName, String strId, String strCompany){
        lead thislead = new lead( 
        	Id = strId,
            Title = strTitle,
            Status = strStatus,
            FirstName = strFirstName,
            LastName = strLastName,
            Company = strCompany
        );
        upsert thislead;
        return thislead.Id;        
    }
        
        
    global class clsLeadsf{
      public String Company;
      public String LastName;
      public String Title;  
    }    
       
    global class responsews{
        public String salesforceId;
        public String EntidadComercial;
        public String Estatus;
        public String Errorcode;
        public String Mensage;
    }   
        
}