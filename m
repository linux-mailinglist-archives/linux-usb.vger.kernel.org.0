Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 99F57177D34
	for <lists+linux-usb@lfdr.de>; Tue,  3 Mar 2020 18:18:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729068AbgCCRSD (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 3 Mar 2020 12:18:03 -0500
Received: from userp2130.oracle.com ([156.151.31.86]:59516 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727311AbgCCRSD (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 3 Mar 2020 12:18:03 -0500
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
        by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 023HDhf8176568;
        Tue, 3 Mar 2020 17:18:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2020-01-29;
 bh=Skf9XnzCXK3lqIRujkJYcdOEBhu5TmjSkrbMSXGVGpE=;
 b=iuy344ZOyTgsk3HP7goXl0WQdMl9n96sYZjtwL9HTLNqWfb4Vkbc9x9lqUK3Wbsyn7na
 W7ZzNpRuQFpB3qxuQaifDAlmwTEI2hxrG5ItrhucVHpNvS6fsLGZ2xh1iTc/A+MZr5gQ
 bneycyFDvrPnNpJu3HsRO/LjzK9w+Wx01JElT+GSeK0Kze2aQZa8zBR+Ig91peLjg7ql
 PVvXbru+Z873UiW21DUSC0/0hGq7GTzuXUhFuMnOAtBTafr77A40kIbwR7wrKXPdh3QQ
 HubkHRg45LXShfL42QjxLcu2/99hgfdMZii0dZ3XRi7x6tWvltWX1/BpBwZ2tRJPVin+ 1A== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by userp2130.oracle.com with ESMTP id 2yffcuguuj-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 03 Mar 2020 17:17:59 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 023HEjWg069276;
        Tue, 3 Mar 2020 17:17:59 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
        by userp3030.oracle.com with ESMTP id 2yg1em7rs4-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 03 Mar 2020 17:17:59 +0000
Received: from abhmp0012.oracle.com (abhmp0012.oracle.com [141.146.116.18])
        by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 023HHvTE016291;
        Tue, 3 Mar 2020 17:17:58 GMT
Received: from [192.168.1.126] (/47.220.71.223)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Tue, 03 Mar 2020 09:17:57 -0800
Subject: Re: Spurious EHCI interrupts with 5.2 and later on shutdown / init 6
 reboot .
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     linux-usb@vger.kernel.org
References: <Pine.LNX.4.44L0.2003031109160.1538-100000@iolanthe.rowland.org>
From:   John Donnelly <John.P.Donnelly@Oracle.com>
Message-ID: <240131f9-8912-4cb7-5702-e85d13e3e01f@Oracle.com>
Date:   Tue, 3 Mar 2020 11:17:52 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <Pine.LNX.4.44L0.2003031109160.1538-100000@iolanthe.rowland.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9549 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 suspectscore=0 spamscore=0
 mlxlogscore=999 malwarescore=0 bulkscore=0 mlxscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2001150001
 definitions=main-2003030117
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9549 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 mlxscore=0 bulkscore=0
 adultscore=0 suspectscore=0 spamscore=0 malwarescore=0 impostorscore=0
 priorityscore=1501 mlxlogscore=999 lowpriorityscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2001150001
 definitions=main-2003030117
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 3/3/20 10:15 AM, Alan Stern wrote:
> On Tue, 3 Mar 2020, John Donnelly wrote:
> 
>>> Let's try to be a little more precise.  You said this happens "every
>>> time a server is rebooted".  At first I thought you meant it happened
>>> during the boot process.  But the timestamps on these log messages
>>> indicate the unwanted IRQ happened 836 seconds _after_ boot, possibly
>>> also 336 seconds after.
>>>
>>> So when exactly do you see this?
>>>
>>        On shutdown - init 6
>>
>> Started Show Plymouth Reboot Screen.
>> [  OK  ] Unmounted RPC Pipe File System.
>> [  OK  ] Stopped Logout off all iSCSI sessions on shutdown.
>>           Stopping Open-iSCSI...
>> [  OK  ] Stopped Open-iSCSI.
>> [  OK  ] Unmounted /home.
>> [  OK  ] Stopped Dynamic System Tuning Daemon.
>> [  OK  ] Stopped Login Service.
>> [  OK  ] Stopped target User and Group Name Lookups.
>>           Stopping System Security Services Daemon...
>> [  OK  ] Stopped System Security Services Daemon.
>> [  OK  ] Stopped VDO volume services.
>> [  OK  ] Stopped System Logging Service.
>> [  OK  ] Stopped target Network is Online.
>> [  OK  ] Stopped target Network.
>>           Stopping Network Manager...
>>           Stopping Network Name Resolution...
>> [  OK  ] Stopped Network Name Resolution.
>> [  OK  ] Stopped Network Manager.
>>           Stopping D-Bus System Message Bus...
>> [  OK  ] Stopped Rollback uncommitted netcf network config change transactions.
>> [  OK  ] Stoppe[ 1523.374186] irq 18: nobody cared (try booting with the "irqpoll" option)
>> d D-Bus System M[ 1523.470444] handlers:
>> [ 1523.514197] [<0000000024f18691>] usb_hcd_irq
>> [ 1523.565284] [<0000000024f18691>] usb_hcd_irq
>> [ 1523.675772] Disabling IRQ #18
>> [  OK  ] Stopped target Basic System.
>> [  OK  ] Stopped Forward Password Requests to Plymouth Directory Watch.
>> [  OK  ] Stopped target Sockets.
>> [  OK  ] Closed Avahi mDNS/DNS-SD Stack Activation Socket.
>> [  OK  ] Closed Activation socket for spice guest agent daemon.
>> [  OK  ] Closed Open-iSCSI iscsiuio Socket.
>> [  OK  ] Closed CUPS Scheduler.
>> [  OK  ] Closed Virtual machine log manager socket.
>> [  OK  ] Closed Virtual machine lock manager socket.
>> [  OK  ] Closed Open-iSCSI iscsid Socket.
>> [  OK  ] Closed PC/SC Smart Card Daemon Activation Socket.
>> [  OK  ] Closed SSSD Kerberos Cache Manager responder socket.
>> [  OK  ] Stopped target Paths.
>> [  OK  ] Stopped CUPS Scheduler.
>> [  OK  ] Stopped target Slices.
>> [  OK  ] Removed slice Virtual Machine and Container Slice.
>> [  OK  ] Removed slice User and Session Slice.
>> [  OK  ] Closed D-Bus System Message Bus Socket.
>> [  OK  ] Stopped target System Initialization.
>> [  OK  ] Stopped target Swap.
>>     [ 1524.987084] reboot: Restarting system
> 
> All right.  You never made this clear.
> 
>>>>     Removing the modules BEFORE I do a shutdown does not produce the error - which is kind of surprising .
>>>
>>> What exactly does this mean?  Do you mean that the error does not occur
>>> at the time the module is removed?
>>
>>      Yes
> 
> No!  You mean that the error does not occur at the time when the system
> is shut down following module removal.  Right?
> 
>>>   Or do you mean that if you remove
>>> the module and then reboot, the error does not occur during the reboot?
>>
>>   Yes
> 
> Again, no.

  yes --  If I remove the module(s) ehci_pci and/or ehci_hcd prior to 
rebooting - the error does not occur

> 
>>> Or do you mean that if you remove the module and reboot, the error does
>>> not occur until the system is booted yet again?
>>>
>>
>>     Yes
> 
> And no.  I can't help if you don't give full and unambiguous answers.
 >>> Or do you mean that if you remove the module and reboot, the error does
 >>> not occur

  Yes

> 
>>>>    It appears the modules are actually loaded by the ramdisk too  - prior to getting to the single user mode when I built them as loadable module .. because I renamed them  so modprobe/udev  would not find them after systemd starts.
>>>
>>> This depends on the contents of your initramfs.  Most likely you
>>> rebuilt that along with the kernel, so if the kernel uses modules for
>>> the EHCI drivers then so does the initramfs.
>>
>>      Yes .  I needed to make them modules so I could test the removal using rmmod.
>>>
>>>
>>
>>   I have determined the event goes all the back to 5.0-rc1, then  4.18.rc8 ;  and Kernel 4.18.0-147.3.1.el8_1.x86_64, which is the current RH 8.1 kernel . I was mistaken it was solely  a 5.4 issue.
> 
> Good work.  Keep on going; what about 4.19 and 4.20?  And various
> release candidates in between, and so on...
> 
> Alan Stern
> 


-- 
Thank You,
John
