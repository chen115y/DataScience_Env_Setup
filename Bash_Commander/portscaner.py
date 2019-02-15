#!/usr/bin/env python
# -*- coding:utf-8 -*-
import socket, time, thread
socket.setdefaulttimeout(3)

def socket_port(ip, port):
    """
    Input IP and port, then scan those ports if they are used
    """
    try:
        if port >=65535:
            print("Scan is finished\n") 
        s=socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        result=s.connect_ex((ip, port))
        if result==0:
            lock.acquire()
            print(ip,':',port,'port is used\n')
            lock.release()
    except:
        print('Port scan is abnormal\n')

def ip_scan(ip):
    """
    Input IP and then scan IP's 0-65534 ports
    """
    try:
        print('Scan is starting at %s\n' % ip)
        start_time=time.time()
        for i in range(0,65534):
            thread.start_new_thread(socket_port,(ip, int(i)))
        print('Scan is finished. Time used is %.2f\n' %(time.time()-start_time))
    except:
        print('There are something wrong when scaning the ip\n')

if __name__=='__main__':
   url=raw_input('Input the ip you want to scan: ')
   lock=thread.allocate_lock()
   ip_scan(url)
