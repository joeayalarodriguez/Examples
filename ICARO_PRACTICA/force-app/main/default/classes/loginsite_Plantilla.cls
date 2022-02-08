public with sharing class loginsite_Plantilla{
 public String userName  {get; set;}
 public String password  {get; set;}
    
    public PageReference AuthenticateUser()
    {
        List<Usuario_site__c> userRecord = [SELECT Id FROM Usuario_site__c WHERE Usuario__c = :userName AND Password__c = :passWord LIMIT 1];
        System.debug('\n\n@@@userRecord-------> ' + userRecord + '\n\n');
        
        if(userRecord != null && userRecord.size() != 0)
        {           
           return new PageReference('https://capacitaciondevelopers-developer-edition.na142.force.com/login/VisualconcontroladorE_lightning');
           //return null;
        }
        else
        {
            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR, 'Por favor verifique su usuario y contraseña de acceso al sitio'));
            return null;
        }
    }
   

}