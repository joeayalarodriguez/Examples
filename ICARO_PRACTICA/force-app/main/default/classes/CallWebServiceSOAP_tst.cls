/********************************************************************************************************************
 * 
*********************************************************************************************************************/
@isTest
public class CallWebServiceSOAP_tst {
    @isTest
    static void testCalloutsuma(){   
        Test.setMock(WebserviceMock.class, new CallWebServiceSOAPMock_tst());
        Decimal x = 1.0;
        Decimal y = 2.0;
        String stroperacion = 'suma';
        Double result = CallWebServiceSOAP_ws.calculadora(x, y, stroperacion);
    }
    
    @isTest 
    static void testCalloutmultiplicacion(){
        Test.setMock(WebserviceMock.class, new CallWebServiceSOAPMock_tst());
        Decimal x = 1.0;
        Decimal y = 2.0;
        String stroperacion = 'multiplicacion';
        Double result = CallWebServiceSOAP_ws.calculadora(x, y, stroperacion);
    }
    
    @isTest 
    static void testCalloutdivision(){
        Test.setMock(WebserviceMock.class, new CallWebServiceSOAPMock_tst());
        Decimal x = 1.0;
        Decimal y = 2.0;
        String stroperacion = 'division';
        Double result = CallWebServiceSOAP_ws.calculadora(x, y, stroperacion);
    }
    
     @isTest 
    static void testCalloutresta(){
        Test.setMock(WebserviceMock.class, new CallWebServiceSOAPMock_tst());
        Decimal x = 1.0;
        Decimal y = 2.0;
        String stroperacion = 'resta';
        Double result = CallWebServiceSOAP_ws.calculadora(x, y, stroperacion);
    }
}