Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

function Get-UserOption {
    param(
        [string]$Title = "Select an option",
        [string]$Prompt = "Choose an option:",
        [string[]]$ButtonLabels = @()  # up to 6 button texts
    )

    $form = New-Object System.Windows.Forms.Form
    $form.Text = $Title
    $form.Size = New-Object System.Drawing.Size(300, (100 + ($ButtonLabels.Count * 50)))
    $form.StartPosition = "CenterScreen"

    $label = New-Object System.Windows.Forms.Label
    $label.Text = $Prompt
    $label.Size = New-Object System.Drawing.Size(260,30)
    $label.Location = New-Object System.Drawing.Point(20,20)
    $form.Controls.Add($label)

    $top = 60
    $i = 0

    foreach ($btnText in $ButtonLabels) {
        if (![string]::IsNullOrWhiteSpace($btnText)) {
            $btn = New-Object System.Windows.Forms.Button
            $btn.Text = $btnText
            $btn.Size = New-Object System.Drawing.Size(240,40)
            $btn.Location = New-Object System.Drawing.Point(20,$top)
            $top += 50

            # set DialogResult and save value in Tag
            $btn.Add_Click({
                $form.Tag = $btnText
                $form.DialogResult = [System.Windows.Forms.DialogResult]::OK
                $form.Close()
            })

            $form.Controls.Add($btn)

            $i++
            if ($i -ge 6) { break }  # cap at 6 buttons
        }
    }

    if ($form.ShowDialog() -eq [System.Windows.Forms.DialogResult]::OK) {
        return $form.Tag
    }
    return $null
}
