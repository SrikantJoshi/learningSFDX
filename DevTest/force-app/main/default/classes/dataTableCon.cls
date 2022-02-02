public class dataTableCon{
public Demo_Child_Object__c cc{set;get;}
public list<Demo_Child_Object__c> cvd{get;set;}

public dataTableCon(ApexPages.StandardController controller) {
cvd = new list<Demo_Child_Object__c >();

cvd = [select id  from Demo_Child_Object__c  ];

    }
    
    }