@isTest
public with sharing class Test_eXCompany_TotalNoOfCasesController {
    
    public static testMethod void testCaseOnNoOfcases() {
    
        List<Case> lstCases = new List<Case>{};
        Account accSobject = new Account();
        
        //Insert a new account sobject
        accSobject.Name='NewAcc';
        insert accSobject ;
           
        // create 5 open cases
        for(Integer i = 0; i < 5; i++){
            Case caseRec = new Case(AccountId = accSobject.Id);
            lstCases.add(caseRec);
        }
    
        // Start the test, this changes governor limit context to 
        // that of trigger rather than test. 
        test.startTest();
            
        // Insert the Account records that cause the trigger to execute.
        Database.insert(lstCases);
        
        //Instantiate the standard controller
        ApexPages.StandardController sc = new ApexPages.StandardController(lstCases[0]);
        eXCompany_TotalNoOfCasesController controllerExt = new eXCompany_TotalNoOfCasesController(sc);
    
        //Pass the id of one of the open cases
        PageReference pageRef = Page.eXCompany_ContactsPage;
        pageRef.getParameters().put('Id', accSobject.Id);
        Test.setCurrentPage(pageRef);  
        
        //Check if the number of cases from the database created is same as the one queried.
        system.assertEquals(lstCases.size(), controllerExt.lstCases.size());
        
        //Close one among the 5 open cases
        lstCases[0].Status = 'Closed'; //System.Label.eXCompany_CaseStatusClosed;
        Database.update(lstCases);
        
        //Instantiate the standard controller
        eXCompany_TotalNoOfCasesController controllerExt1 = new eXCompany_TotalNoOfCasesController(sc);
        
        //Check if the number of cases from the database is same as the one queried.
        //It will now be 1 less than the All the cases in the database created
        system.assertEquals(lstCases.size()-1, controllerExt1.lstCases.size());
    
        test.stopTest();
    }
}