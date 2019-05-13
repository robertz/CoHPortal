<!--- All methods in this helper will be available in all handlers,views & layouts --->

<cfscript>
 function characterClass(id) {
    switch(id) {
        case '1':
            charClass = "Blaster";
            break;
        case '2':
            charClass = "Controller";
            break;
        case '3':
            charClass = "Defender";
            break;
        case '4':
            charClass = "Scrapper";
            break;  
        case '5':
            charClass = "Tank";
            break;
        case '9198':
            charClass = "Mastermind";
            break;
        case '9200':
            charClass = "Stalker";
            break; 
        case '9201':
            charClass = "Brute";
            break;
        case '9700':
            charClass = "Dominator";
            break;
        case '10929':
            charClass = "Corruptor";
            break;
        case '7076':
            charClass = "Warshade";
            break;
        case '7018':
            charClass = "Peacebringer";
            break;
        case '37071':
            charClass = "Arachnos Soldies";
            break;
        case '37072':
            charClass = "Arachnos Widow";
            break;   
        default: 
            charClass = "Unknown";
            break;
    }
    return charClass;
 }

 function displayLevel(level) {
    return !isNumeric(level) ? 1 : level + 1;
 }
</cfscript>