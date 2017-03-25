$EventID = {
    param($CommandName, $ParameterName, $WordToComplete)

    $Instances = Import-Csv D:\PSTesting\Events.csv
    foreach($Instance in $Instances){
        New-CompletionResult -CompletionText $Instance.EventID -ToolTip $Instance.Message -ListItemText $Instance.EventID
    }
}
Register-ArgumentCompleter -CommandName @( 'Get-EventLog' ) -ParameterName InstanceID -ScriptBlock $EventID