global class sheduler001_sch implements Schedulable{
   global void execute(SchedulableContext sc)
    {
         Id batchJobId	= Database.executeBatch(new ejercicio_bch_001(), 10);
    }   
}