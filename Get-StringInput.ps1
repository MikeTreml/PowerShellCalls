Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

function Get-StringInput {
    param(
        [string]$Prompt = "Enter value:",
        [string]$Title = "Input",
        [string]$Default = ""
    )

    $form = New-Object System.Windows.Forms.Form
    $form.Text = $Title
    $form.Size = New-Object System.Drawing.Size(400,150)
    $form.StartPosition = "CenterScreen"

    $label = New-Object System.Windows.Forms.Label
    $label.Text = $Prompt
    $label.Size = New-Object System.Drawing.Size(360,20)
    $label.Location = New-Object System.Drawing.Point(20,20)
    $form.Controls.Add($label)

    $textbox = New-Object System.Windows.Forms.TextBox
    $textbox.Size = New-Object System.Drawing.Size(340,20)
    $textbox.Location = New-Object System.Drawing.Point(20,50)
    $textbox.Text = $Default
    $form.Controls.Add($textbox)

    $btnOK = New-Object System.Windows.Forms.Button
    $btnOK.Text = "OK"
    $btnOK.Size = New-Object System.Drawing.Size(80,30)
    $btnOK.Location = New-Object System.Drawing.Point(150,80)
    $form.Controls.Add($btnOK)

    $result = $null
    $btnOK.Add_Click({
        $result = $textbox.Text
        $form.Close()
    })

    $form.ShowDialog() | Out-Null
    return $result
}
