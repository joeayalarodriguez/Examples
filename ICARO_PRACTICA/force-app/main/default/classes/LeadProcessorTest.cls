@isTest
private  class LeadProcessorTest {
    @testSetup 
    static void setup() {
        List<lead> listLead = new List<lead>();
        // insert 10 lead
        for (Integer i=0;i<200;i++) {
            Lead led = new Lead();
            led.FirstName ='FirstName';
            led.LastName ='LastName'+i;
            led.Company ='Company'+i;
            
            listLead.add(led);
        }
        system.debug('leadslista '+ listLead);
        insert listLead;
        
    }
    static testmethod void test() {        
        Test.startTest();
        LeadProcessor uca = new LeadProcessor();
        Id batchId = Database.executeBatch(uca);
        Test.stopTest();
        // after the testing stops, assert records were updated properly
        System.assertEquals(200, [select count() from lead where LeadSource = 'Dreamforce']);
    }
    
}