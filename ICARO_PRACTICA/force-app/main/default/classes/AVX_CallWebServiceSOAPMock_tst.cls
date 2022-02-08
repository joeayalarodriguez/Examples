@isTest
global class AVX_CallWebServiceSOAPMock_tst implements WebServiceMock {
   global void doInvoke(
           Object stub,
           Object request,
           Map<String, Object> response,
           String endpoint,
           String soapAction,
           String requestName,
           String responseNS,
           String responseName,
           String responseType) {
           
        
        calculatorServicesSoap_ws.doAddResponse response_x = new calculatorServicesSoap_ws.doAddResponse();
        response_x.return_x = 3.0;
        // end
        response.put('response_x', response_x); 
   }
}