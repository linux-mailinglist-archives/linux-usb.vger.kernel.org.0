Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DDA392454FE
	for <lists+linux-usb@lfdr.de>; Sun, 16 Aug 2020 02:06:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726652AbgHPAGM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 15 Aug 2020 20:06:12 -0400
Received: from netrider.rowland.org ([192.131.102.5]:57929 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1725927AbgHPAGL (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 15 Aug 2020 20:06:11 -0400
Received: (qmail 52733 invoked by uid 1000); 14 Aug 2020 22:19:29 -0400
Date:   Fri, 14 Aug 2020 22:19:29 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Cyril Roelandt <tipecaml@gmail.com>
Cc:     USB list <linux-usb@vger.kernel.org>, sellis@redhat.com,
        pachoramos@gmail.com, labbott@fedoraproject.org,
        gregkh@linuxfoundation.org, javhera@gmx.com, brice.goglin@gmail.com
Subject: Re: [BUG] Regression in Linux 5.4.17 for JMicron JMS566 enclosure
Message-ID: <20200815021929.GC52242@rowland.harvard.edu>
References: <20200417220957.GA4707@Susan>
 <Pine.LNX.4.44L0.2004191144550.4266-100000@netrider.rowland.org>
 <20200421030137.GA2492@Susan>
 <20200815001829.GA2786@Susan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200815001829.GA2786@Susan>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sat, Aug 15, 2020 at 02:18:29AM +0200, Cyril Roelandt wrote:
> Hello,
> 
> On 2020-04-21 05:01, Cyril Roelandt wrote:
> > On 2020-04-19 12:03, Alan Stern wrote:
> > > [...]
> > > 
> > > Below is a patch which will tell the kernel that the JMS566's FUA 
> > > support is broken.  Let me know whether it fixes the problem.
> > > 
> > 
> > I applied your patch on top of v5.4 and was able to use the enclosure.
> 
> Well, I guess I made a mistake. I tried your patch on top of v5.4
> instead of v5.4.17, which means I tried your fix for a usb-storage issue
> on a version of the kernel that still allowed my enclosure to use UAS.
> Oops.
> 
> Brice Goglin (CCed) and I can witness the same issue on recent kernels:
> 
> $ uname -a
> Linux Susan 5.7.0-2-amd64 #1 SMP Debian 5.7.10-1 (2020-07-26) x86_64 GNU/Linux
> 
> Once I plug the USB drive:
> 
> # dmesg -T
> [Fri Aug 14 21:20:20 2020] usb 4-2: new SuperSpeed Gen 1 USB device number 2 using xhci_hcd
> [Fri Aug 14 21:20:20 2020] usb 4-2: New USB device found, idVendor=357d, idProduct=7788, bcdDevice= 1.14
> [Fri Aug 14 21:20:20 2020] usb 4-2: New USB device strings: Mfr=1, Product=2, SerialNumber=3
> [Fri Aug 14 21:20:20 2020] usb 4-2: Product: USB to ATA/ATAPI Bridge
> [Fri Aug 14 21:20:20 2020] usb 4-2: Manufacturer: JMicron
> [Fri Aug 14 21:20:20 2020] usb 4-2: SerialNumber: 74D7851513309E5
> [Fri Aug 14 21:20:20 2020] usbcore: registered new interface driver usb-storage
> [Fri Aug 14 21:20:20 2020] usb 4-2: UAS is blacklisted for this device, using usb-storage instead
> [Fri Aug 14 21:20:20 2020] usbcore: registered new interface driver uas
> #
> 
> "fdisk -l" does not show the drive. No new partitions are listed in
> /dev/sd*. 
> 
> Here is the usbmon trace for the faulty enclosure (idVendor=357d,
> idProduct=7788, bcdDevice=1.14):
> 
> 
> ffff8f0014b340c0 3930083831 S Ci:4:001:0 s a3 00 0000 0001 0004 4 <
> ffff8f0014b340c0 3930083883 C Ci:4:001:0 0 4 = a0020000
> ffff8f0014b340c0 3930083897 S Ci:4:001:0 s a3 00 0000 0002 0004 4 <
> ffff8f0014b340c0 3930083909 C Ci:4:001:0 0 4 = 03020100
> ffff8f0014b340c0 3930083918 S Co:4:001:0 s 23 01 0010 0002 0000 0
> ffff8f0014b340c0 3930083930 C Co:4:001:0 0 0
> ffff8f0014b340c0 3930083940 S Ci:4:001:0 s a3 00 0000 0003 0004 4 <
> ffff8f0014b340c0 3930083951 C Ci:4:001:0 0 4 = a0020000
> ffff8f0014b340c0 3930083959 S Ci:4:001:0 s a3 00 0000 0004 0004 4 <
> ffff8f0014b340c0 3930083969 C Ci:4:001:0 0 4 = a0020000
> ffff8f00151b3d80 3930190644 S Ii:4:001:1 -115:2048 4 <
> ffff8f0014b340c0 3930190706 S Ci:4:001:0 s a3 00 0000 0002 0004 4 <
> ffff8f0014b340c0 3930190741 C Ci:4:001:0 0 4 = 03020000
> ffff8f0014b340c0 3930190891 S Ci:4:001:0 s a3 00 0000 0002 0004 4 <
> ffff8f0014b340c0 3930190923 C Ci:4:001:0 0 4 = 03020000
> ffff8f0014b340c0 3930190938 S Co:4:001:0 s 23 03 0004 0002 0000 0
> ffff8f0014b340c0 3930190992 C Co:4:001:0 0 0
> ffff8f0014b340c0 3930258677 S Ci:4:001:0 s a3 00 0000 0002 0004 4 <
> ffff8f0014b340c0 3930258716 C Ci:4:001:0 0 4 = 03021000
> ffff8f0014b340c0 3930258729 S Co:4:001:0 s 23 01 0014 0002 0000 0
> ffff8f0014b340c0 3930258741 C Co:4:001:0 0 0
> ffff8f0014b340c0 3930258748 S Co:4:001:0 s 23 01 001d 0002 0000 0
> ffff8f0014b340c0 3930258758 C Co:4:001:0 0 0
> ffff8f0014b340c0 3930258765 S Co:4:001:0 s 23 01 0019 0002 0000 0
> ffff8f0014b340c0 3930258775 C Co:4:001:0 0 0
> ffff8f0014b340c0 3930258785 S Co:4:001:0 s 23 01 0010 0002 0000 0
> ffff8f0014b340c0 3930258795 C Co:4:001:0 0 0
> ffff8f0014b340c0 3930258805 S Ci:4:001:0 s a3 00 0000 0002 0004 4 <
> ffff8f0014b340c0 3930258816 C Ci:4:001:0 0 4 = 03020000
> ffff8f0014b340c0 3930338684 S Ci:4:003:0 s 80 06 0100 0000 0008 8 <
> ffff8f0014b340c0 3930338776 C Ci:4:003:0 0 8 = 12010003 00000009
> ffff8f0014b340c0 3930338799 S Co:4:003:0 s 00 31 0028 0000 0000 0
> ffff8f0014b340c0 3930338842 C Co:4:003:0 0 0
> ffff8f0014b340c0 3930338856 S Ci:4:003:0 s 80 06 0100 0000 0012 18 <
> ffff8f0014b340c0 3930338934 C Ci:4:003:0 0 18 = 12010003 00000009 7d358877 14010102 0301
> ffff8f0014b340c0 3930338957 S Ci:4:003:0 s 80 06 0f00 0000 0005 5 <
> ffff8f0014b340c0 3930339013 C Ci:4:003:0 0 5 = 050f1600 02
> ffff8f0014b340c0 3930339033 S Ci:4:003:0 s 80 06 0f00 0000 0016 22 <
> ffff8f0014b340c0 3930339110 C Ci:4:003:0 0 22 = 050f1600 02071002 02000000 0a100300 0e00010a 2000
> ffff8f0014b340c0 3930339139 S Ci:4:003:0 s 80 06 0200 0000 0009 9 <
> ffff8f0014b340c0 3930339226 C Ci:4:003:0 0 9 = 09027900 010104c0 01
> ffff8f0014b340c0 3930339243 S Ci:4:003:0 s 80 06 0200 0000 0079 121 <
> ffff8f0014b340c0 3930339406 C Ci:4:003:0 0 121 = 09027900 010104c0 01090400 00020806 50060705 81020004 0006300f 00000007
> ffff8f0014b34600 3930339428 S Ci:4:003:0 s 80 06 0300 0000 00ff 255 <
> ffff8f0014b34600 3930339508 C Ci:4:003:0 0 4 = 04030904
> ffff8f0014b34600 3930339519 S Ci:4:003:0 s 80 06 0302 0409 00ff 255 <
> ffff8f0014b34600 3930339655 C Ci:4:003:0 0 48 = 30035500 53004200 20007400 6f002000 41005400 41002f00 41005400 41005000
> ffff8f0014b34600 3930339669 S Ci:4:003:0 s 80 06 0301 0409 00ff 255 <
> ffff8f0014b34600 3930339764 C Ci:4:003:0 0 16 = 10034a00 4d006900 63007200 6f006e00
> ffff8f0014b34600 3930339777 S Ci:4:003:0 s 80 06 0303 0409 00ff 255 <
> ffff8f0014b34600 3930339873 C Ci:4:003:0 0 32 = 20033700 34004400 37003800 35003100 35003100 33003300 30003900 45003500
> ffff8f0014b34600 3930341327 S Co:4:003:0 s 00 09 0001 0000 0000 0
> ffff8f0014b34600 3930341379 C Co:4:003:0 0 0
> ffff8f0014b34600 3930341397 S Ci:4:003:0 s 80 06 0304 0409 00ff 255 <
> ffff8f0014b34600 3930341500 C Ci:4:003:0 0 34 = 22035500 53004200 20004d00 61007300 73002000 53007400 6f007200 61006700
> ffff8f0014b34600 3930341512 S Co:4:003:0 s 00 30 0000 0000 0006 6 = 0a0a0002 0002
> ffff8f0014b34600 3930341554 C Co:4:003:0 0 6 >
> ffff8f0014b34600 3930341597 S Co:4:001:0 s 23 03 0017 3202 0000 0
> ffff8f0014b34600 3930341615 C Co:4:001:0 0 0
> ffff8f0014b34600 3930341624 S Co:4:003:0 s 00 03 0030 0000 0000 0
> ffff8f0014b34600 3930341657 C Co:4:003:0 0 0
> ffff8f0014b34600 3930341665 S Co:4:003:0 s 00 30 0000 0000 0006 6 = 0a0a0002 0002
> ffff8f0014b34600 3930341708 C Co:4:003:0 0 6 >
> ffff8f0014b34600 3930341750 S Co:4:001:0 s 23 03 0018 2802 0000 0
> ffff8f0014b34600 3930341762 C Co:4:001:0 0 0
> ffff8f0014b34600 3930341769 S Co:4:003:0 s 00 03 0031 0000 0000 0
> ffff8f0014b34600 3930341803 C Co:4:003:0 0 0
> ffff8f0014b34600 3930341851 S Ci:4:003:0 s 80 06 0306 0409 00ff 255 <
> ffff8f0014b34600 3930341965 C Ci:4:003:0 0 48 = 30034d00 53004300 20004200 75006c00 6b002d00 4f006e00 6c007900 20005400

Is that really where the trace stops?  This is before any of the 
mass-storage features on the device have been used.

Can you get a similar usbmon trace for the same device under a kernel 
where it works okay?

Alan Stern
