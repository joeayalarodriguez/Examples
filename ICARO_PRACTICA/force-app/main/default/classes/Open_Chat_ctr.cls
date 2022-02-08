/**************************************************************************************************************
Desarrollado por:   
Autor:              Joe Ayala
Proyecto:           Salesforce Arg
Descripción:        Clase controladora para visualforce que abre mashup  desde salesforce 

Cambios (Versiones)
-------------------------------------
    No.     Fecha           Autor                   Descripción
    ---     ---             ----------              --------------------------      

****************************************************************************************************************/
public class Open_Chat_ctr {
    
    public String Idoportunidad {get;set;}
    public string url {get;set;}
    
    public Open_Chat_ctr() 
    {
        system.debug('parametro_recibido ' +  Apexpages.currentPage().getParameters().get('parent_id'));
        Idoportunidad = Apexpages.currentPage().getParameters().get('parent_id');
        
           if(Idoportunidad <> null && Idoportunidad <> '') 
            {
                url = '';
                list<Opportunity> lstOpportunity = [SELECT Id ,Name,Account.Name,StageName,Amount FROM Opportunity where id =: Idoportunidad]; 
            	
                                
                url = 'https://www.google.com/?'+'Oportunidad='+lstOpportunity[0].Name; 
                system.debug('redirecciona_a_la_url ' + url);
             } 
        
    }
    
    public Pagereference retornar() 
    { 
       String url= '/' + Idoportunidad;
        PageReference pageRef = new PageReference(url); 
        pageRef.setRedirect( true ); 
        return pageRef;
    }
    
   
}