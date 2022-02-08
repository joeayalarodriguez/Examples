/***************************************************************************************************************
* Avanxo 
* @author           Joe Ayala
* Proyecto:         CAPACITACION
* Descripción:      Test Servicio SOAP
* -------------------------------------------
*            No.      Fecha               Autor                           Descripción
*           -----   ----------      ---------------------               ---------------
* @versión   1.0    29/03/2019      Joe Ayala (JA)                  Creación de la clase
****************************************************************************************************************/
@isTest
private class calculatorServicesSoap_test {
    @isTest static void testCallout() {              
        // This causes a fake response to be generated
        Test.setMock(WebServiceMock.class, new AVX_CallWebServiceSOAPMock_tst());
        // Call the method that invokes a callout
        Decimal x = 1.0;
        Decimal y = 2.0;
        Double result = AVX_CallWebSErviceSOAP_ws.Calculadora(x, y);
        // Verify that a fake result is returned
        System.assertEquals(3.0, result); 
    }
}