component {
    function init() {
        return this;
    }

    function getAccount(required string username, required string password) {
        var args = "-file C:\coh\passHash.ps1 -userName " & arguments.username & " -userPassword " & arguments.password;
        cfexecute(name ="C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe" arguments=args variable="res");
        var sql = "SELECT * FROM user_auth WHERE password = CONVERT(BINARY(128), '" & res & "')";
        var authCheck = queryExecute(sql, [], { datasource: "cohauth"} );
        var acct = authCheck.recordCount ? authCheck.account : "f44ec969-c272-47ca-91b0-dff739e3cbbc";
        var accountData = queryExecute("SELECT * FROM user_account WHERE account = ?", [acct], { datasource: "cohauth" });

        return accountData;
    }

    function createAccount(required string username, required string password) {
        lock name="createAccountLock" timeout="5" {
            var args = "-file C:\coh\createUser.ps1 -userName " & arguments.username & " -userPassword " & arguments.password;
            var sql = "SELECT MAX(uid) as lastId FROM user_account";
            var lastId = queryExecute(sql, [], { datasource: 'cohauth' }).lastId + 1;
            args &= " -userId " & lastId;
            cfexecute(name ="C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe" arguments=args);
        }
        return;
    }

    // Determine whether or not an accunt already exists
    function accountExists(required string authName) {
        var sql = "
            SELECT account FROM user_auth WHERE account = ':authname'";
        sql = sql 
            .replace(":authname", arguments.authName);
        return queryExecute(sql, [], { datasource: 'cohauth' }).recordCount ? true : false;
    }

    // Query of toons online
    function getOnline() {
        var sql = "
            SELECT e.authName, e.Level, e.name, e2.originalPrimary, e2.originalSecondary, e.class
            FROM cohdb.dbo.ents e, cohdb.dbo.ents2 e2
            WHERE e.Active > 0 AND e.ContainerId = e2.ContainerId";
        return queryExecute(sql, [], { datasource = "cohdb" });
    }

    // Query of toons for a given uid
    function getEnts(required numeric authId) {
        var sql = "
            SELECT e.authName, e.Level, e.name, e2.originalPrimary, e2.originalSecondary, e.class, e.influencePoints
            FROM cohdb.dbo.ents e, cohdb.dbo.ents2 e2
            WHERE e.AuthId = :authId AND e.ContainerId = e2.ContainerId
            ORDER BY e.Level DESC";
        sql = sql 
         .replace(":authId", arguments.authId);
        return queryExecute(sql, [], { datasource = "cohdb" });
    }

}