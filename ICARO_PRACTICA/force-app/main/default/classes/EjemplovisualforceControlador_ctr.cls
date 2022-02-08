public class EjemplovisualforceControlador_ctr {
  
     public Opportunity Opportunidad {get;set;}
     public Decimal valor1 {get;set;}
     public Decimal valor2 {get;set;}
     public Decimal Resultado {get;set;}
     public String Opportunidadentrantestr {get;set;} 
     private ApexPages.Standardcontroller controller;
     
     public EjemplovisualforceControlador_ctr(ApexPages.StandardController controller)
     {
         Opportunidad = (Opportunity)controller.getRecord();
          valor1 = 0;
          valor2 = 0;
     }
    
    public PageReference sumar()
    {
       Resultado = valor1 + valor2;
       ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.INFO, 'Se han sumado los números  ' + valor1 + ' y ' + valor2));       
       return null;
    }
    
    public PageReference cargaroportunidad()
    {
        try{
            Opportunidad = [Select Name, Valor_fee_recargo__c,Amount, Id, StageName, CloseDate, (SELECT Id,Name,OpportunityId,Quantity, ListPrice FROM OpportunityLineItems) from Opportunity  where Id =: Opportunidadentrantestr];
       		Controller = new ApexPages.Standardcontroller(Opportunidad);
        }catch(exception ex){
            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.INFO, 'No encontró oportunidades con el Id ' + Opportunidadentrantestr)); 
        }
        
       return null;
        
    }
    //Agregando graficos a la visualforce --
    public List<PieWedgeData> getPieData() {
        List<PieWedgeData> data = new List<PieWedgeData>();
        data.add(new PieWedgeData('Jan', 30));
        data.add(new PieWedgeData('Feb', 15));
        data.add(new PieWedgeData('Mar', 10));
        data.add(new PieWedgeData('Apr', 20));
        data.add(new PieWedgeData('May', 20));
        data.add(new PieWedgeData('Jun', 5));
        return data;
    }

    // Wrapper class
    public class PieWedgeData {

        public String name { get; set; }
        public Integer data { get; set; }

        public PieWedgeData(String name, Integer data) {
            this.name = name;
            this.data = data;
        }
    }
    
}