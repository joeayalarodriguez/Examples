/*******************************************************************************
Desarrollado por:   
Autor:              Joe Ayala
Proyecto:           CAPACITACION
Descripción:        SERVICIO SOAP

Cambios (Versiones)
-------------------------------------
    No.     Fecha           Autor                   Descripción
    ---     ---             ----------              --------------------------      
    1.0		02-ABRIL-2019		Joe Ayala (JA) 			Creacion de clase 
****************************************************************************************************************/
global class SOAP_Servicev1_ws {
    
    global class responseWS{
      webservice String Idcliente; 
      webservice String NombreCliente;
      webservice String direccionCliente;  
    }
    
    global class responseclass{
      webservice String Idcliente; 
      webservice String message;
    }
    
    global class requestWS{
      webservice String nombre_cliente; 
      webservice String numero_Cliente;  
    }
    
 	webservice static list<responseWS> buscarCliente(requestWS request){
         requestWS requestWS =  request;  
         list<responseWS>lstresponse = new list<responseWS>();
         String respuesta;    
         list<Account> cuenta = [Select id,Name,ShippingAddress from Account where Name =: request.nombre_cliente];
         respuesta = String.Valueof(cuenta[0].ShippingAddress);  
         responseWS miresponse = new responseWS();   
         miresponse.direccionCliente = respuesta;
         miresponse.Idcliente = cuenta[0].Id;
         miresponse.NombreCliente = cuenta[0].Name;    
         lstresponse.add(miresponse);
         return lstresponse;
 	}
    
    webservice static list<responseclass> ActualizarCliente(requestWS request){
         requestWS requestWS =  request;  
         list<responseclass>lstresponseclass = new list<responseclass>();
         String respuesta;    
         list<Account> lstcuenta = [Select id,Active__c, Name,ShippingAddress from Account where Name =: request.nombre_cliente];
         for(Account cuenta: lstcuenta){
            cuenta.Active__c = 'false';   
           
         responseclass miresponsews = new responseclass();   
         miresponsews.Idcliente = cuenta.Id;
         miresponsews.message =  'Cuenta desactivda correctamente ' + cuenta.Name;    
         lstresponseclass.add(miresponsews);         
        }    
         return lstresponseclass;
 	}
    
	webservice static Id makeContact(String contactLastName, String Idcuenta) {
        Contact c = new Contact(lastName = contactLastName, AccountId = Idcuenta);
        insert c;
        return c.id;
    }
    
}