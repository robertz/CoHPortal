component output="false" {

    function getAccounts() {
        return queryExecute("SELECT * FROM user_account ORDER BY last_login DESC", [], { datasource = "cohauth"});
    }

       // Query of all toons
       function getEnts() {
        var sql = "
            SELECT e.authName, e.Level, e.name, e.active, e2.originalPrimary, e2.originalSecondary, e.class, e.influencePoints
            FROM cohdb.dbo.ents e, cohdb.dbo.ents2 e2
            WHERE e.ContainerId = e2.ContainerId
            ORDER BY e.Level DESC";
        return queryExecute(sql, [], { datasource = "cohdb" });
    } 
}