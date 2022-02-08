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

{
  "candidatos":
   {
	 "Name" : "Carolina Gomez",
     "Status" : "Working - Contacted",
     "Company" : "Caracol",
     "Title" : "Actriz",
     "Phone" : "(850) 644-4200",
     "Description" : "Carolina Gomez",
   }
}

***************************************************************************************************************/
@RestResource(urlMapping='/Managementlead2/*')
global with sharing class AVX_Management_leads2_ws {
    //obtiene información de salesforce 
    //asi se consume el servicio desde workbench services/apexrest/Managementlead2
    @HttpGet
    global static list<lead>getlead(){
        list<lead> lisleads = new list<lead>();
        lisleads = [SELECT Company,Country,Email,Id,Name,Phone FROM Lead];
        return lisleads;        
    }
    
    @HttpPost
    global static list<responsews> dopost(cls_leadsf candidatos){
        list<responsews> lstresponses = new list<responsews>(); 
        lead leadacrear;
        RestRequest request = RestContext.request;
        RestResponse response = RestContext.response;
        response.addHeader('Content-Type', 'application/json');
        responsews responsews = new responsews();
        if(candidatos <> null){
            leadacrear		= new lead();
            leadacrear.LastName 	= candidatos.Name;
            leadacrear.Status 		= candidatos.Status;
            leadacrear.Company 		= candidatos.Company;
            leadacrear.Title 		= candidatos.Title;
            leadacrear.Phone 		= candidatos.Phone;
            leadacrear.Description 	= candidatos.Description;
        }
        try{
         insert leadacrear;
          	responsews rs = new responsews();
            rs.SalesforceId = leadacrear.Id;
            rs.Entidadcomercial = 'Lead';
            rs.Errorcode = '';        
            rs.Message = 'Candidato creado correctamente';
            lstresponses.add(rs);  
        }catch(exception ex){
            responsews rs = new responsews();
            rs.SalesforceId = '';
            rs.Entidadcomercial = 'Lead';
            rs.Errorcode = 'Error de creación';        
            rs.Message = 'Se presento un error al crear candidato ' + ex;
            lstresponses.add(rs);
        }
        
        return lstresponses;
    }
    
    
    @HttpDelete
    global static list<responsews> deleteleads(){
        list<responsews> lstresponses = new list<responsews>();
        RestRequest request =RestContext.request;
        RestResponse response = RestContext.response;
        String leadId = request.requestURI.substring(request.requestURI.lastIndexof('/')+1);
        system.debug('este es el id que deseo borrar ' + leadId);
        lead leadaborrar = [Select Id FROM lead WHERE Id =:leadId];
        delete leadaborrar;
        
        responsews rs = new responsews();
        rs.SalesforceId = leadaborrar.Id;
        rs.Entidadcomercial = 'Lead';
        rs.Errorcode = '';        
        rs.Message = 'Candidato borrado correctamente';
        lstresponses.add(rs);
        return lstresponses;
    }
    
    global class cls_leadsf{
        public String Name;
        public String Status;
        public String Company;
        public String Title;
        public String Phone;
        public String Description;
    }
    
    
    public responsews response;
    global class responsews{
        public String SalesforceId;
        public String EntidadComercial;
        public String Estatus;
        public String ErrorCode;
        public String Message;
    }
    
    
    
}