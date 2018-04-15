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
      
} #End Function Send-EMail
# Send-EMail -EmailTo "rajakarthik131@gmail.com" -Body "YOUR MESSAGE" -Subject "YOUR SUBJECT" -password "Kb7e4624a" -Attachment "D:\custom works\Playground\shell scripts\powershell script\message.txt"
Send-EMail -EmailTo "rajakarthik131@gmail.com" -Body "hello" -Subject "YOUR SUBJECT" -password "Kb7e4624a"