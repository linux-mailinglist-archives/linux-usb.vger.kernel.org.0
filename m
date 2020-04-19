Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B69FE1AFBD8
	for <lists+linux-usb@lfdr.de>; Sun, 19 Apr 2020 18:03:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726201AbgDSQD6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 19 Apr 2020 12:03:58 -0400
Received: from netrider.rowland.org ([192.131.102.5]:35561 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1725939AbgDSQD6 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 19 Apr 2020 12:03:58 -0400
Received: (qmail 5744 invoked by uid 500); 19 Apr 2020 12:03:56 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 19 Apr 2020 12:03:56 -0400
Date:   Sun, 19 Apr 2020 12:03:56 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@netrider.rowland.org
To:     Cyril Roelandt <tipecaml@gmail.com>
cc:     USB list <linux-usb@vger.kernel.org>, <sellis@redhat.com>,
        <pachoramos@gmail.com>, <labbott@fedoraproject.org>,
        <gregkh@linuxfoundation.org>, <javhera@gmx.com>
Subject: Re: [BUG] Regression in Linux 5.4.17 for JMicron JMS566 enclosure
In-Reply-To: <20200417220957.GA4707@Susan>
Message-ID: <Pine.LNX.4.44L0.2004191144550.4266-100000@netrider.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sat, 18 Apr 2020, Cyril Roelandt wrote:

> > Two things.  First, you started the usbmon traces _after_ plugging in
> > the drive.  As a result the traces do not contain a complete record of
> > all the transfers between the computer and the drive; it's possible
> > that something in the missing portions is responsible for your problem.
> > For example, why does your uas log include a line ("[sdb] 4096-byte 
> > physical blocks") that is missing in the usb-storage log?
> 
> Oh, sorry, I'm new to this. The logs became really long, so I've taken
> the liberty of pasting them to paste.debian.net. I captured what
> happened when plugging the WD drive and running "mount".
> 
> - With a 5.3 kernel, using uas: http://paste.debian.net/1141035/
> - With a 5.4 kernel, using usb-storage: http://paste.debian.net/1141036/
> - With a 5.4 kernel, using usb-storage, using a similar enclosure that
>   works as expected (the Icy Box IB-268U3-B, which has the same product
>   ID and vendor ID but a different bcdDevice: 2.03 instead of
>   1.14): http://paste.debian.net/1141037/

I believe I have found the problem.  The key was comparing the traces
from the two enclosures.  There was a significant difference between
them in their responses to the MODE SENSE(6) command.

Here's that command and the response from the failing enclosure:

ffff908f505a2300 82753378 S Bo:004:02 -115 31 = 55534243 12000000 c0000000 8000061a 003f00c0 00000000 00000000 000000
ffff908f505a2300 82753399 C Bo:004:02 0 31 >
ffff908f505a2d80 82753408 S Bi:004:01 -115 192 <
ffff908f505a2d80 82753465 C Bi:004:01 -121 72 = 47001008 74706db0 00000200 88121400 ffff0000 ffffffff 00ff0000 00000000
----------------------------------------------------^^

And here's the same thing from the working enclosure:

ffff908f01193cc0 304583400 S Bo:005:02 -115 31 = 55534243 06000000 c0000000 8000061a 003f00c0 00000000 00000000 000000
ffff908f01193cc0 304583422 C Bo:005:02 0 31 >
ffff908f4984d600 304583437 S Bi:005:01 -115 192 <
ffff908f4984d600 304583482 C Bi:005:01 -121 72 = 47000008 74706db0 00000200 08121400 ffff0000 ffffffff 00ff0000 00000000
-----------------------------------------------------^^

As you can see, the two commands are exactly the same (except for their 
ID tags, 12 vs. 06, which don't matter).  But the responses differ in 
the marked positions; the third byte is 0x10 vs. 0x00.

That bit is the DPOFUA bit; when it is set it indicates that the device 
supports the DPO (Disable Page Out) and FUA (Force Unit Access) flags 
for READ and WRITE commands.  Sure enough, the corresponding WRITE(10) 
commands (the one that failed) for the failing and working enclosures 
are:

ffff908f505a2300 83276754 S Bo:004:02 -115 31 = 55534243 85000000 00100000 00000a2a 08000008 00000008 00000000 000000
------------------------------------------------------------------------------------^^

vs.

ffff908f01193cc0 312818243 S Bo:005:02 -115 31 = 55534243 79000000 00100000 00000a2a 00000008 00000008 00000000 000000
-------------------------------------------------------------------------------------^^

And that 08 is the FUA bit.  Evidently the failing enclosure doesn't
support it, even though it claims that it does.  (Probably the working
enclosure doesn't support FUA either, but since it doesn't claim to,
the system doesn't use that flag and so the error doesn't occur.)

Below is a patch which will tell the kernel that the JMS566's FUA 
support is broken.  Let me know whether it fixes the problem.

> I wrote in my original message that the enclosure worked fine with a
> Fujitsu drive, but upon further testing this proved inexact: it worked
> with an NTFS partition on said drive. Once I formatted it to ext4, it
> started failing as well. To recap, when using usb-storage this is what
> happens:
> 
> IB273 + WD Blue 1TB   (ext4)   -> Broken
> IB273 + Fujitsu 250GB (ext4)   -> Broken
> IB273 + Fujitsu 250GB (NTFS)   -> OK
> IB268 + WD1TB         (ext4)   -> OK
> 
> Where:
> - IB273 has idVendor=357d, idProduct=7788 and bcdDevice= 1.14
> - IB268 has idVendor=357d, idProduct=7788 and bcdDevice= 2.03

Probably the NTFS filesystem doesn't need to use FUA whereas ext4 does.

Alan Stern



Index: usb-devel/drivers/usb/storage/unusual_devs.h
===================================================================
--- usb-devel.orig/drivers/usb/storage/unusual_devs.h
+++ usb-devel/drivers/usb/storage/unusual_devs.h
@@ -2317,6 +2317,13 @@ UNUSUAL_DEV(  0x3340, 0xffff, 0x0000, 0x
 		USB_SC_DEVICE,USB_PR_DEVICE,NULL,
 		US_FL_MAX_SECTORS_64 ),
 
+/* Reported by Cyril Roelandt <tipecaml@gmail.com> */
+UNUSUAL_DEV(  0x357d, 0x7788, 0x0114, 0x0114,
+		"JMicron",
+		"USB to ATA/ATAPI Bridge",
+		USB_SC_DEVICE, USB_PR_DEVICE, NULL,
+		US_FL_BROKEN_FUA ),
+
 /* Reported by Andrey Rahmatullin <wrar@altlinux.org> */
 UNUSUAL_DEV(  0x4102, 0x1020, 0x0100,  0x0100,
 		"iRiver",

