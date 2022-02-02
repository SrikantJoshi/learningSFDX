global class MyWebService {
    webService static Id makeContact() {
        Demo_Object__c c = new Demo_Object__c();
        insert c;
        return c.id;
    }
}