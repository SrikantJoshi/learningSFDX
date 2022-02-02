public class theController {
String searchText;
List<Demo_Object__c> results;
public String getSearchText() {
return searchText;
}
public void setSearchText(String s) {
searchText = s;
}
public List<Demo_Object__c> getResults() {
return results;
}
public PageReference doSearch() {
results = (List<Demo_Object__c>)[FIND :searchText RETURNING Demo_Object__c(Names__c, Picklist__c, TextBox__c)][0];
return null;
}
}