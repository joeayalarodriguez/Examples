/***************************************************************************************************************
* Avanxo 
* @author           Joe Ayala
* Proyecto:         CAPACITACION
* Descripción:      Servicio REST POST
* -------------------------------------------
*            No.      Fecha               Autor                           Descripción
*           -----   ----------      ---------------------               ---------------
* @versión   1.0    29/03/2019      Joe Ayala (JA)                  Creación de la clase
****************************************************************************************************************/
public class AVX_ConsumeServiceRestPOST_ws {
    
    public static HttpResponse ServiceAnimalsPOST()
    {
        //1 - Busqueda de metadata del sw
        Web_Service_Control__mdt wsSettings = [SELECT label, Activo__c, Endpoint__c, Email_Responsable__c
                                                   FROM Web_Service_Control__mdt 
                                                   WHERE label = 'ServiceAnimals'];
        System.debug('Parametros del servicio ' + wsSettings);
        String jsonOrders = '';
        String endpoint = 'https://';
        String sessionid = 'no generado';
        if(wsSettings <> null){
            endpoint = wsSettings.Endpoint__c;
            //2 - construcción de json
            JSONGenerator gen = JSON.createGenerator(true);
                gen.writeStartObject();
                    gen.writeStringField('name', 'joe');
                gen.writeEndObject();
            
            jsonOrders = gen.getAsString();
        }        
        System.debug('jsonGenerado----> ' +jsonOrders); 

        //3 - construcción del request
        Http httpProtocol = new Http();
        HttpRequest request = new HttpRequest();              
        request.setHeader('Content-Type', 'application/json;charset=UTF-8');        
        request.setEndPoint(endpoint);
        request.setMethod('POST'); 
        request.setBody(jsonOrders);
        //request.setBody('{"name":"mighty moose"}'); //puede inlcuir directamente el json
        
        //4 - Invocar el servicio web
        HttpResponse response = httpProtocol.send(request);
        String RespuestaSw = response.getBody();
        System.debug('\n\n Respuesta al servicio ' + wsSettings.label  + ': ' + RespuestaSw + '\n\n');
        String estatus = response.getStatus();
        if(response.getStatusCode() != 201){
            System.debug('El resultado no es el esperado: ' + response.getStatusCode() + ' ' + response.getStatus());
            
        }else{
        	//5 Deserializar respuesta
            Map<String,Object> rawObj = (Map<String,Object>) JSON.deserializeUntyped(RespuestaSw);
            List<Object> animals = (List<Object>) rawObj.get('animals');
            for (Object animal: animals) {
               system.debug('Nombre del animal recibido ' + animal + '\n\n'); 
            }
            System.debug('Esta es mi respuesta '+response.getBody());
            }   
        
        return response; 
        }                       
   
}