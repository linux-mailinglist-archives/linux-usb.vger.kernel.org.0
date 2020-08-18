Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 58EAC248862
	for <lists+linux-usb@lfdr.de>; Tue, 18 Aug 2020 16:57:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727785AbgHRO5Z (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 18 Aug 2020 10:57:25 -0400
Received: from netrider.rowland.org ([192.131.102.5]:57581 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1726145AbgHRO5X (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 18 Aug 2020 10:57:23 -0400
Received: (qmail 146769 invoked by uid 1000); 18 Aug 2020 10:57:22 -0400
Date:   Tue, 18 Aug 2020 10:57:22 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Cyril Roelandt <tipecaml@gmail.com>
Cc:     USB list <linux-usb@vger.kernel.org>, sellis@redhat.com,
        pachoramos@gmail.com, labbott@fedoraproject.org,
        gregkh@linuxfoundation.org, javhera@gmx.com, brice.goglin@gmail.com
Subject: Re: [BUG] Regression in Linux 5.4.17 for JMicron JMS566 enclosure
Message-ID: <20200818145722.GA146472@rowland.harvard.edu>
References: <20200417220957.GA4707@Susan>
 <Pine.LNX.4.44L0.2004191144550.4266-100000@netrider.rowland.org>
 <20200421030137.GA2492@Susan>
 <20200815001829.GA2786@Susan>
 <20200815021929.GC52242@rowland.harvard.edu>
 <20200815232357.GB2786@Susan>
 <20200816162642.GC86937@rowland.harvard.edu>
 <20200818041324.GA3173@Susan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200818041324.GA3173@Susan>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Aug 18, 2020 at 06:13:24AM +0200, Cyril Roelandt wrote:
> Hello,
> 
> On 2020-08-16 12:26, Alan Stern wrote:
> > 
> > If I understand correctly, you have said that 5.4 with the patch
> > applied and using usb-storage makes more progress than 5.7 with the
> > patch applied and using usb-storage.  Is that right?
> 
> So, here is a summary of the issue:
> 
> 1) The enclosure worked fine using UAS
> 2) Commit bc3bdb12bbb34 disabled UAS for this enclosure, forcing it to
> use usb-storage. This prevented me from mounting the partitions (mount
> would fail with "can't read superblock on /dev/sdb1")
> 3) I thought commit 94f9c8c3c404e fixed the issue described in 2), but
> it doesn't (I failed to test the patch properly). Now I cannot even see
> my partitions. It does seem like usb-storage does not run at all, as you
> pointed out.
> 
> I never got this enclosure working with usb-storage.
> 
> I am inlining dmesg logs (with dynamic debug enabled) and usbmon traces
> for two different kernels: 5.7.15 (the partitions cannot be seen), and
> 5.7.15 with 94f9c8c3c404e reverted (the partitions can be seen, but
> cannot be mounted).
> 
> 
> * Kernel 5.7.15:
> 
> # dmesg -T
> [Tue Aug 18 05:14:19 2020] usb 2-2: new SuperSpeed Gen 1 USB device number 3 using xhci_hcd
> [Tue Aug 18 05:14:19 2020] usb 2-2: New USB device found, idVendor=357d, idProduct=7788, bcdDevice= 1.14
> [Tue Aug 18 05:14:19 2020] usb 2-2: New USB device strings: Mfr=1, Product=2, SerialNumber=3
> [Tue Aug 18 05:14:19 2020] usb 2-2: Product: USB to ATA/ATAPI Bridge
> [Tue Aug 18 05:14:19 2020] usb 2-2: Manufacturer: JMicron
> [Tue Aug 18 05:14:19 2020] usb 2-2: SerialNumber: 74D7851513309E5
> [Tue Aug 18 05:14:19 2020] usb 2-2: UAS is blacklisted for this device, using usb-storage instead

> * Kernel 5.7.15 with 94f9c8c3c404e reverted:
> 
> # dmesg -T
> [Tue Aug 18 04:26:34 2020] usb 4-2: new SuperSpeed Gen 1 USB device number 4 using xhci_hcd
> [Tue Aug 18 04:26:34 2020] usb 4-2: New USB device found, idVendor=357d, idProduct=7788, bcdDevice= 1.14
> [Tue Aug 18 04:26:34 2020] usb 4-2: New USB device strings: Mfr=1, Product=2, SerialNumber=3
> [Tue Aug 18 04:26:34 2020] usb 4-2: Product: USB to ATA/ATAPI Bridge
> [Tue Aug 18 04:26:34 2020] usb 4-2: Manufacturer: JMicron
> [Tue Aug 18 04:26:34 2020] usb 4-2: SerialNumber: 74D7851513309E5
> [Tue Aug 18 04:26:34 2020] usb 4-2: UAS is blacklisted for this device, using usb-storage instead
> [Tue Aug 18 04:26:34 2020] usb-storage 4-2:1.0: USB Mass Storage device detected
> [Tue Aug 18 04:26:34 2020] usb-storage 4-2:1.0: Quirks match for vid 357d pid 7788: 4800000

Somehow that commit is causing usb-storage to go crazy.  You're going
to have to do some debugging to find out why.

Here's what to look for in drivers/usb/storage/usb.c:

	Is storage_probe() getting called at all?

	If it is, it doesn't seem to get as far as calling
	usb_stor_probe1().  Can you find out where it goes off the
	rails and why?

Alan Stern
