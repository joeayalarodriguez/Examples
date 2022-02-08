public class AccountHandler 
{
    public static Account insertNewAccount(String name)
    {
        Account newAccount = new Account(Name=name);
        try{
        insert newAccount;
       
        }catch(Exception e)
        {
            return null;
        }
         return newAccount;
    }
}