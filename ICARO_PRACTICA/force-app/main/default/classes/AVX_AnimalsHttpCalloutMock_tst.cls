/***************************************************************************************************************
* Avanxo 
* @author           Joe Ayala
* Proyecto:         Grupo RPP
* Descripción:      mock para emular la respuesta del servicio REST de animales
* Cambios (Versión)
* -------------------------------------------
*            No.      Fecha               Autor                           Descripción
*           -----   ----------      ---------------------               ---------------
* @versión   1.0    04/04/2018      Joe Ayala (JA)                  Creación de la clase
****************************************************************************************************************/
@isTest
global class AVX_AnimalsHttpCalloutMock_tst implements HttpCalloutMock {

    // Implement this interface method
    global HTTPResponse respond(HTTPRequest request) {
        // Create a fake response
        HttpResponse response = new HttpResponse();
        response.setHeader('Content-Type', 'application/json');
        response.setBody('{"animals": ["majestic badger", "fluffy bunny", "scary bear", "chicken", "mighty moose"]}');
        response.setStatusCode(201);
        return response; 
    }
}