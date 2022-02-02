@isTest
private class PBBRunAssignmentRulesTest {

    static testMethod void runPositiveTestCases() {
        lead l = new Lead(LastName = 'Test', Company = 'Test');
        insert l;
        
        List<string> lstString = new List<string>{};
        lstString.add(String.Valueof(l.id)); 
        
        Set<ID> ReassignSet = new Set<ID>{};
        ReassignSet.add(l.id); 
        
        try{
            PBBRunAssignmentRules.ReRunAssignmentRules(lstString); 
            PBBRunAssignmentRules.futureLeadReassign(ReassignSet);
        }
        catch(Exception e){
            System.debug('Exception e'+ e);
        } 
    }
    
}