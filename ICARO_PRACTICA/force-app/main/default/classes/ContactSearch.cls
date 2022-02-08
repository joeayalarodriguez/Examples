public class ContactSearch {
    public static list<contact> searchForContacts(string lname,string pcode){        
        contact[] cnt = [select Account.Id,Account.Name from Contact 
                         where (Lastname =:lname and MailingPostalCode =:pcode)];
        Contact cntlist = cnt[0];
        String AccntId=cntlist.Account.Id;
        String AccntName=cntlist.Account.Name;
        system.debug('The AccountID '+AccntId+'; The Account Name '+AccntName);
        return cnt;                
    }
}