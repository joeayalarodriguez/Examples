/********************************************************************************************************************************
 * Autor		Joe Ayala
 * Proyecto		CAPACITACION UAO
 * Decripción	clase test de cuenta
 ********************************************************************************************************************************/
public class AVX_ExampleServiceGET_ws {
    
    public static HttpResponse serviceAnimals(){  // CAMBIO
        //1 - Busqueda de la metadata para obtener el endpoint
        Web_Service_Control__mdt wsSettings = [SELECT Activo__c,Email_Responsable__c,Endpoint__c,Label 
                                               FROM Web_Service_Control__mdt
                                               WHERE Label = 'ServiceAnimals'];
        system.debug('Parametros del servicio ' + wsSettings);
        String endpoint = 'http://';
        HttpResponse response;
        
        if(wsSettings.Activo__c){
            endpoint = wsSettings.Endpoint__c;
            //2 - Construccion del Request
            Http httpProtocol = new Http();
            HttpRequest request = new HttpRequest();
            request.setHeader('Content-Type', 'application/json');
            request.setEndpoint(endpoint);
            request.setMethod('GET');
            
            //3 - Invocar Servicio Web
            response = httpProtocol.send(request); //CAMBIO
            String Respuestaws = response.getBody();
            String estatus = response.getStatus();
            system.debug('Estatus del servicio ' + estatus + ' Respuesta servicio web ' + Respuestaws );
            if(response.getStatusCode() == 200){
                //4 Deserializar Respuesta
                Map<String,Object> rawObj = (Map<String, Object>) JSON.deserializeUntyped(Respuestaws);
                List<Object> animals = (List<Object>) rawObj.get('animals');
                for(Object animal: animals){
                    system.debug(' Nombre del animal Recibido ===>>>  ' + animal);
                }
            }else{
                system.debug('El servicio ' + wsSettings.Label + ' Presenta fallas ' +  response);
                String respuestaFallida = 'El servicio no respondió ';
            }
            
        }
        return response; //CAMBIO
    }

}