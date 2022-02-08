/*********************************************************************************************************************************************************************
  * Autor		Joe Ayala
 * Proyecto		CAPACITACION UAO
 * Decripción	controlador extension de visualforce
 * ______________________________________________________
 * Version 	1.0		20-03-2019		Joe Ayala	Creación de la clase
 ********************************************************************************************************************************************************************/
public class VisualconControlador_ctr {
    public String strOportunidadEntrante {get;set;}
    public Opportunity Oportunidad {get;set;}
    private ApexPages.StandardController controller;
    
    public VisualconControlador_ctr(ApexPages.StandardController controller){
        system.debug('\n\n controller============>>>  '+  controller);
        //Oportunidad = (Opportunity)controller.getRecord();
    }
    
    public Pagereference cargarOportunidad(){
        try{
            Oportunidad =[SELECT CloseDate,Id,Name,StageName,Amount  FROM Opportunity WHERE Id =:strOportunidadEntrante];
            controller = new ApexPages.StandardController(Oportunidad);
        }catch(exception ex){
            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.WARNING, 'El sistema no encontró oportunidades con el identificador ' + strOportunidadEntrante ));
        }
        
        
        return null;
    }
    
   

}