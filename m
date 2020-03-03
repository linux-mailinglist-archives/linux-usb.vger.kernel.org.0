Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 68577177AF4
	for <lists+linux-usb@lfdr.de>; Tue,  3 Mar 2020 16:50:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730212AbgCCPsh (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 3 Mar 2020 10:48:37 -0500
Received: from userp2120.oracle.com ([156.151.31.85]:49402 "EHLO
        userp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728291AbgCCPsh (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 3 Mar 2020 10:48:37 -0500
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
        by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 023Fex97078256;
        Tue, 3 Mar 2020 15:48:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to;
 s=corp-2020-01-29; bh=VU5DHPiG2bOJcO2jycHdT34ruKhkh5t+JuJNxYQ487g=;
 b=0AYK/rMKyikztaEhJ1ry+vfh91pjG0gJIuhUdbl3q2ET1copBxdPxOCknhpbIfKgAuVK
 TXR60N+Vd8nrG0iP/413zLu1RAgouzF4GmRzBf6rge0Sx+G6JXXYahZUGUiGzts8iYIR
 Bz/s6CDE1AZMWVJJ/m0MnAt5nzLb7a70t//EpZqJZ+oqQu7ACyj5mVnnqy0NBCa3qmjh
 FqlDXYfXHmf6A9PIiyVh9qj2UsdPlp0aEkUzS9GvB4RvzX0eKHUC8t91PABr5lRIv+n6
 v48KZL7BTvXvFOPPipoSB4yr8ViN/HoPX3dirzr2JXZad+/RqWw1UovmKGLyn3XxH+Ji Tw== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by userp2120.oracle.com with ESMTP id 2yghn33xgj-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 03 Mar 2020 15:48:34 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 023FibsE027176;
        Tue, 3 Mar 2020 15:48:33 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
        by userp3020.oracle.com with ESMTP id 2yg1p4qgme-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 03 Mar 2020 15:48:33 +0000
Received: from abhmp0015.oracle.com (abhmp0015.oracle.com [141.146.116.21])
        by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 023FmVdL027168;
        Tue, 3 Mar 2020 15:48:32 GMT
Received: from dhcp-10-154-133-105.vpn.oracle.com (/10.154.133.105)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Tue, 03 Mar 2020 07:48:31 -0800
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 11.5 \(3445.9.1\))
Subject: Re: Spurious EHCI interrupts with 5.2 and later on shutdown / init 6
 reboot .
From:   John Donnelly <john.p.donnelly@oracle.com>
In-Reply-To: <Pine.LNX.4.44L0.2003031025440.1538-100000@iolanthe.rowland.org>
Date:   Tue, 3 Mar 2020 09:48:29 -0600
Cc:     linux-usb@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <1227C596-E71E-47D4-9C67-466FE71BD32C@oracle.com>
References: <Pine.LNX.4.44L0.2003031025440.1538-100000@iolanthe.rowland.org>
To:     Alan Stern <stern@rowland.harvard.edu>
X-Mailer: Apple Mail (2.3445.9.1)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9549 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 malwarescore=0
 mlxlogscore=999 mlxscore=0 spamscore=0 adultscore=0 bulkscore=0
 suspectscore=3 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2003030113
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9549 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 phishscore=0 spamscore=0
 impostorscore=0 mlxscore=0 adultscore=0 mlxlogscore=999 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 suspectscore=3
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2001150001
 definitions=main-2003030113
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Alan,
 See inline.

> On Mar 3, 2020, at 9:35 AM, Alan Stern <stern@rowland.harvard.edu> =
wrote:
>=20
> On Mon, 2 Mar 2020, John Donnelly wrote:
>=20
>> On 3/2/20 3:56 PM, Alan Stern wrote:
>>> On Mon, 2 Mar 2020, John Donnelly wrote:
>>>=20
>>>> Hello linux-usb.
>>>>=20
>>>>=20
>>>> I am seeing this message every time a server is rebooted, and it =
started around 5.2 release. It is benign behavior but it does not occur =
in prior 4.18 Linux kernels.
>>>=20
>>> What about 4.19?  4.20?  5.0?  And so on...
>>>=20
>>> It still think your best bet for finding out what is happening is to =
do
>>> a bisection.
>>=20
>>   Thank you for the feedback.  This could take awhile !  I will =
update=20
>> you on my findings.
>>=20
>>=20
>>=20
>>>=20
>>>> Kernel 5.6.0-rc1.01.el8uek.rc1.x86_64 on an x86_64
>>>>=20
>>>>=20
>>>> [  836.063284] irq 18: nobody cared (try booting with the "irqpoll" =
option)
>>>> [  836.143498] CPU: 24 PID: 0 Comm: swapper/24 Kdump: loaded Not =
tainted
>>>> 5.3.6.jpd.01.+ #5
>>>> [  836.239310] Hardware name: Oracle Corporation ORACLE SERVER
>>>> X5-2/ASM,MOTHERBOARD,1U, BIOS 30140300 09/20/2018
>>>> [  836.358010] Call Trace:
>>>> [  836.387248]  <IRQ>
>>>> [  836.411298]  dump_stack+0x63/0x8a
>>>> [  836.450951]  __report_bad_irq+0x3c/0xb6
>>>> [  836.496830]  note_interrupt.cold.10+0xb/0x5d
>>>> [  836.547916]  handle_irq_event_percpu+0x6f/0x80
>>>> [  836.601077]  handle_irq_event+0x3b/0x5a
>>>> [  836.646962]  handle_fasteoi_irq+0x90/0x130
>>>> [  836.695968]  handle_irq+0x20/0x30
>>>> [  836.711139] megaraid_sas 0000:23:00.0: =
megasas_disable_intr_fusion is
>>>> called outbound_intr_mask:0x40000009
>>>> [  836.735612]  do_IRQ+0x4e/0xe0
>>>> [  836.735616]  common_interrupt+0xf/0xf
>>>> [  836.735619]  </IRQ>
>>>>=20
>>>> [  336.622666] [<0000000010b50533>] usb_hcd_irq
>>>> [  336.673746] [<0000000010b50533>] usb_hcd_irq
>=20
> Let's try to be a little more precise.  You said this happens "every=20=

> time a server is rebooted".  At first I thought you meant it happened=20=

> during the boot process.  But the timestamps on these log messages=20
> indicate the unwanted IRQ happened 836 seconds _after_ boot, possibly=20=

> also 336 seconds after.
>=20
> So when exactly do you see this?
>=20
      On shutdown - init 6=20

Started Show Plymouth Reboot Screen.
[  OK  ] Unmounted RPC Pipe File System.
[  OK  ] Stopped Logout off all iSCSI sessions on shutdown.
         Stopping Open-iSCSI...
[  OK  ] Stopped Open-iSCSI.
[  OK  ] Unmounted /home.
[  OK  ] Stopped Dynamic System Tuning Daemon.
[  OK  ] Stopped Login Service.
[  OK  ] Stopped target User and Group Name Lookups.
         Stopping System Security Services Daemon...
[  OK  ] Stopped System Security Services Daemon.
[  OK  ] Stopped VDO volume services.
[  OK  ] Stopped System Logging Service.
[  OK  ] Stopped target Network is Online.
[  OK  ] Stopped target Network.
         Stopping Network Manager...
         Stopping Network Name Resolution...
[  OK  ] Stopped Network Name Resolution.
[  OK  ] Stopped Network Manager.
         Stopping D-Bus System Message Bus...
[  OK  ] Stopped Rollback uncommitted netcf network config change =
transactions.
[  OK  ] Stoppe[ 1523.374186] irq 18: nobody cared (try booting with the =
"irqpoll" option)
d D-Bus System M[ 1523.470444] handlers:
[ 1523.514197] [<0000000024f18691>] usb_hcd_irq
[ 1523.565284] [<0000000024f18691>] usb_hcd_irq
[ 1523.675772] Disabling IRQ #18
[  OK  ] Stopped target Basic System.
[  OK  ] Stopped Forward Password Requests to Plymouth Directory Watch.
[  OK  ] Stopped target Sockets.
[  OK  ] Closed Avahi mDNS/DNS-SD Stack Activation Socket.
[  OK  ] Closed Activation socket for spice guest agent daemon.
[  OK  ] Closed Open-iSCSI iscsiuio Socket.
[  OK  ] Closed CUPS Scheduler.
[  OK  ] Closed Virtual machine log manager socket.
[  OK  ] Closed Virtual machine lock manager socket.
[  OK  ] Closed Open-iSCSI iscsid Socket.
[  OK  ] Closed PC/SC Smart Card Daemon Activation Socket.
[  OK  ] Closed SSSD Kerberos Cache Manager responder socket.
[  OK  ] Stopped target Paths.
[  OK  ] Stopped CUPS Scheduler.
[  OK  ] Stopped target Slices.
[  OK  ] Removed slice Virtual Machine and Container Slice.
[  OK  ] Removed slice User and Session Slice.
[  OK  ] Closed D-Bus System Message Bus Socket.
[  OK  ] Stopped target System Initialization.
[  OK  ] Stopped target Swap.
   [ 1524.987084] reboot: Restarting system
    =20


>>    Removing the modules BEFORE I do a shutdown does not produce the =
error - which is kind of surprising .=20
>=20
> What exactly does this mean?  Do you mean that the error does not =
occur=20
> at the time the module is removed?

    Yes=20

>  Or do you mean that if you remove=20
> the module and then reboot, the error does not occur during the =
reboot? =20

 Yes=20

> Or do you mean that if you remove the module and reboot, the error =
does=20
> not occur until the system is booted yet again?
>=20

   Yes=20

>>   It appears the modules are actually loaded by the ramdisk too  - =
prior to getting to the single user mode when I built them as loadable =
module .. because I renamed them  so modprobe/udev  would not find them =
after systemd starts.
>=20
> This depends on the contents of your initramfs.  Most likely you
> rebuilt that along with the kernel, so if the kernel uses modules for
> the EHCI drivers then so does the initramfs.

    Yes .  I needed to make them modules so I could test the removal =
using rmmod.=20
>=20
>=20

 I have determined the event goes all the back to 5.0-rc1, then  =
4.18.rc8 ;  and Kernel 4.18.0-147.3.1.el8_1.x86_64, which is the current =
RH 8.1 kernel . I was mistaken it was solely  a 5.4 issue.=20







 =20

