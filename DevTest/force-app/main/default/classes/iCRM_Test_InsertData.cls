public class iCRM_Test_InsertData
{
    public string nameFile{get;set;}
    public string objectName{get;set;}
    public Blob contentFile{get;set;}
    String[] filelines = new String[]{};
    List<sobject> accstoupload;
    
    public Pagereference ReadFile()
    {
        nameFile=contentFile.toString();
        filelines = nameFile.split('\n');
        accstoupload = new List<sobject>();
        system.debug('--------'+filelines[0]);
        for (Integer i=1;i<filelines.size();i++)
        {
            String[] inputvalues = new String[]{};
            inputvalues = filelines[i].split(',');
            String[] inputfield = new String[]{};
            inputfield =  filelines[0].split(',');
            
            Schema.SObjectType targetType = Schema.getGlobalDescribe().get(objectName);
            sObject a = targetType.newSObject();
            
            
            /*a.Name = inputvalues[0];
            a.ShippingStreet = inputvalues[1];       
            a.ShippingCity = inputvalues[2];
            a.ShippingState = inputvalues[3];
            a.ShippingPostalCode = inputvalues[4];
            a.ShippingCountry = inputvalues[5];
            */
            
            a.put(inputfield[0],inputvalues[0]);

            accstoupload.add(a);
        }
        try{
        insert accstoupload;
        }
        catch (Exception e)
        {
            ApexPages.Message errormsg = new ApexPages.Message(ApexPages.severity.ERROR,'An error has occured. Please check the template or try again later'+e);
            ApexPages.addMessage(errormsg);
        }    
        return null;
    }
    
    public List<Account> getuploadedAccounts()
    {
        if (accstoupload!= NULL)
            if (accstoupload.size() > 0)
                return accstoupload;
            else
                return null;                    
        else
            return null;
    }            
}