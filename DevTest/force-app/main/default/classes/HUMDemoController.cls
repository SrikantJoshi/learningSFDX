Public class HUMDemoController {
    
    public List<HUMWapper> sObjList {get; set;}
    
    Public List<HUMWapper> getsobjs(){
        String serachString;
        if(sObjList  == null)
            sObjList  = new List<HUMWapper>{};
        for(CustomSettingForFields__c mcs : CustomSettingForFields__c.getall().values()){
            serachString = mcs.SObject__c+mcs.Fields__c;
        }
        String searchquery='FIND\'Te*\'IN ALL FIELDS RETURNING '+serachString; 
        List<List<SObject>>searchList=search.query(searchquery);
        //List<List<sObject>> searchList = [FIND 'te*' IN ALL FIELDS RETURNING  Account (Id,Name),Contact(name,email) ];
        system.debug('------'+searchList );
        for(List<sObject> searchL : searchList){
            system.debug('------'+searchL );
            Schema.sObjectType tokenA = searchL.getSObjectType();
            sObjList.add(new HUMWapper(tokenA,searchL));    
        }
        system.debug('---@----'+sObjList );
        return sObjList;
    }
  
    public class HUMWapper {
        public Schema.sObjectType sObjType {get; set;}
        public List<sObject> sobj {get; set;}
    
        public HUMWapper (Schema.sObjectType sObjTyp,List<sObject> sob) {
            sObjType = sObjTyp;
            sobj = sob;
        }
    }
}