/***************************************************************************************************************
* Avanxo 
* @author           Joe Ayala
* Proyecto:         Ejemplo triggers
* Descripción:      Gestiona toda la lógica de la entidad cuentas
                                 
* Cambios (Versión)
* -------------------------------------------
*            No.      Fecha               Autor                           Descripción
*           -----   ----------      ---------------------               ---------------
* @versión   1.0    19/03/2019      Joe Ayala (JA)                  Creación de la clase
****************************************************************************************************************/
public class AccountValidationClass_cls{
    public static set<String> validateAccount(list<Account> lstaccount)
    {
        set<String> setaccounterror = new set<String>();  
        String llaveidentificacion = '';
        map<string,Account> mapaccount = new map<string,Account>();
        
        for(Account ac: lstaccount){
            if(ac.Numero_de_documento__c <> null && ac.Tipo_de_Identificacion__c <> null){
                llaveidentificacion = ac.Numero_de_documento__c + ac.Tipo_de_Identificacion__c;
                mapaccount.put(llaveidentificacion, ac);
            }            
        }
        
        list<Account> lstaccountconsulta = [SELECT Id,Numero_de_documento__c,Tipo_de_Identificacion__c FROM Account];
        system.debug('entre_a_mi_metodo  ' + lstaccountconsulta);
        for(Account aco: lstaccountconsulta){
            String llave = aco.Numero_de_documento__c + aco.Tipo_de_Identificacion__c;
            if (mapaccount.containskey(llave) ){
                if(aco.Id <> null){                    
                    system.debug('idaccount ' + mapaccount);
                    if(aco.Id <> mapaccount.get(llave).Id){
                        setaccounterror.add(llave);
                    }                      
                }else{
                   setaccounterror.add(llave);  
                }
                              
            }             
        }
       return setaccounterror;
    }

}