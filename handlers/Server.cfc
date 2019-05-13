component extends="coldbox.system.EventHandler" {
    property name="AdminService" inject;

    function index (event, rc, prc) {
        relocate( "main" );
        return;
    }

    function admin (event, rc, prc) {
        if( !session.keyExists("authId") || session.authId != 1) relocate( "main" );
        prc['accounts'] = AdminService.getAccounts();
        prc['ents'] = AdminService.getEnts();
        return;
    }
}