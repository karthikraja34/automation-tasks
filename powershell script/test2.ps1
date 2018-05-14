$MailArgs = @{
    From       = 'sample@blockchainproject.com'
    To         = '<rajakarthik131@gmail.com>'
    Cc         = @("Marcel <hibekibaca@bitwhites.top>", "Marcelt <ram@bitwhites.top>")
    Subject    = 'A subject '
    Body       = '  <div style="background:green;padding:10px">
                    <h1 style="color:#fff"> Mail message content goes here! </h1>
                    </div>
                    
                    <h5>Hi ! This message is typed as html.To use normal message remove <strong>-BodyAsHtml</strong> parameter. </h5>
                 ' 
    Attachment= "D:\custom works\Playground\shell scripts\powershell script\message.txt"
    SmtpServer = 'smtp.stackmail.com'
    Port       = 25
    UseSsl     = $true
    Credential = New-Object pscredential 'sample@blockchainproject.com',$('Kb7e4624a' |ConvertTo-SecureString -AsPlainText -Force)
}
Send-MailMessage @MailArgs -BodyAsHtml