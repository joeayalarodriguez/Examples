/***************************************************************************************************************
* Avanxo 
* @author           Joe Ayala
* Proyecto:         CAPACITACION
* Descripción:      Llamado Servicio SOAP
* -------------------------------------------
*            No.      Fecha               Autor                           Descripción
*           -----   ----------      ---------------------               ---------------
* @versión   1.0    29/03/2019      Joe Ayala (JA)                  Creación de la clase
****************************************************************************************************************/
public class AVX_CallWebSErviceSOAP_ws {
     
    public static Double Calculadora(Decimal valueone, Decimal valuetwo, String stroperacion){
        calculatorServicesSoap_ws.CalculatorImplPort calculator = new  calculatorServicesSoap_ws.CalculatorImplPort();
        Double x = valueone;
        Double y = valuetwo;
        Decimal result = 0;
        if(stroperacion == 'SUMA'){
             result = (Decimal)calculator.doAdd(x,y);
        }else if(stroperacion == 'MULTIPLICACION'){
             result = (Decimal)calculator.doMultiply(x,y);
        }
        
        system.debug('\n\n *********  Resultado Obtenido ' + result + '  ************* \n\n ');
        
        return result;
    }
    
    
}