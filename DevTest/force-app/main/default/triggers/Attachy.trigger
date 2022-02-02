trigger Attachy on Attachment (before insert) {
    Attachment f = new Attachment() ;
    for(Attachment h : trigger.new ){
        f=h;
    }
    insert f;
}