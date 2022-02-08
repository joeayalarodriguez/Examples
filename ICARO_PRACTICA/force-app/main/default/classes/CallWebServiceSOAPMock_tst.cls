@isTest
global class CallWebServiceSOAPMock_tst implements webservicemock {
    global void doInvoke(
    		Object stub,
        	Object request,
        	Map<String, Object> response,
        	String endpoint,
        	String soapAction,
        	String requestName,
            String responseNS,
            String responseName,
            String responseType
    	)
    {
        calculatorServicesSoap_ws.doAddResponse response_x = new calculatorServicesSoap_ws.doAddResponse();
        response_x.return_x = 3.0;
        response.put('response_x', response_x);
        
        calculatorServicesSoap_ws.doDivideResponse response_xd = new calculatorServicesSoap_ws.doDivideResponse();
        response_xd.return_x = 3.0;
        response.put('response_x', response_xd);
        
        calculatorServicesSoap_ws.doMultiplyResponse response_xm = new calculatorServicesSoap_ws.doMultiplyResponse();
        response_xm.return_x = 3.0;
        response.put('response_x', response_xm);
        
        calculatorServicesSoap_ws.doSubtractResponse response_xs = new calculatorServicesSoap_ws.doSubtractResponse();
        response_xs.return_x = 3.0;
        response.put('response_x', response_xs);
    }
}