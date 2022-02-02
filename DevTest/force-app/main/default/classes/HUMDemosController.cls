Public class HUMDemosController {
    
    public String resultString {get;set;}   
    public List<MemData> memDataList {get;set;}
    Public void getsobjs(){
        
        Account objAcc = new Account();
        objAcc.name = 'JSON Test';
        insert objAcc;
        // Create an object to write to the JSON string.
        JSONGenerator gen = JSON.createGenerator(true);

        // Write data to the JSON string.
        gen.writeStartObject();
        gen.writeFieldName('data');

        gen.writeObject(objAcc);

        gen.writeEndObject();

        // Get the JSON string.
        String JsonString = gen.getAsString(); 
        
        JSONParser parser = JSON.createParser(JsonString );
        system.debug('-----'+parser );
        while(parser.nextToken() != NULL){
            system.debug('---*--'+parser.getCurrentToken());
      //Start the array of Invoices
            //if(parser.getCurrentToken() == JSONToken.START_ARRAY){
                //while(parser.nextToken() != null){
                    if(parser.getCurrentToken() == JSONToken.START_OBJECT){
                        system.debug('---**--'+parser);
                        MemData mDt = (MemData)parser.readValueAs(MemData.class);
                        memDataList.add(mDt);
                    }
               // }       
            //}
       
        }
        system.debug('==========:'+memDataList); 
    }    
    public class MemData{
        public String name {get; set;}
        public Integer challenges_entered {get; set;}
        public Integer total_1st_place {get; set;}
        public Integer total_2nd_place {get; set;}
        public Integer active_challenges {get; set;}
        public Decimal total_money {get; set;}
        public Integer total_wins {get; set;}
        public String summary_bio {get; set;}
        public Integer total_3st_place {get; set;}
        public String profile_pic {get; set;}
        //The Constructor
        public MemData(){
        }  
    }    
}