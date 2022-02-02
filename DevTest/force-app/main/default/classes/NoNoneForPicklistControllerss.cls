public with sharing class NoNoneForPicklistControllerss {

public List<SelectOption> statusOptions {get;set;}
private final Demo_Object__c u;

public NoNoneForPicklistControllerss(ApexPages.StandardController acon) { 

//this.u = (Demo_Object__c)acon.getRecord();
system.debug('u----------------'+ApexPages.currentPage().getParameters().get('retURL'));

Demo_Object__c k = [select Names__c from Demo_Object__c where id = : 'a0190000000aE8W' ];

statusOptions = new List<SelectOption>();
statusOptions.add(new SelectOption(k.Names__c,k.Names__c));

}
    
}