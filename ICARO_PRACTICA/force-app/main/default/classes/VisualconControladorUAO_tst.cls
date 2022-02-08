/*********************************************************************************************************************************************************************
  * Autor		Joe Ayala
 * Proyecto		CAPACITACION UAO
 * Decripción	clase de prueba visualforce
 * ______________________________________________________
 * Version 	1.0		20-03-2019		Joe Ayala	Creación de la clase
 ********************************************************************************************************************************************************************/
@isTest
public class VisualconControladorUAO_tst {
    
    @isTest static void testControllerSucces(){
        Account objCuenta = TestDataFactoryObjects_tst.crearcuenta(true);
        Opportunity objOportunidad = TestDataFactoryObjects_tst.crearOportunidad(true, objCuenta.Id);
        
        Test.startTest();
        	PageReference pageRef = Page.VisualconControlador;
        	Test.setCurrentPage(pageRef);
            ApexPages.StandardController controller = new ApexPages.StandardController(objOportunidad);
            VisualconControlador_ctr ctr = new VisualconControlador_ctr(controller);
            ctr.strOportunidadEntrante = objOportunidad.Id;        
            ctr.cargarOportunidad();
        Test.stopTest();
    }
    
    @isTest static void testControllerFail(){        
        Opportunity objOportunidad = new Opportunity();
        
        Test.startTest();
        	PageReference pageRef = Page.VisualconControlador;
        	Test.setCurrentPage(pageRef);
            ApexPages.StandardController controller = new ApexPages.StandardController(objOportunidad);
            VisualconControlador_ctr ctr = new VisualconControlador_ctr(controller);
            ctr.strOportunidadEntrante = '1';  
            try{
                ctr.cargarOportunidad();
            }catch(DmlException e){
                System.assert(e.getMessage().contains('El sistema no encontró oportunidades con el identificador'));
            }
            
        Test.stopTest();
    }
    
    

}