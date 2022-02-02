public class AwesomeProductController {  
    @AuraEnabled
    public static List<Product__c> getProducts() {
        return [select id from product__c];
    }

    @AuraEnabled
    public static Product__c getProductByName(String name) {
        return [select id,
                (select name from Product__r order by name)
                from product__c where name = :name];
    }
}