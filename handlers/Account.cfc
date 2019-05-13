component extends="coldbox.system.EventHandler" {
    property name="AccountService" inject;

    function index (event, rc, prc) {
        if( structKeyExists(session, "authId") && session.authId){
            relocate( "account.view" );
        }
        return;
    }

    function login (event, rc, prc) {
        var data = AccountService.getAccount(rc.username, rc.password);
        if(data.recordCount) {
            session['authId'] = data.uid;
            session['account'] = data.account;
        }
        relocate( "account.view" );
        return;
    }

    function logout (event, rc, prc) {
        session['authId'] = 0;
        session['account'] = "";
        relocate( "main" );
    }

    function create (event, rc, prc) {
        prc['token'] = event.getValue("token", "");
        prc['username'] = event.getValue("username", "");
        prc['password'] = event.getValue("password", "");

        return;
    }

    function process (event, rc, prc) {
        if(rc.token != "YOUR TOKEN HERE"){
            rc['error'] = "Invitation Token is not correct";
            relocate(
                event = "account.create",
                persist = "token,username,password,error"
            );
        }
        else if(AccountService.accountExists(rc.username)){
            rc['error'] = "Account Exists";
            relocate(
                event = "account.create",
                persist = "token,username,password,error"
            );
        }
        else{ // all validation passed
            AccountService.createAccount(rc.username, rc.password);
        }
        return;
    }

    function view (event, rc, prc) {
        if((session.keyExists("authId") && session.authId == 0) || !session.keyExists("authId")) relocate( "main" );
        prc['ents'] = AccountService.getEnts(session.authId);
        return;
    }

};