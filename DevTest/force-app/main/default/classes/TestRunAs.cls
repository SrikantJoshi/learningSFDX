public class TestRunAs {
   public static testMethod void testRunAs() {
      // Setup test data
      // This code runs as the system user
      Demo_Object__c h = new Demo_Object__c();
      insert h;
      Demo_Child_Object__c candidate = new Demo_Child_Object__c(Demo_Object__c = h.id );

           insert candidate;

       ApexPages.StandardController stdController = new ApexPages.StandardController( candidate);

            dataTableCon dtc = new dataTableCon(stdController);

            System.assertEquals( 1, dtc.cvd.size() );



}
}