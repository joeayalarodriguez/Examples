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
global class AVX_SOAPExposeServiceWeb_ws {
    
    webservice static list<responsews> buscarClientes(requestws requestsf){
		requestws requestsalesforce = requestsf;
        list<responsews>lstresponse = new list<responsews>();
        list<Account> cuentas = [SELECT Id, Name, Active__c FROM Account where Id =: requestsalesforce.stridCliente];
        cuentas[0].Name = 'CUENTA ACTUALIZADA DESDE SOAP';
        update cuentas;
        
        responsews rs = new responsews();
        rs.nombrecliente = cuentas[0].Name;
        rs.Estado 		 = 'SUCCES';
        rs.Descripcion   = 'Se actualizó la cuenta ' + cuentas[0].Name;
        lstresponse.add(rs);
        return lstresponse;
    }
    
    global class responsews{
        webservice String nombrecliente;
        webservice String Estado;
        webservice String Descripcion;
    }
    
    global class requestws{
        webservice String stridCliente;            
    }
    
}