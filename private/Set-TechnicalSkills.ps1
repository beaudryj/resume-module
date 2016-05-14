function Set-TechnicalSkills {
   [CmdletBinding()]
   Param(
       [string]$OperatingSystems,
       [string]$PathofResume,
       [string]$Languages,
       [string]$Tools,
       [string]$Related
   ) 
   
      
   $Skills = [ordered] @{
       "Operating Systems" = $OperatingSystems
       "Languages" = $Languages
       "Tools" = $Tools
       "Related Skills" = $Related
    }
   
   $TechnicalSkills = New-Object -TypeName psobject
   Foreach ( $item in $Skills.Keys ) {
      $SkillSet = $Skills.$item.split(",")
      $technicalSkills | Add-Member -MemberType NoteProperty -Name $item  -Value $SkillSet
   }
     
     $Resume = Get-Content $PathofResume | ConvertFrom-Json
     $Resume | Add-Member -MemberType NoteProperty -Name "Technical Skills" -Value $TechnicalSkills
     Write-output $Resume | Convertto-json -depth 5 | Out-File -Filepath $PathofResume 
     
}
