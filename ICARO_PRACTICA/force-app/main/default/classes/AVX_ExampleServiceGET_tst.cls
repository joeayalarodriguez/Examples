@isTest
global class AVX_ExampleServiceGET_tst {
	
    @isTest static void testGetCallout(){
        Test.setMock(HttpCalloutMock.class, new ServicioanimalesHttpcalloutMock_tst());
        HttpResponse response = AVX_ExampleServiceGET_ws.serviceAnimals();
        String contentType = response.getHeader('Content-Type');
        System.assert(contentType == 'application/json');
        String actualValue = response.getBody();
        system.debug('Respuesta servicio test ' + actualValue);
        String expectedValue = '{"animals":["majestic badger","fluffy bunny","scary bear","chicken"]}';
        System.assertEquals(actualValue, expectedValue);
        system.assertEquals(200, response.getStatusCode());
    }
    
     @isTest static void testGetCalloutfail(){
        Test.setMock(HttpCalloutMock.class, new ServicioanimalesHttpcalloutMock_fail());
        HttpResponse response = AVX_ExampleServiceGET_ws.serviceAnimals();
        String contentType = response.getHeader('Content-Type');
        System.assert(contentType == 'application/json');
        String actualValue = response.getBody();
        system.debug('Respuesta servicio test ' + actualValue);
        String expectedValue = '{"animals":["majestic badger","fluffy bunny","scary bear","chicken"]}';
        System.assertEquals(actualValue, expectedValue);
        system.assertEquals(500, response.getStatusCode());
    }
    
    
    global class ServicioanimalesHttpcalloutMock_tst implements HttpCalloutMock{
        global HTTPResponse respond(HTTPRequest request){
            HttpResponse response = new HttpResponse();
            response.setHeader('Content-Type', 'application/json');
            response.setBody('{"animals":["majestic badger","fluffy bunny","scary bear","chicken"]}');
            response.setStatusCode(200);
            return response;
        }  
    }
    
    global class ServicioanimalesHttpcalloutMock_fail implements HttpCalloutMock{
        global HTTPResponse respond(HTTPRequest request){
            HttpResponse response = new HttpResponse();
            response.setHeader('Content-Type', 'application/json');
            response.setBody('{"animals":["majestic badger","fluffy bunny","scary bear","chicken"]}');
            response.setStatusCode(500);
            return response;
        }  
    }
    
    
    
    
}