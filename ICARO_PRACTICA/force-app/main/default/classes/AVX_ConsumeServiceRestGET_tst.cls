@isTest
public class AVX_ConsumeServiceRestGET_tst {
    
    @isTest static void testGetCallout() {
        // Set mock callout class 
        Test.setMock(HttpCalloutMock.class, new AVX_AnimalsHttpCalloutMock_tst()); 
        // This causes a fake response to be sent
        // from the class that implements HttpCalloutMock. 
        //HttpResponse response = AVX_ConsumeServiceRestGET_ws.ServiceAnimals();
        HttpResponse response = AVX_ExampleServiceGET_ws.ServiceAnimals();
        // Verify that the response received contains fake values
        String contentType = response.getHeader('Content-Type');
        System.assert(contentType == 'application/json');
        String actualValue = response.getBody();
        System.debug(response.getBody());
        String expectedValue = '{"animals": ["majestic badger", "fluffy bunny", "scary bear", "chicken", "mighty moose"]}';
        System.assertEquals(actualValue, expectedValue);
        System.assertEquals(201, response.getStatusCode());
    }
    
    @isTest static void testPostCallout() {
        // Set mock callout class 
        Test.setMock(HttpCalloutMock.class, new AVX_AnimalsHttpCalloutMock_tst()); 
        // This causes a fake response to be sent
        // from the class that implements HttpCalloutMock. 
        HttpResponse response = AVX_ConsumeServiceRestPOST_ws.ServiceAnimalsPOST();
        // Verify that the response received contains fake values
        String contentType = response.getHeader('Content-Type');
        System.assert(contentType == 'application/json');
        String actualValue = response.getBody();
        System.debug(response.getBody());
        String expectedValue = '{"animals": ["majestic badger", "fluffy bunny", "scary bear", "chicken", "mighty moose"]}';
        System.assertEquals(actualValue, expectedValue);
        System.assertEquals(201, response.getStatusCode()); 
    }
    
}