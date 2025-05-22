$ErrorActionPreference = 'SilentlyContinue'

Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

Add-Type -Name Window -Namespace Console -MemberDefinition '
[DllImport("user32.dll")]
public static extern bool SetWindowPos(IntPtr hWnd, IntPtr hWndInsertAfter, int X, int Y, int cx, int cy, uint uFlags);

[DllImport("user32.dll")]
public static extern int SetWindowLong(IntPtr hWnd, int nIndex, int dwNewLong);

[DllImport("user32.dll")]
public static extern int GetWindowLong(IntPtr hWnd, int nIndex);

[DllImport("user32.dll")]
public static extern bool ShowWindow(IntPtr hWnd, int nCmdShow);
'

$HWND_TOPMOST = New-Object -TypeName System.IntPtr -ArgumentList (-1)
$SWP_NOMOVE = 0x0002
$SWP_NOSIZE = 0x0001
$WS_EX_TOOLWINDOW = 0x00000080
$WS_EX_NOACTIVATE = 0x08000000
$GWL_EXSTYLE = -20
$screen = [System.Windows.Forms.Screen]::PrimaryScreen.Bounds
$script:currentWidth = 1

$form = New-Object System.Windows.Forms.Form
$form.Width = $script:currentWidth
$form.Height = $screen.Height
$form.StartPosition = "Manual"
$form.Location = New-Object System.Drawing.Point(($screen.Width - $script:currentWidth), 0)
$form.FormBorderStyle = "None"
$form.TopMost = $true
$form.ShowInTaskbar = $false
$form.BackColor = [System.Drawing.Color]::Black
$form.TransparencyKey = [System.Drawing.Color]::Black
$form.Opacity = 1
$form.Text = "BatBar"
$form.ShowIcon = $false

$batteryBar = New-Object System.Windows.Forms.Panel
$batteryBar.Width = $script:currentWidth
$batteryBar.Height = $screen.Height
$batteryBar.BackColor = [System.Drawing.Color]::Green
$form.Controls.Add($batteryBar)

$batteryBar.Add_MouseWheel({
    $delta = $_.Delta / 120
    Update-BarWidth ($script:currentWidth + $delta)
})

$batteryBar.Add_MouseClick({
    if ($_.Button -eq [System.Windows.Forms.MouseButtons]::Right -and
        [System.Windows.Forms.Control]::ModifierKeys -eq [System.Windows.Forms.Keys]::Shift) {
        $form.Close()
    }
})

function Update-BatteryStatus {
    $battery = Get-WmiObject Win32_Battery
    if ($battery) {
        $percentage = $battery.EstimatedChargeRemaining
        $isCharging = $battery.BatteryStatus -eq 2

        $newHeight = [Math]::Round(($screen.Height * $percentage) / 100)

        if ($isCharging) {
            $batteryBar.BackColor = [System.Drawing.Color]::DeepSkyBlue
            $form.Text = "BatBar ⚡ $percentage%"
        }
        else {
            # Fade from Red (low) -> Orange -> Yellow -> GreenYellow -> Green (high)
            # Define color stops
            $colors = @(
                @{ Pct = 0;   R = 255; G = 0;   B = 0   },   # Red
                @{ Pct = 20;  R = 255; G = 140; B = 0   },   # Orange
                @{ Pct = 35;  R = 255; G = 255; B = 0   },   # Yellow
                @{ Pct = 50;  R = 173; G = 255; B = 47  },   # GreenYellow
                @{ Pct = 65;  R = 0;   G = 128; B = 0   },   # Green
                @{ Pct = 100; R = 0;   G = 250; B = 0   }    # Green (for 100%)
            )

            # Find the two stops to interpolate between
            for ($i = 0; $i -lt $colors.Count - 1; $i++) {
                $low = $colors[$i]
                $high = $colors[$i + 1]
                if ($percentage -ge $low.Pct -and $percentage -le $high.Pct) {
                    $range = $high.Pct - $low.Pct
                    if ($range -eq 0) { $t = 0 } else { $t = ($percentage - $low.Pct) / $range }
                    $r = [int]($low.R + ($high.R - $low.R) * $t)
                    $g = [int]($low.G + ($high.G - $low.G) * $t)
                    $b = [int]($low.B + ($high.B - $low.B) * $t)
                    $batteryBar.BackColor = [System.Drawing.Color]::FromArgb(255, $r, $g, $b)
                    break
                }
            }
            $form.Text = "BatBar | $percentage%"
        }

        $batteryBar.Height = $newHeight
        $centerY = ($screen.Height - $newHeight) / 2
        $batteryBar.Location = New-Object System.Drawing.Point(0, $centerY)
    }
}

function Update-BarWidth {
    param ([int]$newWidth)
    $script:currentWidth = [Math]::Max(1, [Math]::Min(10, $newWidth))
    $form.Width = $script:currentWidth
    $batteryBar.Width = $script:currentWidth
    $form.Location = New-Object System.Drawing.Point(($screen.Width - $script:currentWidth), 0)
}

$timer = New-Object System.Windows.Forms.Timer
$timer.Interval = 5000
$timer.Add_Tick({ Update-BatteryStatus })
$timer.Start()

$form.Add_MouseWheel({
    $delta = $_.Delta / 120
    Update-BarWidth ($script:currentWidth + $delta)
})

$form.Add_MouseClick({
    if ($_.Button -eq [System.Windows.Forms.MouseButtons]::Right -and
        [System.Windows.Forms.Control]::ModifierKeys -eq [System.Windows.Forms.Keys]::Shift) {
        $form.Close()
    }
})

$form.Add_Shown({
    $style = [Console.Window]::GetWindowLong($form.Handle, $GWL_EXSTYLE)
    $style = $style -bor $WS_EX_TOOLWINDOW -bor $WS_EX_NOACTIVATE
    [Console.Window]::SetWindowLong($form.Handle, $GWL_EXSTYLE, $style)
    [Console.Window]::SetWindowPos(
        $form.Handle,
        $HWND_TOPMOST,
        0, 0, 0, 0,
        ($SWP_NOMOVE -bor $SWP_NOSIZE)
    )
    $form.Activate()
})

$form.Add_FormClosing({
    if ($timer) { $timer.Dispose() }
    if ($batteryBar) { $batteryBar.Dispose() }
})

# Initial update and show form
Update-BatteryStatus
[void]$form.ShowDialog()
