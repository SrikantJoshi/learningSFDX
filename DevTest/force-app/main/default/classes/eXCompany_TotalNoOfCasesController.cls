/**
* The VF page associated is supposed to display the total number of Cases 
* currently open for the account associated with the Case on the details page as well 
* as a table including the subject and the creation date of the 5 most recent Cases that have been opened. 
*
* @author  Srikant Joshi
* @version 1.0
* @since   2016-11-12
*/
public with sharing class eXCompany_TotalNoOfCasesController {

    public Integer iCountNoOfCases{get;set;} // integer to count the no of Cases
    public list<Case> lstCases{get;set;} // the Case sobject rows
    public final Case sobjectCase{get;set;} // the Case sobject 
    public String sobjectAccountName{get;set;} //name of the account associated to the Case
    
    /* 
    Contructor for the standardcontroller
    */
    public eXCompany_TotalNoOfCasesController(ApexPages.StandardController stdController){
        
        // get the AccountId and standard case sobject
        //to avoid error during test class execution
        if(!Test.isRunningTest())
            stdController.addFields(new List<String>{'AccountId'}); 
        
        this.sobjectCase = (Case)stdController.getRecord();
        
        //Include exception handling
        try{
            //Get the list of Case
            lstCases = getNoOfCases();
            
            if(!lstCases.isEmpty()){
                //Get the number of open Cases
                iCountNoOfCases = lstCases.size();
                //name of the account associated to the Case
                sobjectAccountName = lstCases[0].Account.Name;
            }
            else{
                //If there are no open cases, show the number as zero.
                iCountNoOfCases =0;
            }
        }
        catch (Exception e) {
         //exception handling code here 
        }
    }

    /*
    Method to get the no of all cases associated for the account
    */
    private list<Case> getNoOfCases() {
        
        //Query to get the number of open Cases
        return [SELECT id,Subject,createdDate, Account.Name 
                FROM  Case 
                WHERE Case.AccountId  = :sobjectCase.AccountId AND 
                      Case.AccountId != NULL AND
                      Case.Status != 'Closed' // Assuming that open Cases are one's not closed / :System.Label.eXCompany_CaseStatusClosed
                ORDER BY CreatedDate DESC
                LIMIT 5];//5 most recent cases that have been opened
    }

}