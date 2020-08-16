Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A3607245886
	for <lists+linux-usb@lfdr.de>; Sun, 16 Aug 2020 18:26:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728521AbgHPQ0q (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 16 Aug 2020 12:26:46 -0400
Received: from netrider.rowland.org ([192.131.102.5]:38259 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1726847AbgHPQ0n (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 16 Aug 2020 12:26:43 -0400
Received: (qmail 87543 invoked by uid 1000); 16 Aug 2020 12:26:42 -0400
Date:   Sun, 16 Aug 2020 12:26:42 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Cyril Roelandt <tipecaml@gmail.com>
Cc:     USB list <linux-usb@vger.kernel.org>, sellis@redhat.com,
        pachoramos@gmail.com, labbott@fedoraproject.org,
        gregkh@linuxfoundation.org, javhera@gmx.com, brice.goglin@gmail.com
Subject: Re: [BUG] Regression in Linux 5.4.17 for JMicron JMS566 enclosure
Message-ID: <20200816162642.GC86937@rowland.harvard.edu>
References: <20200417220957.GA4707@Susan>
 <Pine.LNX.4.44L0.2004191144550.4266-100000@netrider.rowland.org>
 <20200421030137.GA2492@Susan>
 <20200815001829.GA2786@Susan>
 <20200815021929.GC52242@rowland.harvard.edu>
 <20200815232357.GB2786@Susan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200815232357.GB2786@Susan>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sun, Aug 16, 2020 at 01:23:57AM +0200, Cyril Roelandt wrote:
> Hello,
> 
> On 2020-08-14 22:19, Alan Stern wrote:
> > [...]
> > 
> > Is that really where the trace stops?  This is before any of the 
> > mass-storage features on the device have been used.
> 
> Yes. I ran "cat /sys/kernel/debug/usb/usbmon/4u", plugged the drive,
> waited for a few minutes, and only got these 69 lines.
> 
> > Can you get a similar usbmon trace for the same device under a kernel 
> > where it works okay?
> 
> I'm inlining a few different traces that I recorded when my original
> issue occured:
> 
> 1) The faulty enclosure, using UAS on Linux 5.3 (everything worked as
> expected)
> 2) The faulty enclosure, using usb-storage on Linux 5.4.19 (I could see
> the partitions but could not mount them)
> 3) A similar enclosure (same vendorId and productId, but the bcdDevice
> is 2.03, not 1.14) that works fine using usb-storage on recent kernels.
> 
> I hope they are helpful.

Just the opposite -- they make the whole thing much too confusing.

What we need is a comparison using the exact same hardware, the same
driver, and (to as great an extent as possible) the same kernel.  Not
exactly the same, obviously, because then the behavior wouldn't change
-- I mean two very similar kernels that nevertheless behave
differently.

If I understand correctly, you have said that 5.4 with the patch
applied and using usb-storage makes more progress than 5.7 with the
patch applied and using usb-storage.  Is that right?

Assuming it is, the next task is to find out why.  In fact, as far as
I could see from your 5.7 usbmon trace, the usb-storage driver didn't
run at all!  You should try enabling dynamic debugging for usb-storage
under both kernels:

	echo 'module usb_storage =p' >/sys/kernel/debug/dynamic_debug/control

before plugging in the device, and see what shows up in the dmesg
log.  (No need to post the entire log, just the part starting from
when you plug in the device.)

> 2) The faulty enclosure, using usb-storage on Linux 5.4.19 (I could see
> ffff908f505a2180 79447205 S Ci:001:00 s a3 00 0000 0001 0004 4 <
> ffff908f505a2180 79447236 C Ci:001:00 0 4 = a0020000
> ffff908f505a2180 79447245 S Ci:001:00 s a3 00 0000 0002 0004 4 <
> ffff908f505a2180 79447250 C Ci:001:00 0 4 = 03020100
> ffff908f505a2180 79447254 S Co:001:00 s 23 01 0010 0002 0000 0
> ffff908f505a2180 79447261 C Co:001:00 0 0
> ffff908f505a2180 79447264 S Ci:001:00 s a3 00 0000 0003 0004 4 <
> ffff908f505a2180 79447269 C Ci:001:00 0 4 = a0020000
> ffff908f505a2180 79447272 S Ci:001:00 s a3 00 0000 0004 0004 4 <
> ffff908f505a2180 79447276 C Ci:001:00 0 4 = a0020000
> ffff908f4a08ed80 79552959 S Ii:001:01 -115 4 <
> ffff908f505a2180 79552991 S Ci:001:00 s a3 00 0000 0002 0004 4 <
> ffff908f505a2180 79553010 C Ci:001:00 0 4 = 03020000
> ffff908f505a2180 79553124 S Ci:001:00 s a3 00 0000 0002 0004 4 <
> ffff908f505a2180 79553140 C Ci:001:00 0 4 = 03020000
> ffff908f505a2180 79553147 S Co:001:00 s 23 03 0004 0002 0000 0
> ffff908f505a2180 79553157 C Co:001:00 0 0
> ffff908f505a2180 79620966 S Ci:001:00 s a3 00 0000 0002 0004 4 <
> ffff908f505a2180 79620995 C Ci:001:00 0 4 = 03021000
> ffff908f505a2180 79621003 S Co:001:00 s 23 01 0014 0002 0000 0
> ffff908f505a2180 79621012 C Co:001:00 0 0
> ffff908f505a2180 79621017 S Co:001:00 s 23 01 001d 0002 0000 0
> ffff908f505a2180 79621025 C Co:001:00 0 0
> ffff908f505a2180 79621030 S Co:001:00 s 23 01 0019 0002 0000 0
> ffff908f505a2180 79621038 C Co:001:00 0 0
> ffff908f505a2180 79621041 S Co:001:00 s 23 01 0010 0002 0000 0
> ffff908f505a2180 79621048 C Co:001:00 0 0
> ffff908f505a2180 79621053 S Ci:001:00 s a3 00 0000 0002 0004 4 <
> ffff908f505a2180 79621060 C Ci:001:00 0 4 = 03020000
> ffff908f505a2180 79700950 S Ci:004:00 s 80 06 0100 0000 0008 8 <
> ffff908f505a2180 79701062 C Ci:004:00 0 8 = 12010003 00000009
> ffff908f505a2180 79701095 S Co:004:00 s 00 31 0028 0000 0000 0
> ffff908f505a2180 79701153 C Co:004:00 0 0
> ffff908f505a2180 79701175 S Ci:004:00 s 80 06 0100 0000 0012 18 <
> ffff908f505a2180 79701270 C Ci:004:00 0 18 = 12010003 00000009 7d358877 14010102 0301
> ffff908f505a2180 79701305 S Ci:004:00 s 80 06 0f00 0000 0005 5 <
> ffff908f505a2180 79701360 C Ci:004:00 0 5 = 050f1600 02
> ffff908f505a2180 79701379 S Ci:004:00 s 80 06 0f00 0000 0016 22 <
> ffff908f505a2180 79701471 C Ci:004:00 0 22 = 050f1600 02071002 02000000 0a100300 0e00010a 2000
> ffff908f505a2180 79701514 S Ci:004:00 s 80 06 0200 0000 0009 9 <
> ffff908f505a2180 79701637 C Ci:004:00 0 9 = 09027900 010104c0 01
> ffff908f505a2180 79701669 S Ci:004:00 s 80 06 0200 0000 0079 121 <
> ffff908f505a2180 79701831 C Ci:004:00 0 121 = 09027900 010104c0 01090400 00020806 50060705 81020004 0006300f 00000007
> ffff908f505a2240 79701856 S Ci:004:00 s 80 06 0300 0000 00ff 255 <
> ffff908f505a2240 79701931 C Ci:004:00 0 4 = 04030904
> ffff908f505a2240 79701945 S Ci:004:00 s 80 06 0302 0409 00ff 255 <
> ffff908f505a2240 79702080 C Ci:004:00 0 48 = 30035500 53004200 20007400 6f002000 41005400 41002f00 41005400 41005000
> ffff908f505a2240 79702093 S Ci:004:00 s 80 06 0301 0409 00ff 255 <
> ffff908f505a2240 79702184 C Ci:004:00 0 16 = 10034a00 4d006900 63007200 6f006e00
> ffff908f505a2240 79702196 S Ci:004:00 s 80 06 0303 0409 00ff 255 <
> ffff908f505a2240 79702289 C Ci:004:00 0 32 = 20033700 34004400 37003800 35003100 35003100 33003300 30003900 45003500
> ffff908f505a2240 79702895 S Co:004:00 s 00 09 0001 0000 0000 0
> ffff908f505a2240 79702949 C Co:004:00 0 0
> ffff908f505a2240 79702965 S Ci:004:00 s 80 06 0304 0409 00ff 255 <
> ffff908f505a2240 79703065 C Ci:004:00 0 34 = 22035500 53004200 20004d00 61007300 73002000 53007400 6f007200 61006700
> ffff908f505a2240 79703082 S Co:004:00 s 00 30 0000 0000 0006 6 = 0a0a0002 0002
> ffff908f505a2240 79703120 C Co:004:00 0 6 >
> ffff908f505a2240 79703165 S Co:001:00 s 23 03 0017 3202 0000 0
> ffff908f505a2240 79703183 C Co:001:00 0 0
> ffff908f505a2240 79703188 S Co:004:00 s 00 03 0030 0000 0000 0
> ffff908f505a2240 79703217 C Co:004:00 0 0
> ffff908f505a2240 79703226 S Co:004:00 s 00 30 0000 0000 0006 6 = 0a0a0002 0002
> ffff908f505a2240 79703263 C Co:004:00 0 6 >
> ffff908f505a2240 79703309 S Co:001:00 s 23 03 0018 2802 0000 0
> ffff908f505a2240 79703319 C Co:001:00 0 0
> ffff908f505a2240 79703323 S Co:004:00 s 00 03 0031 0000 0000 0
> ffff908f505a2240 79703351 C Co:004:00 0 0
> ffff908f505a2240 79703389 S Ci:004:00 s 80 06 0306 0409 00ff 255 <
> ffff908f505a2240 79703498 C Ci:004:00 0 48 = 30034d00 53004300 20004200 75006c00 6b002d00 4f006e00 6c007900 20005400

If you compare the usbmon traces, you'll see that the 5.7 trace
stopped exactly here.

> ffff908f505a2300 80704945 S Ci:004:00 s a1 fe 0000 0000 0001 1 <
> ffff908f505a2300 80705020 C Ci:004:00 0 1 = 00

These two lines are the first things that usb-storage does when
communicating with a newly plugged-in device.

Alan Stern
