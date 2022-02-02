public class MerchandiseDetails {
public Demo_Child_Object__c merch { get; set; }
public MerchandiseDetails() {
this.merch = getMerchandise();
}
public List<Schema.FieldSetMember> getFields() {
return SObjectType.Demo_Child_Object__c.FieldSets.FieldsetA.getFields();
}
private Demo_Child_Object__c getMerchandise() {
if(true){
    String query = 'SELECT ';
    for(Schema.FieldSetMember f : this.getFields()) {
    query += f.getFieldPath() + ', ';
    }
    query += 'Id, Name FROM Demo_Child_Object__c limit 1 ';
    return null;
    }
    else
    {
    return null;
    }}
}