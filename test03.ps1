## Load assembly
[System.Reflection.Assembly]::LoadWithPartialName("Microsoft.SqlServer.TransactSql.ScriptDom") | Out-Null
$dom = Microsoft.SqlServer.TransactSql.ScriptDom
$ParseOptions = New-Object Microsoft.SqlServer.Management.SqlParser.Parser.ParseOptions

## No Errors
$Sql = "Select * from sys.sysdatabases"
$Script = [Microsoft.SqlServer.Management.SqlParser.Parser.Parser]::Parse($SQL, $ParseOptions)
$Script.Errors

