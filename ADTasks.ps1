
$Groupbase = {
    param($CommandName, $ParameterName, $OUwordToComplet, $CommandAst, $fakeBoundParameter)

    $Groups = Get-ADGroup -Filter * |Where-Object -FilterScript {$PSItem.name -match $OUWordToComplete}

    foreach ($Group in $Groups) {
        New-CompletionResult -CompletionText $Group.Name -ListItemText $Group.Name
    }
}
Register-ArgumentCompleter -CommandName @('Get-ADgroup', 'Set-ADGroup', 'Get-ADGroupMember') -ParameterName Identity -ScriptBlock $Groupbase

$UserInfo = {
    param($CommandName, $ParameterName, $UserWordToComplete)
        $usersInfos = Get-ADUser -Filter * |Where-Object -FilterScript {$PSItem.name -match $UserWordToComplete}
    
    foreach ($User in $usersInfos) {
        New-CompletionResult -CompletionText $User.name -ToolTip $User.DistinguishedName
    }
}
Register-ArgumentCompleter -CommandName @('Get-ADUser','Set-ADUser', 'Remove-ADUser') -ParameterName Identity -ScriptBlock $UserInfo