# import subprocess
# disk = subprocess.Popen(['df', '-h'], stdout=subprocess.PIPE)
# diskusage = disk.communicate()
# print (diskusage)

import psutil
import smtplib

from string import Template
from email.mime.multipart import MIMEMultipart
from email.mime.text import MIMEText



MY_ADDRESS = 'sample@blockchainproject.com'
PASSWORD = 'Kb7e4624a'
LIMIT = 1073741824    #   Set the limit ( Note : The Limit is in bytes format )

def get_contacts(filename):
    """
    Return two lists names, emails containing names and email addresses
    read from a file specified by filename.
    """
    
    names = []
    emails = []
    with open(filename, mode='r', encoding='utf-8') as contacts_file:
        for a_contact in contacts_file:
            names.append(a_contact.split()[0])
            emails.append(a_contact.split()[1])
    return names, emails


def read_template(filename):
    """
    Returns a Template object comprising the contents of the 
    file specified by filename.
    """
    
    with open(filename, 'r', encoding='utf-8') as template_file:
        template_file_content = template_file.read()
    return Template(template_file_content)

   
def bytes2human(n):
    symbols = ('K', 'M', 'G', 'T', 'P', 'E', 'Z', 'Y')
    prefix = {}
    for i, s in enumerate(symbols):
        prefix[s] = 1 << (i + 1) * 10
    for s in reversed(symbols):
        if n >= prefix[s]:
            value = float(n) / prefix[s]
            return '%.1f%s' % (value, s)
    return "%sB" % n


def main():
    names, emails = get_contacts('contacts.txt') # read contacts
    message_template = read_template('message.txt')

    # set up the SMTP server
    s = smtplib.SMTP(host='smtp.stackmail.com', port=587)
    s.starttls()
    s.login(MY_ADDRESS, PASSWORD)

    # For each contact, send the email:
    for name, email in zip(names, emails):
        msg = MIMEMultipart()       # create a message

        
        total = psutil.disk_usage('C:\\').used
        free  =  psutil.disk_usage('C:\\').free

        # add in the actual person name to the message template
        message = message_template.substitute(person=name.title(),free=bytes2human(free),total=bytes2human(total),limit=bytes2human(LIMIT))
     
        # Prints out the message body for our sake
        print(message)

        # setup the parameters of the message
        msg['From']=MY_ADDRESS
        msg['To']=email
        msg['Subject']="This is TEST"
        
        # add in the message body
        msg.attach(MIMEText(message, 'plain'))
        
         
        print(total)
        print(bytes2human(total))

        if (total > LIMIT):
            # send the message via the server set up earlier.
            s.send_message(msg)
            print("Message Sent")
            del msg
        
    # Terminate the SMTP session and close the connection
    s.quit()
    
if __name__ == '__main__':
    main()
