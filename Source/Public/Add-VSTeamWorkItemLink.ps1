function Add-VSTeamWorkItemLink {
   [CmdletBinding()]
   param(
      [Parameter(Mandatory = $true)]
      [int] $Id,

      [Parameter(Mandatory = $false)]
      [int] $LinkId,

      [Parameter(Mandatory = $false)]
      [string] $Relationship,

      [Parameter(ParameterSetName = 'List')]
      [ValidateSet('fail', 'omit')]
      [string] $ErrorPolicy = 'omit'
   )

   Process {
   }
}