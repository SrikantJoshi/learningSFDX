trigger TwoCasesPerDay on Case (before insert) {
     
    for (Case cs : trigger.new){
            
        if (cs.ContactId != null ){ 
        List <Case> casesWithSameContact = [SELECT Id 
                                           	  FROM Case
                                             WHERE ContactId = :cs.ContactId
                                               AND CreatedDate = TODAY];
        

if (casesWithSameContact.size()>=2 ){
                cs.Status='Closed'; 
           	 	
               	system.debug('Previous cases with same contact created today'
                             +casesWithSameContact.size());
        	} 
        }
        if ( cs.AccountId != null){
            List <Case> casesWithSameAccount = [SELECT Id 
                                           	                                    FROM Case
                                                                                       WHERE AccountId = :cs.AccountId
                                                                                             AND CreatedDate = TODAY];     
                                            
       		System.debug ('case with contact added by query');
                 
        	if (casesWithSameAccount.size()>=3){
           		cs.Status='Closed';  
           	 	
system.debug('Previous cases with same account created today'
                             + casesWithSameAccount.size());
        	}
        }
    } 
    
}