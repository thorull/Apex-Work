public class updateOpportunities {
    public static void updateAccountsWithOpps(List<Account> newAccounts, Map<Id, Account> oldAccounts) {
        Map<Id, Account> updatedAccounts = new Map<Id, Account>();
        
        for(Account acc : newAccounts) {
            If(oldAccounts != null && acc.Phone !=oldAccounts.get(acc.id).Phone) {
                updatedAccounts.put(acc.id, acc);
            }
        }

        List<Opportunity> relatedOpps = [SELECT Id, TrackingNumber__c FROM Opportunity WHERE ID In:updatedAccounts.keyset()];

        if(relatedOpps.size() > 0) {

            for(Opportunity opp : relatedOpps) {
                if(updatedAccounts.containskey(opp.AccountId)) {
                    opp.TrackingNumber__c = updatedAccounts.get(opp.AccountId).Phone;
                }
            }

            update relatedOpps;
        }
        

    }
}
