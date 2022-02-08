public class AddPrimaryContact implements Queueable {
    private Contact objContact;
    private String strState;    
    public AddPrimaryContact(contact mycontact, String State) {
        this.objContact = mycontact;
        this.strState = State;
    }
    public void execute(QueueableContext context) {
        list<Account>lstAccounts = [Select Id, BillingState__c, (Select id,FirstName,LastName from contacts ) FROM Account WHERE BillingState =: strState limit 200 ];
        List<Contact> lstContact = new List<Contact>();
        for (Account account : lstAccounts) {
            Contact cont = objContact.clone(false,false,false,false);
            cont.AccountId = account.id;
            lstContact.add(cont);          
        }
        if(lstContact.size() > 0){
            insert lstContact;
        }
        
    }    
}