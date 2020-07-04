Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B93E22147D9
	for <lists+linux-usb@lfdr.de>; Sat,  4 Jul 2020 20:02:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726682AbgGDSCG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 4 Jul 2020 14:02:06 -0400
Received: from netrider.rowland.org ([192.131.102.5]:55359 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1726643AbgGDSCG (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 4 Jul 2020 14:02:06 -0400
Received: (qmail 654428 invoked by uid 1000); 4 Jul 2020 14:02:05 -0400
Date:   Sat, 4 Jul 2020 14:02:05 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Dan Halbert <halbert@halwitz.org>
Cc:     Greg KH <gregkh@linuxfoundation.org>,
        Linux USB List <linux-usb@vger.kernel.org>
Subject: Re: Kernel crash during USB device enumeration or MSC mounting
Message-ID: <20200704180205.GA654077@rowland.harvard.edu>
References: <aa7c2ad9-3daa-7fec-3f2a-9e35a3196938@halwitz.org>
 <20200704153429.GA433456@kroah.com>
 <20200704153607.GB433456@kroah.com>
 <20200704160914.GB650205@rowland.harvard.edu>
 <e4028d6d-7a62-1887-67eb-81e39d25c162@halwitz.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e4028d6d-7a62-1887-67eb-81e39d25c162@halwitz.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sat, Jul 04, 2020 at 12:33:38PM -0400, Dan Halbert wrote:
> On 7/4/20 12:09 PM, Alan Stern wrote:
> > It looks to me as though the user is reformatting the USB drive on the
> > microcontroller while it is mounted on the host.  At least, the log
> > message:
> > 
> > [40864.285807] FAT-fs (sdc1): Volume was not properly unmounted. Some data may be corrupt. Please run fsck.
> > 
> > seems to indicate that a FAT filesystem was mounted, and the circuitpython
> > command storage.erase_filesystem() completely reinitializes the device's
> > filesystem.
> > 
> > This is definitely a user error: It is forbidden for a device to
> > manipulate data that it is exporting to a host as a USB drive.  And it's
> > not surprising that doing so would cause the host to crash.
> > 
> > If you really want to call storage.erase_filesystem() while the device is
> > connected to the host, you should at least unmount the drive on the host
> > beforehand.
> 
> Thanks for your observations, which are very helpful in my thinking about
> this. That's correct, that code does reformat the filesystem, but it also
> does a USB reset, so the host should ideally not make an assumption that its
> idea of what is on the drive is correct when it re-enumerates.

The host sees the reformat as it takes place, and that can mess up the 
host.  The fact that there is a disconnect afterward limits the window 
but does not eliminate it.

> We cannot tell the host from the MSC side that we want to unmount cleanly
> from the drive. We could disconnect from USB first.

That would be a good idea.

Still, what reason is there for reformatting the storage while it is 
connected to a host?  That's equivalent to a real disk drive deciding to 
erase itself while it is in use.  Why not do the reformat before the 
device is attached to the host?

Or why not have the host do the reformat instead of doing it on the 
device?

> I just confirmed with one of our users that he has also seen crashes on
> simple unplug of the mounted device.

That could be a separate issue.  I haven't seen reports of things like 
that for quite a long time.  Is it reproducible?  If it is, you (or your 
user) ought to be able to get the same result by unplugging an ordinary 
USB flash drive while it is mounted.

> I would hope that the host would not crash when the MSC device does
> something untoward, and that it would be more robust. It is a potential
> kernel attack mechanism otherwise.

Have you heard of Bad USB?  Yes, there are a lot of attack mechanisms 
here.  The fact is, operating systems tend to trust the contents of 
attached disk drives.  If you don't want the host to trust the contents of 
the device's Mass Storage interface, don't allow the host to mount it.

One of the most fundamental assumptions computers make about attached disk 
drives is that they don't spontaneously change their contents.  When you 
violate that assumption, almost anything can happen.

> The first crash trace I mentioned in my reply to Greg does seem to be inside
> the USB stack, not in the filesystem code. It's possible there are two
> problems here, or it's possible the filesystem code gets confused and is
> making the USB stack confused as well.

Whenever one subsystem in the kernel gets out of whack, it can fairly 
easily corrupt the entire kernel.  You can't conclude anything just from 
the immediate appearance of a bug.

Anyway, the first crash in in your reply to Greg _wasn't_ in the USB 
stack:

[76707.692717] general protection fault: 0000 [#1] SMP PTI
[76707.692723] CPU: 3 PID: 75883 Comm: kworker/3:1 Kdump: loaded Not tainted 5.4.0-21-generic #25-Ubuntu
[76707.692725] Hardware name: Dell Inc. OptiPlex 7010/0WR7PY, BIOS A29 06/28/2018
[76707.692732] Workqueue: usb_hub_wq hub_event
[76707.692738] RIP: 0010:__kmalloc+0xa5/0x270

As you can see, the problem occurred in __kmalloc(), which is part of the 
memory management subsystem -- not the USB stack.

Alan Stern
