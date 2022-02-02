public with sharing class NoNoneForPicklistController {

public List<SelectOption> statusOptions {get;set;}

public NoNoneForPicklistController() {

statusOptions.add(new SelectOption('hello','hello'));

}
    
}