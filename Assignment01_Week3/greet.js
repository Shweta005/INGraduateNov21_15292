// Occasion from this:New Year,Chrismas,Birthday,Anniversary
//Assignment 1 - Week3
/*
Update a greeting.js such that user will enter occation ["New Year","Chrismas","Birthday","Anniversary"\

msg["happy new year", "Merry Chrismas", "Happy Birthday", "Happy Anniversary"]

** HInt -> switch case in your greet(occasion,msg)

*/

var msg;

function greeting(occasion){
switch(occasion) {
    case 'New_year':
      msg = "Happy New Year";
      break;
    case 'Chrismas' :
      msg = "Merry Christmas";
      break;
    case 'Birthday' :
        msg = "Happy Birthday";
        break;
    case 'Anniversary' :
      msg = "Happy Anniversary";
      break;  
    default:
      msg = "No occasion";
  }
  console.log("On "+occasion+" "+msg);
}
greeting("New_year");
greeting("Chrismas");
greeting("Birthday");
greeting("Anniversary");
greeting("Holiday");