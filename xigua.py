#!/usr/bin/python 
# -*- coding:utf-8 -*-
import selenium
from selenium import webdriver
import time
import os
import sys
import json
from pyquery import PyQuery as pq
import re

browser = webdriver.PhantomJS()
url = 'https://www.365yg.com/c/user/6597794261/'

f = open('usr.json','r')
data = json.loads(f.read())
log = open('index','w')
tm= time.strftime('%m-%d',time.localtime(time.time()))
browser.get(data[0]["url"])
content = browser.page_source
#pattern = re.compile('.*?video-time">(.*?)</span.*?href="/item/(.*?)/" tar.*?img-duration">(.*?)</span.*?',re.S)
#items = re.findall(pattern,content)
#print(items)
#for i in items:
#        url1 = str(urlb)+str(i)
#        print url1
#        url1 = 'http://www.tu11.com/BEAUTYLEGtuimo/2018/10567.html'
#        request1 = urllib2.Request(url1,headers = headers)
#        response1 = urllib2.urlopen(request1)
#        content1 =  response1.read()
#        soup = BeautifulSoup(content1).prettify()
#        print soup
#        pattern1 = re.compile('center.*?img\ src="(.*?)"\ /></p',re.S)
#        pattern1 = re.compile(str(tm)+'.*?img\ src="(.*?)"\ /></p',re.S)
#        img_url = re.findall(pattern1,content1)
#   print(i)
#log.write(str(i)+'\n')
#log.write(items)
log.write(content)
log.close()
