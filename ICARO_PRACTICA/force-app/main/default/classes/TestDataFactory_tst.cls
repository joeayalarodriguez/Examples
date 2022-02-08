/***************************************************************************************************************
* Avanxo 
* @author           Joe Ayala
* Proyecto:         Grupo RPP
* Descripción:      Clase para generar registros que serán utilizados en las clases de prueba.
* Cambios (Versión)
* -------------------------------------------
*            No.      Fecha               Autor                           Descripción
*           -----   ----------      ---------------------               ---------------
* @versión   1.0    04/04/2018      Joe Ayala (JA)                  Creación de la clase
****************************************************************************************************************/
public class TestDataFactory_tst {

    //Metodo que Crea una Cuenta
    public static Account crearAccount(boolean hacerInsert)
    {
        Account objAccount = new Account ();
        objAccount.Name='AVX_cuentaPrueba ';
        objAccount.AccountNumber = '123';        
        if(hacerInsert)
        insert objAccount;
        
        return objAccount;
    }
    
    //Metodo que Crea una Oportunidad
    public static Opportunity crearOpportunity(boolean hacerInsert, Id cuentaId)
    {
        date fecha = date.today()+30;
        Opportunity objOpportunity = new Opportunity ();
        objOpportunity.Name='AVX_oportunidadPrueba ';       
        objOpportunity.AccountId=cuentaId; 
        objOpportunity.CloseDate=fecha;   
        objOpportunity.StageName='Prospección';         

        if(hacerInsert)
        insert objOpportunity;
        
        return objOpportunity;
    }
    
    public static List<Account> createAccountsWithOpps(Integer numAccts, Integer numOppsPerAcct) {
        List<Account> accts = new List<Account>();        
        for(Integer i=0;i<numAccts;i++) {
            Account a = new Account(Name='TestAccount' + i);
            accts.add(a);
        }
        insert accts;
        
        List<Opportunity> opps = new List<Opportunity>();
        for (Integer j=0;j<numAccts;j++) {
            Account acct = accts[j];
            // For each account just inserted, add opportunities
            for (Integer k=0;k<numOppsPerAcct;k++) {
                opps.add(new Opportunity(Name=acct.Name + ' Opportunity ' + k,
                                       StageName='Prospecting',
                                       CloseDate=System.today().addMonths(1),
                                       AccountId=acct.Id));
            }
        }
        // Insert all opportunities for all accounts.
        insert opps;        
        return accts;
    }
}