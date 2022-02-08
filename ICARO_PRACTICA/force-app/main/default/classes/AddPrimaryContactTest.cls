@isTest
public class AddPrimaryContactTest {
    static testmethod void TestList(){
        List<Account> Teste = new List<Account>();
        for(Integer i=0;i<50;i++){
            Teste.add(new Account( BillingState='CA',Name='Test'+i));
        }
        for(Integer j=0;j<50;j++){
            Teste.add(new Account(BillingState='NY',Name='Test'+j));
        }
        insert Teste;
        Contact co = new Contact();
        co.FirstName = 'demo';
        co.LastName = 'demo';
        insert co;
        String state = 'CA';
        
        AddPrimaryContact apc = new AddPrimaryContact(co,state);
        Test.startTest();
        System.enqueueJob(apc);
        Test.stopTest();
    } 
}