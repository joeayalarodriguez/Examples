@isTest
private class DailyLeadProcessorTest {

    public static String CRON_EXP = '0 0 0 15 3 ? 2022';
    static testmethod void testScheduledJob() {
        list<lead>lstleads = new list<lead>();
        for (Integer i=0; i<200; i++) {
            lead l = new lead(
               LastName  = 'Dream force ' + i,
               LeadSource = '',
               Company = 'com '+i 
            );
            lstleads.add(l);
        }
        insert lstleads;
        
        test.startTest();
         String jobId = System.schedule('update lead source', CRON_EXP, new DailyLeadProcessor());
        test.stopTest();
        
    }
    
}