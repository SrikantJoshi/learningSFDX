@isTest
private class TwoCasesPerDayTest {

    @isTest
    static void casesWithNoPriorContact(){         // works as expected
           
       Contact con1 =new Contact();
       con1.lastName  = 'conLastName';
       insert con1;
        
       Case cs1 = new Case ();
       cs1.ContactId = con1.Id;
       cs1.status = 'New';
       insert cs1;
        
       Case updatedCase = [SELECT status
                           FROM Case
                           WHERE Id = :cs1.Id];
        System.assertEquals ('New',updatedCase.status );
    }                   
     


  @isTest
    static void casesWithSameContact(){
        
        Contact con2 =new Contact();
        con2.lastName  = 'conLastName2';
        insert con2;
        
        List <Case> myCases = new List <Case> ();
        For (Integer i=0; i<2; i++){
        Case PriorCases = new Case ();
        PriorCases.ContactId = con2.Id;
        PriorCases.status = 'new';    // Didn't get expected results even if this line is 
                                                                    
        myCases.add(PriorCases);
        
        }
        
        insert myCases;
            
        Case cs4 = new Case ();
        cs4.ContactId = con2.Id;
            
        insert cs4;
                    
        Case todaysCase = [SELECT status
                                  FROM Case
                                  WHERE Id = :cs4.Id];
                            
        System.assertEquals ('Closed',todaysCase.status );   //System.AssertException:
                                                  
                               
    
    }
     

@isTest
    static void casesWithSameAccount (){
       Account acc1 =new Account();
       acc1.name= 'test Acc1';
       insert acc1; 
       
        List <CAse> allCases = new List <CAse> (); 
        
        For (Integer i=0;  i<3;  i++){

           Case previousCase = new Case ();
           previousCase.AccountId =acc1.Id;
           previousCase.status = 'new'; 
           allCases.add(previousCase);
           
        }
        
        insert allCases;
         
          Case caseInQuestion = new Case ();
            caseInQuestion.AccountId =acc1.Id;
            insert caseInQuestion;
         
        Case CaseStatus = [SELECT status
                                               FROM Case
                                            WHERE Id = :caseInQuestion.Id];
                            
        System.assertEquals ('Closed', CaseStatus.status );   //System.AssertException:
                                              
   
            
        
    }
}