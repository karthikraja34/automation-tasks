## DISK USAGE AUTOMATION

---

>Install [python3](https://www.python.org/ftp/python/3.6.5/python-3.6.5.exe)

>Install module
```python
pip install psutil
```
Then to run
```python
py -3 prog2.py
```
or
```python
python prog2.py
```

### Configurations

Write the name and mail ids in contacts.txt file.

The contents of mail are retrieved from message.txt .
>Note : message.txt contains template literals.The values for template literals are given from program dynamically.


### Disk Limit

The LIMIT variable  in program contains the limit ,if disk usage exceeds this limits mail is sent from mail server.

>Note : The limit should be given in bytes

default limit given in 1.0G which in bytes is 1073741824.

> MB to bytes can be converted by multiplying 1024
and GB to bytes by 1024^2

or simply use [online converter](http://whatsabyte.com/P1/byteconverter.htm)

### Mail Server config
change <strong>MY_ADDRESS</strong> and <strong>PASSWORD</strong> variable from program to your mail server mail id and password.

In line no <strong>62</strong> change smtp server address and port address 
>Note : Normally non ssl port numbers are 25 and 587

change from address,to address and subject from line no 81,82,83.