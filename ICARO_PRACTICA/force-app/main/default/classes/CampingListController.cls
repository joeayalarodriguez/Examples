public with sharing class CampingListController {

    // STERN LECTURE ABOUT WHAT'S MISSING HERE COMING SOON

    @AuraEnabled
    public static List<Camping_Item__c> getItems() {
        return [SELECT Id, Name, Price__c, Quantity__c,  
                       Packed__c, CreatedDate 
                FROM Camping_Item__c];
    }
    
    @AuraEnabled
    public static Camping_Item__c saveItem(Camping_Item__c camping) {
        // Perform isUpdatable() checking first, then
        upsert camping;
        return camping;
    }
    
}