/*********************************************************************************************************************************************************************
  * Autor		Joe Ayala
 * Proyecto		CAPACITACION UAO
 * Decripción	Crea todo tipo de objetos en la instancia
 * ______________________________________________________
 * Version 	1.0		20-03-2019		Joe Ayala	Creación de la clase
 ********************************************************************************************************************************************************************/
@istest
public class TestDataFactoryObjects_tst {
		
    //Método para la creacion de una cuenta
    public static Account crearcuenta(boolean blnisInsert){
        Account objAccount 	= new Account();
        objAccount.Name		= 'Cuenta de Pruebas';
        objAccount.AccountNumber	= '123456';
        
        if(blnisInsert){
            insert objAccount;
        }
        return objAccount;
    }
    
    //Método para la creación de Oportunidades
    public static Opportunity crearOportunidad(boolean blnIsInsert, Id cuentaId){
        Opportunity objoportunidad = new Opportunity();
        objoportunidad.CloseDate = date.today()+30;
        objoportunidad.Name = 'Oportunidad de prueba ';
        objoportunidad.StageName = 'Prospecting';
        objoportunidad.AccountId = cuentaId;
        
        if(blnisInsert){
            insert objoportunidad;
        }        
        
        return objoportunidad;
    }
    
    public static list<Account> crearCuentaOportunidad(Integer numAccount, Integer nomOpp){
        list<Account> lstacc = new list<Account>();
        for(Integer i=0;i<numAccount;i++){
            Account a = new Account(Name='Cuenta masiva ' + i);
            lstacc.add(a);
        }
        insert lstacc;
        
        list<Opportunity>lstopp = new list<Opportunity>();
        for(Integer j=0;j<numAccount;j++){
            Account acct = lstacc[j];
            for(Integer k=0;k<nomOpp;k++){
                lstopp.add(new Opportunity(Name = acct.Name+ ' Oportunidad ' + k,
                                          StageName = 'Prospecting',
										  CloseDate = date.today()+30,
                                          AccountId = acct.Id
                                          ));
            }
        }
        system.debug('lista de cuentas ' + lstacc );
        system.debug('lista de oportunidades ' + lstopp );
        insert lstopp;        
        return lstacc;
    }
    
    
    
}