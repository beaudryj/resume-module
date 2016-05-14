function Set-JobHistory {
   [CmdletBinding()]
   Param(
       [string]$Company,
       [string]$DatesEmployed,
       [string]$PathofResume,
       [string]$Position,
       [string]$WorkDescription
   ) 
   
   $Experience = [ordered] @{
       "Dates Employed" = $DatesEmployed
       "Position" = $Position
       "Work Description" = $WorkDescription
    }
   
   $WorkExperience = New-Object -TypeName psobject
   Foreach ( $item in $Experience.Keys ) {
      $WorkExperience | Add-Member -MemberType NoteProperty -Name $item  -Value $Experience.$item
   }
   
     $Resume = Get-Content $PathofResume | ConvertFrom-Json
     $Resume | Add-Member -MemberType NoteProperty -Name $Company -Value $WorkExperience

     Write-output $Resume | Convertto-json -depth 5 | Out-File -Filepath $PathofResume 
}