/***************************************************************************************************************
* Avanxo 
* @author           Joe Ayala
* Proyecto:         ejemplo controlador
* Descripción:      Gestiona toda la lógica de la epagina visualforce
                                 
* Cambios (Versión)
* -------------------------------------------
*            No.      Fecha               Autor                           Descripción
*           -----   ----------      ---------------------               ---------------
* @versión   1.0    20/02/2019      Joe Ayala (JA)                  Creación de la clase
****************************************************************************************************************/
public class ejemplovisualforce_ctr {
    public Opportunity Opportunidad {get;set;}
    public Decimal valor1 {get;set;}
    public Decimal valor2 {get;set;}
    private ApexPages.Standardcontroller controller;
    public Opportunity Opportunidadentrante {get;set;}
    public String Opportunidadentrantestr {get;set;}                                 
    public Decimal Resultado {get;set;}
    
    public ejemplovisualforce_ctr(ApexPages.StandardSetController controller)
    {
        Opportunidad = (Opportunity)controller.getRecord();        
        system.debug('Opportunidad creada' + Opportunidad);
        valor1 = 0;
        valor2 = 0;    
    }
    
     
    
    public PageReference cargaroportunidad()
    {
        Opportunidad = new Opportunity();
        Opportunidad = [Select Name, Valor_fee_recargo__c,Amount, Id, StageName, CloseDate, (SELECT Id,Name,OpportunityId,Quantity, ListPrice FROM OpportunityLineItems) from Opportunity  where Id =: Opportunidadentrantestr];
        if(Opportunidad<>null){
            Controller = new ApexPages.Standardcontroller(Opportunidad);
        }else{
            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.INFO, 'No se encuentra oportunidad'));
        }
        
        return null;
    }
    
    public PageReference sumar()
    {
        Resultado = valor1 + valor2;
        return null;
    }
    
    public PageReference almacenar()
    {
        Opportunidad.Valor_fee_recargo__c = Resultado;
        update Opportunidad;
        return null;
    }
    
}