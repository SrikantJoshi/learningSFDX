public class VFpagedemo{
    public list<Inquiry> lstInvs {get;set;}
    public list<Inquiry> lstfilterInvs {get;set;}
    public list<Inquiry> lstInOperation {get;set;}
    public Date fromDTOpened {get;set;}
    public Date toDTOpened {get;set;}
    public string strReferenceId {get;set;}
    private final Case caseRec;
    Public Integer pageno {get;set;}
    
    public VFpagedemo(ApexPages.StandardController stdController) {
        this.caseRec = (Case)stdController.getRecord();
        pageno =0;
    }
    
    
    public void parseJSONString() {
        String jsonStr = 
            '{"Inquiries":[' +
            '{"ReferenceId":12345,"CaseOrigin":"Inbound Call","Type":"Customer Inquiry","Category":"Claims","Product":"Medical","InquiringFor":"Dr.Bunny","InquiringForType":"Provider","Status":"InProgress","Priority":"Normal","DateTimeOpened":"5/06/2014","DateTimeClosed":"5/06/2014","OwnerName":"Rae T"},' +
            '{"ReferenceId":56796,"CaseOrigin":"Inbound Call","Type":"Customer Inquiry","Category":"Claims","Product":"Medical","InquiringFor":"Dr.Bunny","InquiringForType":"Provider","Status":"InProgress","Priority":"Normal","DateTimeOpened":"5/06/2014","DateTimeClosed":"5/06/2014","OwnerName":"Rae T"},' +
            '{"ReferenceId":1234,"CaseOrigin":"Inbound Call","Type":"Customer Inquiry","Category":"Claims","Product":"Medical","InquiringFor":"Dr.Bunny","InquiringForType":"Provider","Status":"InProgress","Priority":"Normal","DateTimeOpened":"5/06/2014","DateTimeClosed":"5/06/2014","OwnerName":"Rae T"},' +
            '{"ReferenceId":45678,"CaseOrigin":"Inbound Call","Type":"Customer Inquiry","Category":"Claims","Product":"Medical","InquiringFor":"Dr.Bunny","InquiringForType":"Provider","Status":"InProgress","Priority":"Normal","DateTimeOpened":"5/06/2014","DateTimeClosed":"5/06/2014","OwnerName":"Rae T"}' +
            ']}';
    
        // Parse entire JSON response.
        lstInvs = new list<Inquiry>{};
        JSONParser parser = JSON.createParser(jsonStr);
        while (parser.nextToken() != null) {
            // Start at the array of Inquirys.
            if (parser.getCurrentToken() == JSONToken.START_ARRAY) {
                while (parser.nextToken() != null) {
                    // Advance to the start object marker to
                    //  find next Inquiry statement object.
                    if (parser.getCurrentToken() == JSONToken.START_OBJECT) {
                        // Read entire Inquiry object, including its array of line items.
                        Inquiry inv = (Inquiry)parser.readValueAs(Inquiry.class);
                        lstInvs.add(inv);
                        system.debug('Inquiry number: ' + inv);
                        //system.debug('Size of list items: ' + inv.lineItems.size());
                        // For debugging purposes, serialize again to verify what was parsed.
                        // Skip the child start array and start object markers.
                        parser.skipChildren();
                    }
                }
            }
        }
        system.debug('-------'+lstInvs);
    }
    
    public void doFilterInquiries() { 
        parseJSONString(); 
        lstfilterInvs = new list<Inquiry>{};    
        for(Inquiry inqRec : lstInvs){
            if(inqRec.ReferenceId == strReferenceId ){
                lstfilterInvs.add(inqRec); 
            }
        }
        if(lstfilterInvs!=null){
            lstInvs.clear();
            lstInvs = lstfilterInvs;
        }
    }
    
    public PageReference Next() {
        parseJSONString();
        if(pageno == lstInvs.size()-2){
            pageno =-1;
        }
        pageno++;
        listToDisplay();
        return null;
    }
    
    public PageReference First() {
        parseJSONString();
        pageno =0;
        listToDisplay();
        return null;
    }
    
    public void listToDisplay(){ 
        lstInOperation = new list<Inquiry>{};
        lstInOperation = lstInvs.clone();
        system.debug('--------**1'+lstInvs);
        lstInvs.clear();
        system.debug('--------**2'+lstInOperation );
        system.debug('--------**3'+lstInvs);
        for(integer i = pageno; i< pageno+2; i++){
            lstInvs.add(lstInOperation[i]);
        }
    }
    
    
    // Inner classes used for serialization by readValuesAs(). 
    
    public class Inquiry {
        public String ReferenceId {get;set;}
        public String CaseOrigin {get;set;}
        public string Type{get;set;}       
        public string Category{get;set;}   
        public string Product{get;set;}
        public string InquiringFor{get;set;}       
        public string InquiringForType{get;set;}   
        public string Status{get;set;}
        public string Priority{get;set;}       
        public string DateTimeOpened{get;set;}   
        public string DateTimeClosed{get;set;}
        public string OwnerName{get;set;}
        //public Date dateTimeOpened {get;set;}  
    }  
    

}