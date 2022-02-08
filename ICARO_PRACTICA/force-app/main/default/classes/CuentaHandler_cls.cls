/******************************************************************************************************************
 * Autor		Joe Ayala
 * Proyecto		CAPACITACION UAO
 * Decripción	Administra los eventos de la cuenta	 
 * ______________________________________________________
 * Version 	1.0		20-03-2019		Joe Ayala	Creación de la clase
 * Version 	1.1		20-03-2019		Joe Ayala	modifica el método xxxx
*******************************************************************************************************************/
public class CuentaHandler_cls {
    public static void beforeUpdate(list<Account> lstAccount){
        set<String>setAccount = new set<String>();
        setAccount = CuentaHelper_cls.validaCuenta(lstAccount);
        String llave = '';
        for(Account acc: lstAccount){
            llave = acc.Numero_de_documento__c + acc.Tipo_de_Identificacion__c;
            if(setAccount.contains(llave)){
                acc.Numero_de_documento__c.adderror('La cuenta con tipo de identificación ' + acc.Tipo_de_Identificacion__c + ' y numero de documento ' + acc.Numero_de_documento__c + ' ya existe.');
                
            }
        }
    }
    
   
}