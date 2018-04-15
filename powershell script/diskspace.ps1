function GetDiskSizeInfo($drive) {
    $diskReport = Get-WmiObject Win32_logicaldisk
    $drive = $diskReport | Where-Object { $_.DeviceID -eq $drive}
   
    $result = @{
        Size = $drive.Size
        FreeSpace = $drive.Freespace
        UsedSpace = $drive.Size - $drive.Freespace
    }
    return $result
}

Function Send-EMail {
   Param (
        [Parameter(`
            Mandatory=$true)]
        [String]$EmailTo,
        [Parameter(`
            Mandatory=$true)]
        [String]$Subject,
        [Parameter(`
            Mandatory=$true)]
        [String]$Body,
        [Parameter(`
            Mandatory=$true)]
       
        [String]$Password#,
        #   [Parameter(`
        #     Mandatory=$true)]
        # [String]$Attachment
    )

		$EmailFrom = "sample@blockchainproject.com"
        $SMTPServer = "smtp.stackmail.com" 
        $SMTPMessage = New-Object System.Net.Mail.MailMessage($EmailFrom,$EmailTo,$Subject,$Body)
        # $Att = New-Object System.Net.Mail.Attachment($Attachment)
        # $SMTPMessage.Attachments.add($Att) 
        $SMTPClient = New-Object Net.Mail.SmtpClient($SmtpServer, 25) 
        $SMTPClient.EnableSsl = $true
        $SMTPClient.Credentials = New-Object System.Net.NetworkCredential($EmailFrom, $Password); 
        $SMTPClient.Send($SMTPMessage)
        Remove-Variable -Name SMTPClient
        Remove-Variable -Name Password
      } 

$diskspace = GetDiskSizeInfo "C:"

write-host $diskspace.FreeSpace " " $diskspace.Size " " $diskspace.UsedSpace

$Limit = 1
If ($diskspace.UsedSpace -gt 0) {

#   Send-EMail -EmailTo "rajakarthik131@gmail.com" -Body "YOUR MESSAGE" -Subject "YOUR SUBHECT" -password "Kb7e4624a" -Attachment "D:\custom works\Playground\shell scripts\powershell script\message.txt"
    Send-EMail -EmailTo "rajakarthik131@gmail.com" -Body "hello" -Subject "YOUR SUBJECT" -password "Kb7e4624a"
}