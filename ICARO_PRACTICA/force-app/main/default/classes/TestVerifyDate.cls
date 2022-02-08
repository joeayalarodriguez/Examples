@isTest
private class  TestVerifyDate {
    
     @isTest static void verifydatetest() {
        Date date1 = system.today(); 
        Date date2 = system.today(); 
        date2 = date2.addDays(40);
         
        VerifyDate.CheckDates(date1, date2);
        //System.assertEquals('Normal', pri);
    }
    
    @isTest static void verifydatetest30days() {
        Date date1 = system.today(); 
        Date date2 = system.today(); 
        date2 = date2.addDays(29);
         
        VerifyDate.CheckDates(date1, date2);
        //System.assertEquals('Normal', pri);
    }
    
    
}