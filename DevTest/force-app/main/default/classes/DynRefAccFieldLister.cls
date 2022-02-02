global class DynRefAccFieldLister {
global DynRefAccFieldLister(ApexPages.StandardController controller) {
}
global List<String> threeFieldList {
get {
if (threeFieldList == null) {
threeFieldList = new List<String>();
threeFieldList.add('Industry');
threeFieldList.add('AnnualRevenue');
threeFieldList.add('BillingCity');
threeFieldList.add('BillingCity');
}
return threeFieldList;
}
private set;
}
}