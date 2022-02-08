public with sharing class AccountUtils {
    
    public static list<Account> accountsByState(String BillingState){
        list<Account> lstaccount = [Select id, Name from Account where billingState =: BillingState];
        return lstaccount;
    }

    
}