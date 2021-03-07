Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CFC0A3302C4
	for <lists+linux-usb@lfdr.de>; Sun,  7 Mar 2021 16:54:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232105AbhCGPxU (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 7 Mar 2021 10:53:20 -0500
Received: from netrider.rowland.org ([192.131.102.5]:40257 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S232084AbhCGPwh (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 7 Mar 2021 10:52:37 -0500
Received: (qmail 104104 invoked by uid 1000); 7 Mar 2021 10:52:36 -0500
Date:   Sun, 7 Mar 2021 10:52:36 -0500
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Matthias Schwarzott <zzam@gentoo.org>
Cc:     linux-usb@vger.kernel.org, usb-storage@lists.one-eyed-alien.net,
        hirofumi@mail.parknet.co.jp
Subject: Re: Amazon Kindle disconnect after Synchronize Cache
Message-ID: <20210307155236.GB103559@rowland.harvard.edu>
References: <9f57532f-1fb7-0fdd-b91c-2dfecef5aff3@gentoo.org>
 <20210305191437.GC48113@rowland.harvard.edu>
 <2a1f6636-6b57-ccc5-76b3-7eae5e80e7d3@gentoo.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2a1f6636-6b57-ccc5-76b3-7eae5e80e7d3@gentoo.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sun, Mar 07, 2021 at 06:58:10AM +0100, Matthias Schwarzott wrote:
> Am 05.03.21 um 20:14 schrieb Alan Stern:
> > On Fri, Mar 05, 2021 at 05:54:43PM +0100, Matthias Schwarzott wrote:
> > > One major difference I noticed looking at service answer time statistics:
> > > Windows sends a lot more requests of type "Test Unit Ready".
> > > * Windows: 6385 calls
> > > * linux: 71 calls
> > 
> > It's generally well known that Windows issues lots and lots of redundant
> > commands to USB storage drives.
> > 
> > 
> > Unless the Kindle advertises removable media, there doesn't seem to be
> > any real point to all those TEST UNIT READY commands.  Unless they are
> > what prevents the disconnections...
> > 
> This is kernel log from connecting:
> [41709.248006] usb 3-4: new high-speed USB device number 6 using xhci_hcd
> [41709.380015] usb 3-4: New USB device found, idVendor=1949, idProduct=0004,
> bcdDevice= 1.00
> [41709.380019] usb 3-4: New USB device strings: Mfr=1, Product=2,
> SerialNumber=3
> [41709.380021] usb 3-4: Product: Amazon Kindle
> [41709.380022] usb 3-4: Manufacturer: Amazon
> [41709.380023] usb 3-4: SerialNumber: REMOVED
> [41709.493988] usb-storage 3-4:1.0: USB Mass Storage device detected
> [41709.494080] scsi host6: usb-storage 3-4:1.0
> [41710.510122] scsi 6:0:0:0: Direct-Access     Kindle   Internal Storage
> 0100 PQ: 0 ANSI: 2
> [41710.510245] sd 6:0:0:0: Attached scsi generic sg3 type 0
> [41710.513059] sd 6:0:0:0: Power-on or device reset occurred
> [41710.526331] sd 6:0:0:0: [sdc] Attached SCSI removable disk
> [41712.629152] sd 6:0:0:0: [sdc] 6688768 512-byte logical blocks: (3.42
> GB/3.19 GiB)
> [41712.846353] sd 6:0:0:0: [sdc] Write cache: enabled, read cache: enabled,
> doesn't support DPO or FUA
> [41712.846357] sdc: detected capacity change from 0 to 6688768
> [41712.849499]  sdc: sdc1
> 
> As it prints "Attached SCSI removable disk" the device advertises removable
> media.

Yes.

> > > How can I get further on this topic?
> > 
> > Is runtime power management enabled?  Maybe the Kindle disconnects
> > whenever the computer tries to suspend it.  This typically happens 2
> > seconds after the last command was issued, which matches your
> > observations.  If runtime PM is enabled, you can try disabling it.
> > 
> I assume this means autosuspend is not used:
> 
> # cat /sys/block/sde/device/power/control
> on

This means autosuspend isn't used for the sde drive.  But the log 
extract above shows that the Kindle is sdc, not sde.

Alan Stern
