public with sharing class propertyController {
    @AuraEnabled
    public static List<propertyWrapper> getLatestProperty(){
        List<propertyWrapper> propWrapList = new List<propertyWrapper>();  
        for( Property__c pty : [Select Id, Name, City__c FROM Property__c 
            ORDER BY LastModifiedDate DESC LIMIT 20 ]) {
                propertyWrapper prWrap = new propertyWrapper(pty);
                propWrapList.add(prWrap);
            }
        return propWrapList;
    }

    public class propertyWrapper {
        @AuraEnabled public Boolean isChecked;
        @AuraEnabled public Property__c prop;

        public propertyWrapper(Property__c p) {
            isChecked = false;
            prop = p;
        }
    
}
}