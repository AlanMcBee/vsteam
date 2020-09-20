<!-- #include "./common/header.md" -->

# Add-VSTeamWorkItemLink

## SYNOPSIS

<!-- #include "./synopsis/Add-VSTeamWorkItemLink.md" -->

## SYNTAX

Add-VSTeamWorkItemLink [-Id] &lt;Int32> [-LinkId] &lt;Int32[]> [[-Relationship] &lt;String>] [-Comment &lt;String>] [-ErrorPolicy { Fail | Omit }] [-Force]

## DESCRIPTION

Add-VSTeamWorkItemLink will add one or more links from an existing work item to one or more different existing work items.

## EXAMPLES

### -------------------------- EXAMPLE 1 --------------------------

```PowerShell
PS C:\> Set-VSTeamDefaultProject Demo
PS C:\> Add-VSTeamWorkItemLink -Id 47 -LinkId 89

ID  Title                 LinkId  LinkedTitle          Relationship
--  -----                 ------  -----------          ------------
47  The source work item      89  A related work item  System.LinkTypes.Related
```

### -------------------------- EXAMPLE 2 --------------------------

```PowerShell
PS C:\> Set-VSTeamDefaultProject Demo
PS C:\> Add-VSTeamWorkItemLink -Id 47 -LinkId 89, 107

ID  Title                 LinkId  LinkedTitle                Relationship
--  -----                 ------  -----------                ------------
47  The source work item      89  A related work item        System.LinkTypes.Related
47  The source work item     107  Another related work item  System.LinkTypes.Related
```

### -------------------------- EXAMPLE 3 --------------------------

```PowerShell
PS C:\> Set-VSTeamDefaultProject Demo
PS C:\> Add-VSTeamWorkItemLink -Id 48 -LinkId 91, 92 -Relationship Child -Comment 'Move two child tasks from old requirement to new requirement' -Force

ID  Title                 LinkId  LinkedTitle              Relationship
--  -----                 ------  -----------              ------------
48  The parent work item      91  A child work item        System.LinkTypes.Hierarchy-Forward
48  The parent work item      92  Another child work item  System.LinkTypes.Hierarchy-Forward
```

## PARAMETERS

<!-- #include "./params/projectName.md" -->

### -Id

The ID of the work item for which the relationship is being added.

```yaml
Type: Int32
Required: True
Accept pipeline input: true (ByPropertyName, ByValue)
```

### -LinkId

The IDs of one or more work items to use as targets of the relationship.

```yaml
Type: Int32[]
Required: True
Accept pipeline input: true (ByPropertyName, ByValue)
```

### -Relationship

The relationship link type that will be established between the source work item (identified with the -Id parameter) and the one or more target work items (identified with the -LinkId parameter).

```yaml
Type: string
Required: False
```

The value of the relationship link type is defined by the project's process. For a list of available link types for a process, use the `Get-VSTeamWorkItemLinkType` cmdlet.

The value may be one of these (in order of decreasing likelihood of ambiguity):
 - The Forward or Reverse name of the link type, provided the name is unique to the process, with any spaces removed between words
 - The simple relationship name of the link type, suffixed with -forward or -reverse if the link type topology is anything except Network, provided the simple relationship name is unique to the process
 - The fully-qualified reference name of the link type, suffixed with -forward or -reverse if the link type topology is anything except Network

For example, consider how the parent-child relationship type works. The simple relationship name is `Hierarchy`, and the fully-qualified reference name is `System.LinkTypes.Hierarchy`. 
Because this relationship link type is a Tree type topology, you must indicate whether the relationship direction is forward (pointing away from the source work item) or reverse (pointing toward the source work item).

The first possible way to choose the relationship type is by using either a Forward or a Reverse name:
 - `Child` (this is the Forward name)
 - `Parent` (this is the Reverse name)

If you choose instead use the simple relationship name or the fully-qualified reference name, you must include -Forward or -Reverse suffixes:
 - `Hierarchy-Forward` (equivalent to `Child`)
 - `Hierarchy-Reverse` (equivalent to `Parent`)
 - `System.LinkTypes.Hierarchy-Forward` (equivalent to `Child`)
 - `System.LinkTypes.Hierarchy-Reverse` (equivalent to `Parent`)

*Standard Relationship Link Types (for Tree, Dependency, and Directed Network topologies)*

| Fully-qualified Reference Name | Simple relationship prefix | Forward Name | Reverse Name |
|--------------------------------|----------------------------|--------------|--------------|
| System.LinkTypes.Dependency | Dependency | Successor | Predecessor |
| System.LinkTypes.Duplicate | Duplicate | Duplicate | DuplicateOf |
| System.LinkTypes.Hierarchy | Hierarchy | Child | Parent |
| Microsoft.VSTS.Common.Affects | Affects | Affects | AffectedBy |
| Microsoft.VSTS.Common.TestedBy | TestedBy | TestedBy | Tests |
| Microsoft.VSTS.TestCase.SharedParameterReferencedBy | SharedParameterReferencedBy | ReferencedBy | References |
| Microsoft.VSTS.TestCase.SharedStepReferencedBy | SharedStepReferencedBy | TestCase | SharedSteps |

*Standard Relationship Link Types (for Network topologies)*

| Fully-qualified Reference Name | Simple relationship name |
|---|---|
| System.LinkTypes.Related | Related |


### -ErrorPolicy

The flag to control error policy in a bulk update work items request.  The acceptable values for this parameter are:

- Fail
- Omit

```yaml
Type: String
Required: True
Default value: omit
```

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS

[Get-VSTeamWorkItemLink](Get-VSTeamWorkItemLink.md)

[Remove-VSTeamWorkItemLink](Remove-VSTeamWorkItemLink.md)

[Get-VSTeamWorkItemLinkType](Get-VSTeamWorkItemLinkType.md)
