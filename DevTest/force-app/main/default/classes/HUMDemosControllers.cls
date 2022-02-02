Public class HUMDemosControllers {
public List<sObjectType> memDataList {get;set;}
public List<sObjectType> memDataList1 {get;set;}
public String fieldName;
public sObjectType inv{get;set;}
public  HUMDemosControllers () {
    String jsonStr = 
        '{"sObjectTypeList":[' +
        '{"totalPrice":5.5,"statementDate":"2011-10-04T16:58:54.858Z","lineItems":[' +
            '{"UnitPrice":1.0,"Quantity":5.0,"ProductName":"Pencil"},' +
            '{"UnitPrice":0.5,"Quantity":1.0,"ProductName":"Eraser"}],' +
                '"sObjectTypeNumber":1},' +
        '{"totalPrice":11.5,"statementDate":"2011-10-04T16:58:54.858Z","lineItems":[' +
            '{"UnitPrice":6.0,"Quantity":1.0,"ProductName":"Notebook"},' +
            '{"UnitPrice":2.5,"Quantity":1.0,"ProductName":"Ruler"},' +
            '{"UnitPrice":1.5,"Quantity":2.0,"ProductName":"Pen"}],"sObjectTypeNumber":2}' +
        ']}';
        string jjsonStr = '{\n' +
    ' "description" :"An appliance",\n' +
    ' "accessories" : [ "powerCord", ' + 
      '{ "right":"door handle1", ' + 
        '"left":"door handle2" } ],\n' +
    ' "dimensions" : ' + 
      '{ "height" : 5.5 , ' + 
        '"width" : 3.0 , ' + 
        '"depth" : 2.2 },\n' +
    ' "type" : null,\n' +
    ' "inventory" : 2000,\n' +
    ' "price" : 1023.45,\n' +
    ' "isShipped" : true,\n' +
    ' "modelNumber" : "123"\n' +
    '}';
    memDataList = new List<sObjectType>{};
    // Parse entire JSON response.
    JSONParser parser = JSON.createParser(jsonStr);
    JSONParser parser1 = JSON.createParser(jsonStr);
    system.debug('----&&-'+parser);
    while (parser.nextToken() != null) {
        while (parser1.nextToken() != null) {
            if (parser1.getCurrentToken() == JSONToken.START_OBJECT) {
                //String fieldName = parser.getText();
                system.debug('-----((---'+parser1.nextToken());
                fieldName = parser1.getText();
                system.debug('-----((---'+fieldName );
                break;
            } 
        }  
        // Start at the array of sObjectTypes.
        if (parser.getCurrentToken() == JSONToken.START_ARRAY) {
            while (parser.nextToken() != null) {
                // Advance to the start object marker to
                //  find next sObjectType statement object.
                
         
                if (parser.getCurrentToken() == JSONToken.START_OBJECT) {
                    //String fieldName = parser.getText();
                    //system.debug('-----((---'+parser.nextToken());
                    inv = (sObjectType)parser.readValueAs(sObjectType.class);
                    memDataList.add(inv);
                    system.debug('sObjectType memDataList: ' + memDataList);
                    memDataList1 = memDataList;
                    system.debug('================'+memDataList[0].totalPrice);
                    //system.debug('Size of list items: ' + inv.lineItems.size());
                    String s = JSON.serialize(inv);
                    //memDataList.add(s);
                    system.debug('Serialized sObjectType: ' + s);
                    parser.skipChildren();
                }
            }
        }
    }
} 


    public class sObjectType {
        HUMDemosControllers  kk = new HUMDemosControllers();
        
        public Double totalPrice{get;set;}
        public DateTime statementDate{get;set;}
        public Long sObjectTypeNumber{get;set;}
        public Long sObjectTypeNumbder{get;set;}
        List<LineItem> lineItems{get;set;}
        public Double height{get;set;}
        public sObjectType (){
            system.debug('--------'+kk.fieldname);
        }
    }  
    
    public class LineItem {
        public Double unitPrice;
        public Double quantity;
        public String productName;
    }
}