function GetTableNameAndColumnNames($file) {
  $start_create = $false
  $cols = New-Object System.Collections.ArrayList
  foreach ($l in Get-Content $file) {
    if ( $l -match '^\)' -And $start_create ) {
      $start_create = $false
      break;
    }
    if ( $start_create ) {
      $c = $l.Trim().Split(" ")[0]
      [void] $cols.Add($c)
    }
    if ( $l -match 'CREATE TABLE (.*) \(' ) {
      $t = $Matches[1]
      $start_create = $true
    }
  }
  return $t, $cols
}

$data = GetTableNameAndColumnNames(".\input01.sql")

Write-Host $data.length
Write-Host $data[0] # tablename
Write-Host $data[1] # columns

