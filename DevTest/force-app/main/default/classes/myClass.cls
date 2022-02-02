public class myClass { 
  public string varSetget{set;get;}
  public list<String> getmakeContact() { 
        list<String> lstnames = new list<String>();
        for(Demo_Object__c Demos : [Select id,names__c from Demo_Object__c]) {
            lstnames.add(Demos.names__c);
        }
        return lstnames; 

    }

}