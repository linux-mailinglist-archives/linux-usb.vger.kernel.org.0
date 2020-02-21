Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D20F216875A
	for <lists+linux-usb@lfdr.de>; Fri, 21 Feb 2020 20:20:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729509AbgBUTU2 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 21 Feb 2020 14:20:28 -0500
Received: from iolanthe.rowland.org ([192.131.102.54]:54368 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1729397AbgBUTU2 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 21 Feb 2020 14:20:28 -0500
Received: (qmail 4972 invoked by uid 2102); 21 Feb 2020 14:20:27 -0500
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 21 Feb 2020 14:20:27 -0500
Date:   Fri, 21 Feb 2020 14:20:27 -0500 (EST)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     "taz.007" <taz.007@zoho.com>
cc:     linux-usb@vger.kernel.org
Subject: Re: fuse freeze and usb devices
In-Reply-To: <74e26141-e697-31bb-c574-b8968d0f13e6@zoho.com>
Message-ID: <Pine.LNX.4.44L0.2002211406460.1488-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, 21 Feb 2020, taz.007 wrote:

> Hello linux-usb,
> 
> I'm experiencing some freezing from a fuse userspace daemon. I'm not 
> sure if it is an actual usb issue, so please point me to the correct 
> subsystem/mailing list if they could help.
> setup:
> 10 hard drives (ext3 or ext4) mounted on the system.
> 7 of those are sata under usb enclosures, (usb2 only).
> 2 of them are usbkeys (usb1 & usb2).
> 1 of them is a regular sata drive directly connected.
> I use mergerfs to gather all of them under a common mount point.
> scenario :
> the machine is cpu loaded, (2C/4T) nearly fully used.
> rsync is running in a loop (in order to reproduce the issue), copying 
> some files (several GB) from the mergerfs mount point to another drive 
> (that is not part of the pool, also a regular ext4 mounted drive).
> some background processes are doing "light" (~50KB/sec) IO on the same 
> mergerfs pool.
> after a while , any access to the mergerfs mount point is frozen.
> This is because mergerfs itself is stuck in a syscall (if I understand 
> correctly) that is never returning.
> However I can access (by doing an "ls" for example) the underlying 
> mounted hard drives fine!
> And in this case, accessing the underlying hard drives via "ls" somehow 
> unfreezes the previously blocked syscall from the mergerfs daemon!
> It is not even needed to use "ls", doing hdparm -tT on the drives 
> directly also permits to unfreeze mergerfs.
> 
> Now the link with usb :
> When I tweak the values of /sys/block/sdX/device/max_sectors I can alter 
> the behaviour.
> With the values of 128 or 240, I'm unable to reproduce the issue.
> With the value of 512 it reproduces the issue after around 4-5hours.
> With the value of 1024 it reproduces the issue after around 2hours.
> (maybe those are statistically insignificant numbers and I'm just unlucky)
> 
> There are no errors from the kernel, and the drives still seem to be 
> working fine in fact.
> I'm using Linux 5.5.3, but I tried back the 5.1.15, and the issue is 
> already there.
> 
> For more detailed info on the mergerfs callstack, see the original 
> bugreport thread :
> https://github.com/trapexit/mergerfs/issues/708
> 
> Please don't forget to CC me as I'm not subscribed to the ML.

It seems unlikely to me that your problem has anything to do with USB.  
You might try asking for help on the linux-kernel mailing list.

The GitHub bug report says that there are two threads stuck waiting in
splice system calls.  It also says that turning off splice doesn't
help.  When splice is off, what are the threads waiting for?

Some other things to consider...  They may not be related to your
problem:

What does "hdparm -B" show for your drives?

What do /sys/block/sdX/device/power/{control,runtime_status} contain?

Alan Stern

