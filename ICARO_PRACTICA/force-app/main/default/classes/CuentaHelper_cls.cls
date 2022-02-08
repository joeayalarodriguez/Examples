/******************************************************************************************************************
 * Autor		Joe Ayala
 * Proyecto		CAPACITACION UAO
 * Decripción	gestiona la lógica de la cuenta	
 * ______________________________________________________
 * Version 	1.0		20-03-2019		Joe Ayala	Creación de la clase
 * Version 	1.1		20-03-2019		Joe Ayala	modifica el método xxxx
*******************************************************************************************************************/
public class CuentaHelper_cls {
    public static set<String> validaCuenta(list<Account> lstAccount){
        set<String> setAccountError = new set<String>();
		String llaveidentificacion = '';      
        map<String, Account> mapAccount = new map<String, Account>(); 
        list<Account> lstAccountconsulta = new list<Account>();
        
        for(Account ac: lstAccount){
            if(ac.Numero_de_documento__c <> null && ac.Tipo_de_Identificacion__c <> null){
                llaveidentificacion = ac.Numero_de_documento__c + ac.Tipo_de_Identificacion__c;
                mapAccount.put(llaveidentificacion, ac);                
            }
        }
        
        lstAccountconsulta = [SELECT Id,Numero_de_documento__c,Tipo_de_Identificacion__c FROM Account];
        system.debug('lista_de_cuentas ' + lstAccountconsulta);
        set<Account>setw = new set<Account>();
        for(Account cuentasExistentes: lstAccountconsulta){
            llaveidentificacion = cuentasExistentes.Numero_de_documento__c + cuentasExistentes.Tipo_de_Identificacion__c;
            system.debug(' llaveidentificacion_de_cuenta_actual  ' + llaveidentificacion);
            if(mapAccount.containsKey(llaveidentificacion)){
                if(cuentasExistentes.Id <> null){
                    if(cuentasExistentes.Id <> mapAccount.get(llaveidentificacion).Id){
                        setAccountError.add(llaveidentificacion);
                    }  
                }
               
            }
        }
        return setAccountError;
    }
}