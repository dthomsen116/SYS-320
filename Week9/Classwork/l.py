import paramiko
from getpass import getpass

#create pass prompt
thepass = getpass(prompt="Please enter SSH Password")

#host information
host = "192.168.6.71"
port = 2222
#username = test 
#password = password
username = "david.thomsen"
password = thepass

try:
    
    ssh = paramiko.SSHClient()
    ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy())
    ssh.connect(host, port, username, password)
    print('*Hacker voice*: "I\'m in" ')
    
except paramiko.AuthenticationException:
    print("auth failed")