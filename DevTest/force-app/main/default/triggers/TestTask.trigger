trigger TestTask on Task (after Insert) {

for(Task b : Trigger.New){

    System.debug('----------'+b);
    
    Attachment n = [select id from Attachment];
}

}