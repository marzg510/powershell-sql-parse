$start_create = $false
foreach ($l in Get-Content .\input01.sql) {
  if ( $l -match '^\)' -And $start_create ) {
    $start_create = $false
    break;
  }
  if ( $start_create ) {
    Write-Host $l
  }
  if ( $l -match 'CREATE TABLE (.*) \(' ) {
    Write-Host "table name $($Matches[1])"
    $start_create = $true
  }
}

