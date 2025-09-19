Add-Type -AssemblyName System.Windows.Forms

function Select-File {
    param(
        [string]$Extension = "*",  # example: "txt" or "bacpac"
        [string]$Title = "Select a file"
    )

    $ofd = New-Object System.Windows.Forms.OpenFileDialog
    $ofd.Filter = "$Extension files (*.$Extension)|*.$Extension"
    $ofd.Title  = $Title

    if ($ofd.ShowDialog() -eq [System.Windows.Forms.DialogResult]::OK) {
        return $ofd.FileName
    }
    return $null
}

# Example usage
Show-FilePicker -Title "Pick" -Extension "txt"
