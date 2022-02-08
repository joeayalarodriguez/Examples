/*******************************************************************************
Desarrollado por:   
Autor:              Joe Ayala
Proyecto:           CAPACITACION
Descripción:        SERVICIO SOAP

Cambios (Versiones)
-------------------------------------
    No.     Fecha           Autor                   Descripción
    ---     ---             ----------              --------------------------      
    1.0     02-ABRIL-2019       Joe Ayala (JA)          Creacion de clase 
****************************************************************************************************************/
global class SOAPExposemi_servicioweb_ws{
    
    global class responseWS{
      webservice String direccionCliente;  
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
         lstresponse.add(miresponse);
         return lstresponse;
    }
    
    webservice static Id makeContact(String contactLastName, Account a) {
        Contact c = new Contact(lastName = contactLastName, AccountId = a.Id);
        insert c;
        return c.id;
    }
    
}