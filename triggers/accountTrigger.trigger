trigger accountTrigger on Account (before insert, after insert, before update, after update) {

    if(Trigger.isUpdate) {
    updateOpportunities.updateAccountsWithOpps(Trigger.New, Trigger.OldMap);
    }
    if (Trigger.isInsert) {

    }

}