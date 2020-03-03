Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F180F177BB0
	for <lists+linux-usb@lfdr.de>; Tue,  3 Mar 2020 17:15:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730312AbgCCQPJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 3 Mar 2020 11:15:09 -0500
Received: from iolanthe.rowland.org ([192.131.102.54]:38502 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1730305AbgCCQPJ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 3 Mar 2020 11:15:09 -0500
Received: (qmail 2923 invoked by uid 2102); 3 Mar 2020 11:15:08 -0500
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 3 Mar 2020 11:15:08 -0500
Date:   Tue, 3 Mar 2020 11:15:08 -0500 (EST)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     John Donnelly <john.p.donnelly@oracle.com>
cc:     linux-usb@vger.kernel.org
Subject: Re: Spurious EHCI interrupts with 5.2 and later on shutdown / init
 6 reboot .
In-Reply-To: <1227C596-E71E-47D4-9C67-466FE71BD32C@oracle.com>
Message-ID: <Pine.LNX.4.44L0.2003031109160.1538-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, 3 Mar 2020, John Donnelly wrote:

> > Let's try to be a little more precise.  You said this happens "every 
> > time a server is rebooted".  At first I thought you meant it happened 
> > during the boot process.  But the timestamps on these log messages 
> > indicate the unwanted IRQ happened 836 seconds _after_ boot, possibly 
> > also 336 seconds after.
> > 
> > So when exactly do you see this?
> > 
>       On shutdown - init 6 
> 
> Started Show Plymouth Reboot Screen.
> [  OK  ] Unmounted RPC Pipe File System.
> [  OK  ] Stopped Logout off all iSCSI sessions on shutdown.
>          Stopping Open-iSCSI...
> [  OK  ] Stopped Open-iSCSI.
> [  OK  ] Unmounted /home.
> [  OK  ] Stopped Dynamic System Tuning Daemon.
> [  OK  ] Stopped Login Service.
> [  OK  ] Stopped target User and Group Name Lookups.
>          Stopping System Security Services Daemon...
> [  OK  ] Stopped System Security Services Daemon.
> [  OK  ] Stopped VDO volume services.
> [  OK  ] Stopped System Logging Service.
> [  OK  ] Stopped target Network is Online.
> [  OK  ] Stopped target Network.
>          Stopping Network Manager...
>          Stopping Network Name Resolution...
> [  OK  ] Stopped Network Name Resolution.
> [  OK  ] Stopped Network Manager.
>          Stopping D-Bus System Message Bus...
> [  OK  ] Stopped Rollback uncommitted netcf network config change transactions.
> [  OK  ] Stoppe[ 1523.374186] irq 18: nobody cared (try booting with the "irqpoll" option)
> d D-Bus System M[ 1523.470444] handlers:
> [ 1523.514197] [<0000000024f18691>] usb_hcd_irq
> [ 1523.565284] [<0000000024f18691>] usb_hcd_irq
> [ 1523.675772] Disabling IRQ #18
> [  OK  ] Stopped target Basic System.
> [  OK  ] Stopped Forward Password Requests to Plymouth Directory Watch.
> [  OK  ] Stopped target Sockets.
> [  OK  ] Closed Avahi mDNS/DNS-SD Stack Activation Socket.
> [  OK  ] Closed Activation socket for spice guest agent daemon.
> [  OK  ] Closed Open-iSCSI iscsiuio Socket.
> [  OK  ] Closed CUPS Scheduler.
> [  OK  ] Closed Virtual machine log manager socket.
> [  OK  ] Closed Virtual machine lock manager socket.
> [  OK  ] Closed Open-iSCSI iscsid Socket.
> [  OK  ] Closed PC/SC Smart Card Daemon Activation Socket.
> [  OK  ] Closed SSSD Kerberos Cache Manager responder socket.
> [  OK  ] Stopped target Paths.
> [  OK  ] Stopped CUPS Scheduler.
> [  OK  ] Stopped target Slices.
> [  OK  ] Removed slice Virtual Machine and Container Slice.
> [  OK  ] Removed slice User and Session Slice.
> [  OK  ] Closed D-Bus System Message Bus Socket.
> [  OK  ] Stopped target System Initialization.
> [  OK  ] Stopped target Swap.
>    [ 1524.987084] reboot: Restarting system

All right.  You never made this clear.

> >>    Removing the modules BEFORE I do a shutdown does not produce the error - which is kind of surprising . 
> > 
> > What exactly does this mean?  Do you mean that the error does not occur 
> > at the time the module is removed?
> 
>     Yes 

No!  You mean that the error does not occur at the time when the system
is shut down following module removal.  Right?

> >  Or do you mean that if you remove 
> > the module and then reboot, the error does not occur during the reboot?  
> 
>  Yes 

Again, no.

> > Or do you mean that if you remove the module and reboot, the error does 
> > not occur until the system is booted yet again?
> > 
> 
>    Yes 

And no.  I can't help if you don't give full and unambiguous answers.

> >>   It appears the modules are actually loaded by the ramdisk too  - prior to getting to the single user mode when I built them as loadable module .. because I renamed them  so modprobe/udev  would not find them after systemd starts.
> > 
> > This depends on the contents of your initramfs.  Most likely you
> > rebuilt that along with the kernel, so if the kernel uses modules for
> > the EHCI drivers then so does the initramfs.
> 
>     Yes .  I needed to make them modules so I could test the removal using rmmod. 
> > 
> > 
> 
>  I have determined the event goes all the back to 5.0-rc1, then  4.18.rc8 ;  and Kernel 4.18.0-147.3.1.el8_1.x86_64, which is the current RH 8.1 kernel . I was mistaken it was solely  a 5.4 issue. 

Good work.  Keep on going; what about 4.19 and 4.20?  And various 
release candidates in between, and so on...

Alan Stern

