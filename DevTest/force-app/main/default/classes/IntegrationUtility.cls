/**************************************************************************** 
Apex Class Name  : IntegrationUtility 
Version          : 1.0  
Created Date     : May 9 2014 
Function         : Here all the utility methods for the integration will be stored
****************************************************************************/ 
public class IntegrationUtility {
    /*  
    * Method name : xmlInputStringParser
    * Description : Returns a map with key as Tags and Value as Tag Values  
    * Return Type : map<String,String>  
    * Parameter : Requires 1 argument, strXmlInput, this is an xml input string
    */ 
    public static map<String,String> xmlInputStringParser(String strXmlInput) {
        strXmlInput = '<?xml version="1.0" encoding="ISO-8859-1" standalone="yes"?><AlertsCollectionDTO xmlns="http://tempuri.org/AlertsCollectionDTO.xsd"><Alert><ID>10758</ID><AlertName>Test Alert Save - IV</AlertName><Message><![CDATA[&lt;STRONG&gt;&lt;span style="color:#808000;"&gt;Test Alert Save IV&lt;BR&gt;&lt;/span&gt;&lt;BR&gt;&lt;span style="color:#ff0000;"&gt;Stop Trigger of Display of New Alerts when CCP Inquiry Save Button is Selected&lt;/span&gt;&lt;/STRONG&gt;]]></Message><SpanishMessage /><MessageType>GM</MessageType><AlertSubType xml:space="preserve">  </AlertSubType><IconName>Enrollment</IconName><IconUrl>https://qa-ccp.humana.com/CallCenter/Alert_WebServices/DisplayIcon.aspx?Id=41</IconUrl><InquiryContextID>6120</InquiryContextID><Location>NA</Location><Priority>N</Priority><UserTermable>N</UserTermable><TriggerOrFileID>398973</TriggerOrFileID><TriggerType>M</TriggerType><INQRTypes>M   </INQRTypes><INQATypes>M   </INQATypes><INQRSubTypes xml:space="preserve">  </INQRSubTypes><INQASubTypes xml:space="preserve">  </INQASubTypes><LogTimeStamp>2014-05-09 04:19:22.700374</LogTimeStamp><ShowTo>INQA</ShowTo><ContextDataHash>47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=</ContextDataHash><RecordNbr>2</RecordNbr><TargetTeam>N</TargetTeam></Alert></AlertsCollectionDTO>';    
        map<String,String> mapTagsToValues = new map<String,String> {};   
        Dom.Document xmlDoc = new Dom.Document();            
        xmlDoc.load(strXmlInput);    
        Dom.XMLNode rootNode = xmlDoc.getRootElement();
        Dom.XMLNode[] fullNode = rootNode.getChildElements(); 
        if(fullNode[0].getChildElements() != null){
            for(Dom.XMLNode mpkeyValue : fullNode[0].getChildElements()){       
                mapTagsToValues.put(mpkeyValue.getName(),mpkeyValue.getText());
            }  
        } 
        for(string k : mapTagsToValues.keySet()){
            system.debug('---------'+k);
        }
        system.debug('---------'+mapTagsToValues.keySet());   
        return mapTagsToValues;
    }    
}