Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CFCCD3375E0
	for <lists+linux-usb@lfdr.de>; Thu, 11 Mar 2021 15:39:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233620AbhCKOj1 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 11 Mar 2021 09:39:27 -0500
Received: from netrider.rowland.org ([192.131.102.5]:59621 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S233621AbhCKOjN (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 11 Mar 2021 09:39:13 -0500
Received: (qmail 258323 invoked by uid 1000); 11 Mar 2021 09:39:12 -0500
Date:   Thu, 11 Mar 2021 09:39:12 -0500
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Matthias Schwarzott <zzam@gentoo.org>
Cc:     linux-usb@vger.kernel.org, usb-storage@lists.one-eyed-alien.net,
        hirofumi@mail.parknet.co.jp
Subject: Re: [usb-storage] Re: Amazon Kindle disconnect after Synchronize
 Cache
Message-ID: <20210311143912.GA257360@rowland.harvard.edu>
References: <20210305191437.GC48113@rowland.harvard.edu>
 <2a1f6636-6b57-ccc5-76b3-7eae5e80e7d3@gentoo.org>
 <20210307155236.GB103559@rowland.harvard.edu>
 <9c3121a9-3d0c-60b3-ef17-993b7d2e9149@gentoo.org>
 <20210307165856.GA104554@rowland.harvard.edu>
 <268e646f-d4ea-3190-f1b9-8e69bfc1b019@gentoo.org>
 <20210309155046.GA176674@rowland.harvard.edu>
 <dfd2b281-3beb-9869-37b6-8bd48a6cf40f@gentoo.org>
 <20210310214648.GA236329@rowland.harvard.edu>
 <841a9a54-78ee-ffaa-fc3c-12defcf43b36@gentoo.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <841a9a54-78ee-ffaa-fc3c-12defcf43b36@gentoo.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Mar 11, 2021 at 07:05:00AM +0100, Matthias Schwarzott wrote:
> Am 10.03.21 um 22:46 schrieb Alan Stern:
> > On Wed, Mar 10, 2021 at 09:56:04PM +0100, Matthias Schwarzott wrote:
> > > > What happens if you set the value to 1000 before running the test?
> > > > 
> > > I tested different values. At 1000 it still disconnects. At lower values it
> > > no longer does this.
> > > I tested 200 up to 900. Even 900 ms is good enough to keep it connected.
> > > 
> > > Btw. it is not a USB disconnect, but it just seems to plays medium ejected.
> > > 
> > > Out of interest I called "sg_start -v -l /dev/sde" after one of the failing
> > > experiments. That made the Kindle go back to connected state.
> > > 
> > > To me the above experiments show that enough TEST UNIT READY commands are
> > > needed in the 2 s after a SYNCHRONIZE CACHE.
> > 
> > So you have found the solution to your problem.  Congratulations!
> > 
> Thank you for your support.
> 
> For longterm I think it should work automatically.
> Some options I can think of (ordered by my preference):
> 
> 1. Kernel sends one or more TEST UNIT READY commands after every SYNCHRONIZE
> CACHE to a Kindle device. Regardless of triggered by kernel or by some user
> code via ioctl.
> 
> 2. Kernel automatically chooses a low enough value for events_poll_msecs if
> it detects kindle.
> 
> 3. udev rule is added that matches the Kindle and sets events_poll_msecs.
>   3a) SUBSYSTEM=="block", ACTION=="add", ENV{DEVTYPE}=="disk",
> ATTRS{product}=="Amazon Kindle", ATTR{events_poll_msecs}="900"
> 
>   3b) SUBSYSTEM=="block", ACTION=="add", ENV{DEVTYPE}=="disk",
> ATTRS{idVendor}=="1949", ATTRS{idProduct}=="0004",
> ATTR{events_poll_msecs}="900"
> 
> 4. Kernel sends one or more TEST UNIT READY commands after every SYNCHRONIZE
> CACHE to a device (without matching).
> 
> 
> I guess options 1 and 2 require a new entry in unusual_devs together with a
> (new?) quirk.

It's not that simple.  usb-storage does not create SCSI commands; it 
merely sends commands that it receives from other parts of the kernel.

> Option 3 requires to get a new rule into udev.
> And option 4 is ugly as it changes behaviour for usb-storage or scsi disk
> device.
> 
> I would prefer option 1 or 2.

I prefer option 3, although 2 would be acceptable in a pinch.  The main 
reason is because 3 is the only option that doesn't involve changing the 
kernel.  It's probably much easier to change a udev script.  (For 
example, that's something any user can quickly do themselves.)

> Do you know how high the overhead of having more TEST UNIT READY commands
> is? (=How much better option 1 is compared to option 2?)

Options 1 and 4 would be rather difficult to implement.  2 and 3 are a 
lot simpler.

The overhead of TEST UNIT READY is pretty small.  You can get an idea 
for yourself by looking at the timestamps in the annotated extract of 
the usbmon log that I sent back to you.

Alan Stern
