global class accountBatchExample implements Database.Batchable<SObject> {

      global Database.QueryLocator start(Database.BatchableContext Bc) {
       String accountQuery = 'SELECT id, Industry, Name FROM Account Where id != null';
       return Database.getQueryLocator(accountQuery);
    }
    global void execute(DataBase.BatchableContext bc, List<Account> accounts) {

        for(Account acc : accounts) {
            acc.Industry = 'Agriculture';
            acc.Type = 'Prospect';
        }

        update accounts;
    }
    global void finish(DataBase.BatchableContext bc) {
        system.debug('Account updates names have been set');
    }
}
