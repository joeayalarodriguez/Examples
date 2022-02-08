/*******************************************************************************
Desarrollado por:   
Autor:              Joe Ayala
Proyecto:           RTD Argentina
Descripción:        Clase trialhead

Cambios (Versiones)
-------------------------------------
    No.     Fecha           Autor                   Descripción
    ---     ---             ----------              --------------------------      
    1.0		11-ago-2017		Joe Ayala (JA) 			Creacion de clase 
****************************************************************************************************************/
@RestResource(urlMapping='/Accounts/*/contacts')
global class AccountManager {
    @HttpGet
    global static Account getAccount() {
        RestRequest req = RestContext.request;
        String accId = req.requestURI.substringBetween('Accounts/', '/contacts');
        Account acc = [SELECT Id, Name, (SELECT Id, Name FROM Contacts) 
                       FROM Account WHERE Id = :accId];
        return acc;
    }
}