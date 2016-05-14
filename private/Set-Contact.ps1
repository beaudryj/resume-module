function Set-Contact {
   [CmdletBinding()]
   Param(
       [string]$PathofResume,
       [string]$Name,
       [string]$Email,
       [string]$PhoneNumber
   ) 
   
   $Contact = [ordered] @{
       "Email" = $Email
       "Phone Number" = $PhoneNumber
    }
    
   $ContactInfo = New-Object -TypeName psobject
   Foreach ( $item in $Contact.Keys ) {
      $ContactInfo | Add-Member -MemberType NoteProperty -Name $item  -Value $Contact.$item
   }
   
     $Candidate = New-Object -TypeName psobject
     $Candidate | Add-Member -MemberType NoteProperty -Name $Name -Value $ContactInfo
     
     Write-output $Candidate | Convertto-json -depth 5 | Out-File -Filepath $PathofResume 
     
}