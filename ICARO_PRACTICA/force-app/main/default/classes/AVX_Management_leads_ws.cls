/***************************************************************************************************************
* Avanxo 
* @author           Joe Ayala
* Proyecto:         Avanxo
* Descripción:      Gestiona la creación, modificacióin y eliminación de leads 

* Cambios (Versión)
* -------------------------------------------
*            No.      Fecha               Autor                           Descripción
*           -----   ----------      ---------------------               ---------------
* @versión   1.0    22/02/2019      Joe Ayala (JA)                  Creación de la clase

 /services/apexrest/Managementlead
{
  	"candidato":
    {
 		"Name": "Joe Ayala",
    	"Status": "Open - Not Contacted",
    	"Company": "Avanxo",
		"Title": "Consultor técnico Senior",
    	"Phone": "(850) 644-4200",
		"Description": "Esta es una creación desde web service"    
	}       
}

***************************************************************************************************************/
@RestResource(urlMapping='/Managementlead1/*')
global with sharing class AVX_Management_leads_ws {
     
    @HttpDelete
    global static list <responsews> deleteleads() {
        list<responsews> lstresponses = new list<responsews>();
        RestRequest reuest = RestContext.request;
        RestResponse response = RestContext.response;
        String leadId = reuest.requestURI.substring(reuest.requestURI.lastIndexOf('/')+1);
         system.debug('lead que se borrará  ' + leadId);
        lead leadstodelete = [SELECT Id FROM Lead WHERE Id = :leadId];
        system.debug('lead encontrado para borrar ' + leadstodelete);
        delete leadstodelete;

        responsews rs = new responsews();
                          rs.SalesforceId = '';
                          rs.EntidadComercial = leadstodelete.Id; 
                          rs.Estatus = 'Succes';
                          rs.ErrorCode = '';
                          rs.Message = 'Candidato borrado correctamente';
        lstresponses.add(rs);   
        return lstresponses;
    }
    
    @HttpPost
    global static list <responsews> doPost(cls_leadSf candidato){
        system.debug(' leads entrantes '  +  candidato);
   	 	list<responsews> lstresponses = new list<responsews>();
        lead leadacrear;
        RestRequest reuest = RestContext.request;
        RestResponse response = RestContext.response;
        response.addHeader('Content-Type', 'application/json');        
        responsews responsews = new  responsews();
        if(candidato <> null){
           
                leadacrear = new lead();
                leadacrear.LastName 	= candidato.Name;
                leadacrear.Status 		= candidato.Status;
                leadacrear.Company 		= candidato.Company;
                leadacrear.Title 		= candidato.Title;
                leadacrear.Phone 		= candidato.Phone;
                leadacrear.Description 	= candidato.Description;           
            try{
                insert leadacrear;
                responsews rs = new responsews();
                rs.SalesforceId = '';
                rs.EntidadComercial = leadacrear.Id; 
                rs.Estatus = 'Succes';
                rs.ErrorCode = '';
                rs.Message = 'Candidato ' + leadacrear.LastName +' Creado correctamente';
        		lstresponses.add(rs);   
            }catch(exception ex){
                responsews rs = new responsews();
                rs.SalesforceId = '';
                rs.EntidadComercial = null; 
                rs.Estatus = 'Error';
                rs.ErrorCode = 'Error al crear candidato';
                rs.Message = 'Se presentó el siguiente error al crear el candidato ' + ex;
        		lstresponses.add(rs);
            } 
            
        }
        
        return lstresponses;
    }
    
    @HttpGet
    global static list<lead> getLead()
    {
    	list<lead>  l = new list<lead>();
        l = [SELECT Id, FirstName,LastName,title,email,MobilePhone,Description,street,city,state,postalcode,country from Lead ];   
        return l;
    } 
    
    @HttpPatch
    global static responsews updateLeadFields() {
        responsews rs = new responsews();
        RestRequest request = RestContext.request;
        String leadId = request.requestURI.substring(
            request.requestURI.lastIndexOf('/')+1);
        Lead thislead = [SELECT Id FROM Lead WHERE Id = :leadId];
        // Deserialize the JSON string into name-value pairs
        Map<String, Object> params = (Map<String, Object>)JSON.deserializeUntyped(request.requestbody.tostring());
        // Iterate through each parameter field and value
        for(String fieldName : params.keySet()) {
            // Set the field and value on the Case sObject
            thislead.put(fieldName, params.get(fieldName));
        }
        
        try{
                update thislead;
                rs = new responsews();
                rs.SalesforceId = '';
                rs.EntidadComercial = thislead.Id; 
                rs.Estatus = 'Succes';
                rs.ErrorCode = '';
                rs.Message = 'Candidato ' + thislead.FirstName +' ' +thislead.LastName +' modificado correctamente';
            }catch(exception ex){
                rs = new responsews();
                rs.SalesforceId = '';
                rs.EntidadComercial = null; 
                rs.Estatus = 'Error';
                rs.ErrorCode = 'Error al modificar candidato';
                rs.Message = 'Se presentó el siguiente error al crear el candidato ' + ex;
            } 
        
        return rs;
    }
    /*
     * {
           "FirstName" : "Carlos",
           "Email" : "jperez@avanxo.com",
           "LastName" : "Perez",
           "Company" : "SERCAS ltda",
           "Id": "00Q4600000SC7o9EAD",
           "Status" : "Open - Not Contacted"
        }
    */
    @HttpPut
    global static ID upsertlead(String Title, String Status,
        String FirstName, String LastName, String Email, String Id, String Company) {
        lead thisLead = new lead(
            Id=id,
            Title=Title,
            Status=status,
            FirstName=FirstName,
            LastName=LastName,
            Email = Email,
            Company = Company);        
        upsert thisLead;
        return thisLead.Id;
    }
    
    
    public cls_leadSf leadsf;
   	global class cls_leadSf{
        public String Name;
        public String Status;
        public String Company;
        public String Title;
        public String Phone;
        public String Description; 
    }    
    
    public responsews response;
   	global class responsews {         
      public String SalesforceId;
  		public String EntidadComercial;
  		public String Estatus;
  		public String ErrorCode;
  		public String Message;
    }
}