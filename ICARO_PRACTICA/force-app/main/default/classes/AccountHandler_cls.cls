/***************************************************************************************************************
* Avanxo 
* @author           Joe Ayala
* Proyecto:         CAPACITACIÓN
* Descripción:      Administra los eventos del objeto CUENTA
* Cambios (Version)
* -------------------------------------------
*            No.      Fecha               Autor                           Descripción
*           -----   ----------      ---------------------               ---------------
* @version   1.0    19/03/2019      Joe Ayala                           Creación de la clase
****************************************************************************************************************/
public class AccountHandler_cls {
     /* 
    * Nombre: BeforeInsert
    * Descripcion: Metodo encargado de validar y redireccionar los eventos que se deben gestionar en el before insert
    * Fecha Creación: 19/03/2019
    * Cambios de Version del Metodo:
    * --------------------------------------------------------------------------------------------------------------
    * Version        Fecha                   Autor                        Descripción
    * ---------     ------------     ----------------------      -----------------------------
    *   1            19-Mar-2019     Joe Ayala Rodriguez              Creacion del metodo.
    * --------------------------------------------------------------------------------------------------------------
    */
    public static void BeforeUpdate(list <Account> lstAccount)
    {
        set<String> setaccountvalidate = new set<String>();
        setaccountvalidate = AccountValidationClass_cls.validateAccount(lstAccount);
        
        for(Account acc: lstAccount){
            String llave = acc.Numero_de_documento__c + acc.Tipo_de_Identificacion__c;
            if(setaccountvalidate.contains(llave)){
                acc.Numero_de_documento__c.adderror('la cuenta con Tipo de identificación ' + acc.Tipo_de_Identificacion__c  + ' y ' + acc.Numero_de_documento__c  + ' ya existe');
            }              
        }
    }
    
     /* 
    * Nombre: BeforeDelete
    * Descripcion: Metodo que impide le borrado de cuentas con oportunidades
    * Fecha Creación: 19/03/2019
    * Cambios de Version del Metodo:
    * --------------------------------------------------------------------------------------------------------------
    * Version        Fecha                   Autor                        Descripción
    * ---------     ------------     ----------------------      -----------------------------
    *   1            19-Mar-2019     Joe Ayala Rodriguez              Creacion del metodo.
    * --------------------------------------------------------------------------------------------------------------
    */
    public static void BeforeDelete(list <Account> lstAccountold, map<Id,Account> oldmap)
    {
	   for (Account a : [SELECT Id FROM Account
                     	 WHERE Id IN (SELECT AccountId FROM Opportunity) AND Id IN :lstAccountold]) 
       {
        	oldmap.get(a.Id).addError(
            'No se permite el borrado de cuentas con oportunidades');
       }   	 
    }

}