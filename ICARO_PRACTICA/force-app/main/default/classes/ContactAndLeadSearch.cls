public class ContactAndLeadSearch {
    Public static List<List<sObject>> searchContactsAndLeads(string CLName){
    
        List<List<sObject>> searchlist = [Find :CLNAME IN ALL FIELDS 
                                         RETURNING Contact(FirstName,LastName),Lead(FirstName,LastName)];
        Contact[] searchContacts = (Contact[])searchList[0];
        Lead[] searchLeads = (Lead[])searchList[1];
        for(contact c1 : searchContacts){
            system.debug('The contact with the name'+c1.FirstName+','+c1.LastName);
            
        }
        for(Lead L : searchLeads){
            system.debug('The Lead with the name'+L.FirstName+','+L.LastName);
            

}
        return searchList;
}
}