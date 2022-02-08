/***************************************************************************************************************
* Avanxo 
* @author           Joe Ayala
* Proyecto:         CAPACITACIÓNPP
* Descripción:      Clase de prueba para RPP_CuentaHelper_cls
* Cambios (Versión)
* -------------------------------------------
*            No.      Fecha               Autor                           Descripción
*           -----   ----------      ---------------------               ---------------
* Version 	1.0		20-03-2019		Joe Ayala							Creación de la clase
****************************************************************************************************************/
@istest
private  class CuentaHelper_cls_tst
{
	@istest static void identificacionCuentasucces()
	{
		Account objCuenta = TestDataFactory_tst.crearAccount(true);
        Account objCuenta2 = TestDataFactory_tst.crearAccount(true);
		
		Test.startTest();
			objCuenta.Numero_de_documento__c = '123';
            objCuenta.Tipo_de_Identificacion__c = 'CC';
            update objCuenta;
		Test.stopTest();
	}
    
    @istest static void identificacionCuentaerror()
	{
		Account objCuenta = TestDataFactory_tst.crearAccount(true);
        Account objCuenta2 = TestDataFactory_tst.crearAccount(true);
		
		Test.startTest();
			objCuenta.Numero_de_documento__c = '123';
            objCuenta.Tipo_de_Identificacion__c = 'CC';
            update objCuenta;
        
            objCuenta2.Numero_de_documento__c = '123';
            objCuenta2.Tipo_de_Identificacion__c = 'CC';
            
        
           try {
            update objCuenta2;
        	  } catch (DmlException e) {
                System.assert( e.getMessage().contains('La cuenta con tipo de identificación '));               
                //Assert Status Code
                System.assertEquals('FIELD_CUSTOM_VALIDATION_EXCEPTION' , 
                                     e.getDmlStatusCode(0) );
            }
		Test.stopTest();
	}
}