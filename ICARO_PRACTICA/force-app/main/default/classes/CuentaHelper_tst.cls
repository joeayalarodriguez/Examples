/******************************************************************************************************************
 * Autor		Joe Ayala
 * Proyecto		CAPACITACION UAO
 * Decripción	clase test de cuenta	
 * ______________________________________________________
 * Version 	1.0		20-03-2019		Joe Ayala	Creación de la clase
*******************************************************************************************************************/
@isTest
public class CuentaHelper_tst {
    
    @isTest static void identificacionCuentaSucces(){
        Account objcuenta = TestDataFactoryObjects_tst.crearcuenta(true);
        
        Test.startTest(); //limits
        	objcuenta.Numero_de_documento__c = '123456';
            objcuenta.Tipo_de_Identificacion__c = 'CC';
            update objcuenta;
       Test.stopTest();    
    }
    
    @isTest static void identificacioncuentaError(){
        Account objcuenta1 = TestDataFactoryObjects_tst.crearcuenta(true);
        Account objcuenta2 = TestDataFactoryObjects_tst.crearcuenta(true);        
        Test.startTest();
        	objcuenta1.Numero_de_documento__c = '123456';
            objcuenta1.Tipo_de_Identificacion__c = 'CC';
            update objcuenta1;        
            objcuenta2.Numero_de_documento__c = '123456';
            objcuenta2.Tipo_de_Identificacion__c = 'CC';            
        try{
             update objcuenta2;
        }catch(DmlException ex){
            system.debug('esta_es_mi_excepción ' + ex);
            system.assert(ex.getMessage().contains('La cuenta con tipo de identificación'));
            system.assertEquals('FIELD_CUSTOM_VALIDATION_EXCEPTION', ex.getDmlStatusCode(0));
        }         
         
        Test.stopTest();    
    }
}