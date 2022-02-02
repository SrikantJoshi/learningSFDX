trigger Test on Demo_Object__c (before insert) {
list<Demo_Object__c> Tors = new List<Demo_Object__c>();
for(Demo_Object__c Tor : Trigger.New){
if(Tor.Name != ''){
Demo_Object__c K = NEW Demo_Object__c(ID= TOR.ID);

UPDATE K;
} 
}
}