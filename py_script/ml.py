#!/usr/bin/python 
import sys
import smtplib
from email.mime.text import MIMEText
import time
import os

vid = sys.argv[1]
tm= time.strftime('%m-%d-%H:%M',time.localtime(time.time()))
msg_from='2643426900@qq.com'                     #发送方邮箱
#msg_from='1571987386@qq.com'                     #发送方邮箱
passwd='gesgmudagzjqdjeb'                       #填入发送方邮箱的授权码
msg_to=['528501030@qq.com','1571987386@qq.com']                      #收件人邮箱
                            
subject="video update"+str(tm)
content="http://www.ixigua.com/a"+str(vid)

msg = MIMEText(content)
msg['Subject'] = subject
msg['From'] = msg_from
msg['To'] =','.join(msg_to)
try:
    s = smtplib.SMTP_SSL("smtp.qq.com",465)     #邮件服务器及端口号
    s.login(msg_from, passwd)
    s.sendmail(msg_from, msg_to, msg.as_string())
    print('successful')
except smtplib.SMTPException as e:
    print('fail')
finally:
    s.quit()
