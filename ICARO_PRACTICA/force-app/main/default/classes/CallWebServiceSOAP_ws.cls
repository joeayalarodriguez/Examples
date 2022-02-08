/*****************************************************************************************************************************************
 * @author		Joe Ayala
 * Proyecto		Capacitación 
 * Descripción	Llamado servicio SOAP
 * 				No.		Fecha			Autor					Descripción
 * 			   ----	   -------         -------------------     -----------------------------------
 *****************************************************************************************************************************************/ 
public class CallWebServiceSOAP_ws {
    
    public static Double calculadora(Decimal valueone, Decimal valuetwo, String Operacion){
        calculatorServicesSoap_ws.CalculatorImplPort calculator = new calculatorServicesSoap_ws.CalculatorImplPort();
        Decimal result = 0; 
        try{
           	Double x = valueone;
        	Double y = valuetwo; 
            if(Operacion == 'suma'){
            result = (Decimal)calculator.doAdd(x, y);
            }else if(Operacion == 'multiplicacion'){
                result = (Decimal)calculator.doMultiply(x, y);
            }else if(Operacion == 'division'){
                result = (Decimal)calculator.doDivide(x, y);
            }else if(Operacion == 'resta'){
                result = (Decimal)calculator.doSubtract(x, y);
            }else{
                system.debug('=========>>>>   Esta operación no está pérmitida ' );
            }
             
            system.debug('=========>>>>   El resultado de la ' + Operacion + ' es igual a ' + result + ' <============');
        }catch(exception ex){
            system.debug('=========>>>>   No fue posible procesar su solicitud , verifique las variables <============' + ex);
        }
        
        
        
        
        return result; 
    } 	
}