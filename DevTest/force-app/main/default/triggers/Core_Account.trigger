trigger Core_Account on Account (before insert, before update) {
    
    /*
    if(Trigger.isBefore && (Trigger.isInsert || Trigger.isUpdate)){
        Core_Account_Handler.AccountBeforeHandler(Trigger.new);
    }
     */
    // Get all the values from the Custom Setting
    //Map<String, SMG_Country_State_Reference__c> refMap = SMG_Country_State_Reference__c.getall();
    for(Account acc: trigger.new){
        system.debug('New'+acc);
        //if(refMap.containsKey(acc.BillingState)){
           // acc.SMG_Geo__c = refMap.get(acc.BillingState).SMG_Geo__c;
           // acc.SMG_Sub_Geo__c = refMap.get(acc.BillingState).SMG_Sub_Geo__c;
       // }
    }

}