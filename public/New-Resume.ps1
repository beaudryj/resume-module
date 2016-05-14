function New-Resume {
   [CmdletBinding()]
   Param(
       [Parameter(Mandatory=$true)]
       [string]$Name,
       [Parameter(Mandatory=$true)]
       [string]$Email,
       [Parameter(Mandatory=$true)]
       [string]$PhoneNumber,
       [Parameter(Mandatory=$true)]
       [int]$NumberOfJobs
   ) 
   
   $FilePath = Get-Item $PSScriptRoot
   $PathofResume = $FilePath.parent.FullName + "\Work-Experience\test.json"

   Set-Contact -Name $Name -Email $Email -PhoneNumber $PhoneNumber -PathofResume $PathofResume   
   $OperatingSystems = Read-Host -prompt "Operating Systems"
   $Languages = Read-Host -prompt "Languages"
   $Tools = Read-Host -prompt "Tools"
   $Related = Read-Host -prompt "Related Skills"   
   Set-TechnicalSkills -OperatingSystems $OperatingSystems -Languages $Languages -Tools $Tools -Related $Related -PathofResume $PathofResume   
   for ($i = 1; $i -le $NumberOfJobs; $i++) {
       $Company = Read-Host -prompt "Company Worked"
       $DatesEmployed = Read-host -Prompt "Dates of Employment"
       $Position = Read-Host -Prompt "Position Worked"
       $WorkDescription = Read-Host -Prompt "Description of Role"
        
       Set-JobHistory -Company $Company -DatesEmployed $DatesEmployed -Position $Position -WorkDescription $WorkDescription -PathofResume $PathofResume
   }
  
}
