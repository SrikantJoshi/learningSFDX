public class DependentObjects {

public List<SelectOption> getCategories() {
  List<SelectOption> optionList = new List<SelectOption>();
  /* Add a null option to force the user to make a selection. */
  optionList.add(new SelectOption('','- None -'));
  for (Demo_Object__c fc : [select name from Demo_Object__c order by Name]){
    optionList.add(new SelectOption(fc.id,fc.name));
  }
  return optionList;     
}
}