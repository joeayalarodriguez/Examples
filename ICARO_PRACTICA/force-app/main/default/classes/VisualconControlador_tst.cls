@isTest
public class VisualconControlador_tst {
  
    @istest static void testcontrollersucces()
	{
		Account objCuenta = TestDataFactory_tst.crearAccount(true);
        Opportunity objoportunidad = TestDataFactory_tst.crearOpportunity(true, objCuenta.Id);
        system.debug('oportunidad_cargadada ' + objoportunidad);
		
		Test.startTest();
			PageReference pageRef = Page.VisualconControlador;
            Test.setCurrentPage(pageRef); 
            ApexPages.standardController controller = new ApexPages.standardController(objoportunidad);
            VisualconControlador_ctr ctr = new VisualconControlador_ctr(controller);
            //ApexPages.currentPage().getParameters().put('strOportunidadEntrante',objoportunidad.Id);
            ctr.strOportunidadEntrante = objoportunidad.Id; 
            ctr.cargarOportunidad(); 
		Test.stopTest();
	}
    
    @istest static void testcontrollererror()
	{
		Account objCuenta = TestDataFactory_tst.crearAccount(true);
        Opportunity objoportunidad = TestDataFactory_tst.crearOpportunity(true, objCuenta.Id);        
		
		Test.startTest();
			PageReference pageRef = Page.VisualconControlador;
            Test.setCurrentPage(pageRef); 
            ApexPages.standardController controller = new ApexPages.standardController(objoportunidad);
            VisualconControlador_ctr ctr = new VisualconControlador_ctr(controller);
            
            try {
                 ctr.cargarOportunidad(); 
        	  } catch (DmlException e) {
                System.assert( e.getMessage().contains('El sistema no encontró oportunidades con el identificador '));               
                //Assert Status Code
                System.assertEquals('FIELD_CUSTOM_VALIDATION_EXCEPTION' , 
                                     e.getDmlStatusCode(0) );
            }             
		Test.stopTest();
	}
}