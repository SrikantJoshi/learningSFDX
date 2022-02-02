({
     shiftDiv: function(component, event, helper,lWidth) {
            var changeposition=component.get("v.intervalId");
            var myimage = document.getElementById('tofloat');     
            if(changeposition <lWidth){
            //  console.log("ok"+changeposition);
              myimage.style.left=changeposition+'px';
              myimage.style.background="radial-gradient(green,blue)";
              changeposition=changeposition+5;
              component.set("v.intervalId",changeposition);
         }
              //reset the left to 0
         else{
                   component.set("v.intervalId",0);
                   myimage.style.left="0px";
                  changeposition=component.get("v.intervalId");//resetting so as to hit the if block again
         }

     }
})