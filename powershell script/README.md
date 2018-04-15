## Instructions

To execute diskspace.ps1 ,double click test.bat.
or right click diskspace.ps1 and select <strong>run with powershell </strong>

### Configurations

```powershell
Send-EMail -EmailTo "rajakarthik131@gmail.com" -Body "hello" -Subject "YOUR SUBJECT" -password "Kb7e4624a"
```

change the above parameters 

> Note : The from mail is same as the smtp mail ,it can be changed to be different .

 In the diskspace.ps1 change the LIMIT variable to set disk usage limit.

 > Note : The LIMIT  should be given as bytes.

 ### To send Attachment

 Uncomment the lines from the powershell program to attach files and provide path of file.

```powershell
Send-EMail -EmailTo "rajakarthik131@gmail.com" -Body "YOUR MESSAGE" -Subject "YOUR SUBHECT" -password "Kb7e4624a" -Attachment "D:\custom works\Playground\shell scripts\powershell script\message.txt"
```
In the above script last argument is attachment location.


> Important : while executing powershell scripts if it shows exception or if it shows access denied . Follow the below instructions.

To display the current execution policy, you need to enter the command

Get-ExecutionPolicy
at a PowerShell prompt (which will look like PS C:\> assuming the current location is C:\). To set the execution policy, enter the command

Set-ExecutionPolicy policy
where policy is one of the policy names (e.g., RemoteSigned).

for ex : <strong> Set-ExecutionPolicy RemoteSigned </strong>