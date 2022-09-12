public class accountwithOppsPractice {
    public  static void insertTestOpportunity() {
        List<Account> testAccount = [SELECT id, name FROM ACCOUNT WHERE createdDate = THIS_Year];
       
        List<Opportunity> newOpps = new List<Opportunity>();

        For(Account acct : testAccount) {
            if(testAccount != null) {
                Opportunity newOpp = new Opportunity();
                newOpp.Name = acct.name;
                newOpp.accountId = acct.id;
                newOpps.add(newOpp);
            }
        }
        insert newOpps;
    }
}
