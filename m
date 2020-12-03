Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6A9842CD681
	for <lists+linux-usb@lfdr.de>; Thu,  3 Dec 2020 14:19:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730394AbgLCNRg (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 3 Dec 2020 08:17:36 -0500
Received: from mx2.suse.de ([195.135.220.15]:54404 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726220AbgLCNRg (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 3 Dec 2020 08:17:36 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
        t=1607001409; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=wA9zGWhbyW1q6G7J01Q+nXCfdvp/UXVm8NFtBbhtozU=;
        b=mCrm7CbltGvZFfrynqwjeK248yGNv0NskO+/hO4joIpdmevmfC7AqA3LAmkhc52d/xjQfY
        Bf0m092stxkdnfyb1gz29ydYfLj4zec/VO0tCCqr8b/IkxS8AyXp/raT1JtDtfnEYarGjr
        f/BYsWVOhqQLLLYoMWpYQhguv6lWBNQ=
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 70687AF45;
        Thu,  3 Dec 2020 13:16:49 +0000 (UTC)
Message-ID: <918e298941f820a7cc3310c95dc211cca7596dba.camel@suse.com>
Subject: Re: Issues with LaCie USB3 drive and UAS
From:   Oliver Neukum <oneukum@suse.com>
To:     "David C. Partridge" <david.partridge@perdrix.co.uk>,
        linux-usb@vger.kernel.org
Date:   Thu, 03 Dec 2020 14:16:46 +0100
In-Reply-To: <000301d6c919$af7a94e0$0e6fbea0$@perdrix.co.uk>
References: <004f01d6b5bd$d4f08ff0$7ed1afd0$@perdrix.co.uk>
                                              <eceedea7ca5d950eb8ea4d186a6b01a04d0a804f.camel@suse.com>
                                               <001601d6b67d$e97a1e30$bc6e5a90$@perdrix.co.uk>
                                         <aebf92944c1ecb256d21108ce092165a0fd904db.camel@suse.com>
                                       <001b01d6b68a$79937fa0$6cba7ee0$@perdrix.co.uk>
                                         <007901d6b6ab$f0f66230$d2e32690$@perdrix.co.uk>
                                 <43abe2af0352f17f93e2453a86e2ed47b9913b6a.camel@suse.com>
                               <000f01d6c326$1eea3f50$5cbebdf0$@perdrix.co.uk>
                         <d478123862a7e94898aaa771c21cc8cb0a3819fc.camel@suse.com>
                         <008101d6c3d7$2427ee70$6c77cb50$@perdrix.co.uk>
                 <11ea70180f52b4965a451b3970891e0f547c777b.camel@suse.com>
                 <000001d6c89c$086812e0$193838a0$@perdrix.co.uk>
         <612be9a9cd6ffdb9492781e174859c7b4e694a86.camel@suse.com>
         <000301d6c919$af7a94e0$0e6fbea0$@perdrix.co.uk>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Am Donnerstag, den 03.12.2020, 02:11 +0000 schrieb David C. Partridge:

Hi,

cool, thank your for testing! You having spent so much time
and effort on this, let's go through the log with a fine comb.

> Now with uas.ko	and usb-storage.ko 
> 
> Dec 03 02:05:56 charon kernel: usb 2-1: new SuperSpeed Gen 1 USB device number 2 using xhci_hcd
> Dec 03 02:05:56 charon kernel: usb 2-1: New USB device found, idVendor=059f, idProduct=105f, bcdDevice= 0.01
> Dec 03 02:05:56 charon kernel: usb 2-1: New USB device strings: Mfr=2, Product=3, SerialNumber=1
> Dec 03 02:05:56 charon kernel: usb 2-1: Product: 2Big Quadra USB3
> Dec 03 02:05:56 charon kernel: usb 2-1: Manufacturer: LaCie
> Dec 03 02:05:56 charon kernel: usb 2-1: SerialNumber: 00000000250e9e711084

This is from usbcore. It reports that a new device has been detected.

> Dec 03 02:05:56 charon mtp-probe[3108]: checking bus 2, device 2: "/sys/devices/pci0000:00/0000:00:14.0/usb2/2-1"
> Dec 03 02:05:56 charon mtp-probe[3108]: bus: 2, device: 2 was not an MTP device

From udev. It basically means that it is not a camera to import
pictures from.

> Dec 03 02:05:56 charon kernel: usb_storage: loading out-of-tree module taints kernel.
> Dec 03 02:05:56 charon kernel: usb_storage: module verification failed: signature and/or required key missing - tainting kernel
> Dec 03 02:05:56 charon kernel: usbcore: registered new interface driver usb-storage

The kernel identified the device as storage and udev has loaded drivers
now being probed.

> Dec 03 02:05:56 charon kernel: scsi host5: uas
> Dec 03 02:05:56 charon kernel: usbcore: registered new interface driver uas

UAS is taking the device.

> Dec 03 02:05:56 charon kernel: scsi 5:0:0:0: Direct-Access     LaCie    2Big Quadra v3   051E PQ: 0 ANSI: 6
> Dec 03 02:05:56 charon kernel: sd 5:0:0:0: Attached scsi generic sg3 type 0

It is identified as a disk.

> Dec 03 02:05:56 charon mtp-probe[3117]: checking bus 2, device 2: "/sys/devices/pci0000:00/0000:00:14.0/usb2/2-1"
> Dec 03 02:05:56 charon mtp-probe[3117]: bus: 2, device: 2 was not an MTP device

Again, not a camera.

> Dec 03 02:05:56 charon kernel: sd 5:0:0:0: [sdc] 7814025564 512-byte logical blocks: (4.00 TB/3.64 TiB)
> Dec 03 02:05:56 charon kernel: sd 5:0:0:0: [sdc] Write Protect is off
> Dec 03 02:05:56 charon kernel: sd 5:0:0:0: [sdc] Mode Sense: 43 00 00 00
> Dec 03 02:05:56 charon kernel: sd 5:0:0:0: [sdc] Write cache: enabled, read cache: enabled, doesn't support DPO or FUA

Its size and caching attributes are determined. Is the size of 4 TB
correct?

> Dec 03 02:06:13 charon kernel: usb 2-1: USB disconnect, device number 2

A disconnect after 17 seconds. Whether this is a bug or not depends on
whether you pulled the plug. Did you?

> Dec 03 02:06:13 charon kernel: sd 5:0:0:0: [sdc] Optimal transfer size 33553920 bytes
> Dec 03 02:06:14 charon kernel: sd 5:0:0:0: [sdc] Read Capacity(16) failed: Result: hostbyte=DID_ERROR driverbyte=DRIVER_OK
> Dec 03 02:06:14 charon kernel: sd 5:0:0:0: [sdc] Sense not available.
> Dec 03 02:06:14 charon kernel: sd 5:0:0:0: [sdc] Read Capacity(10) failed: Result: hostbyte=DID_ERROR driverbyte=DRIVER_OK
> Dec 03 02:06:14 charon kernel: sd 5:0:0:0: [sdc] Sense not available.
> Dec 03 02:06:14 charon kernel: sd 5:0:0:0: [sdc] 0 512-byte logical blocks: (0 B/0 B)
> Dec 03 02:06:14 charon kernel: sd 5:0:0:0: [sdc] Attached SCSI disk

This has to happen if the device is unavailable.

> Dec 03 02:06:15 charon kernel: usb 2-1: new SuperSpeed Gen 1 USB device number 3 using xhci_hcd
> Dec 03 02:06:15 charon kernel: usb 2-1: New USB device found, idVendor=059f, idProduct=105f, bcdDevice= 0.01
> Dec 03 02:06:15 charon kernel: usb 2-1: New USB device strings: Mfr=2, Product=3, SerialNumber=1
> Dec 03 02:06:15 charon kernel: usb 2-1: Product: 2Big Quadra USB3
> Dec 03 02:06:15 charon kernel: usb 2-1: Manufacturer: LaCie
> Dec 03 02:06:15 charon kernel: usb 2-1: SerialNumber: 00000000250e9e711084
> Dec 03 02:06:15 charon kernel: scsi host5: uas
> Dec 03 02:06:15 charon kernel: scsi 5:0:0:0: Direct-Access     LaCie    2Big Quadra v3   051E PQ: 0 ANSI: 6
> Dec 03 02:06:15 charon kernel: sd 5:0:0:0: Attached scsi generic sg3 type 0
> Dec 03 02:06:15 charon kernel: sd 5:0:0:0: [sdc] 7814025564 512-byte logical blocks: (4.00 TB/3.64 TiB)
> Dec 03 02:06:15 charon kernel: sd 5:0:0:0: [sdc] Write Protect is off
> Dec 03 02:06:15 charon kernel: sd 5:0:0:0: [sdc] Mode Sense: 43 00 00 00
> Dec 03 02:06:15 charon kernel: sd 5:0:0:0: [sdc] Write cache: enabled, read cache: enabled, doesn't support DPO or FUA
> Dec 03 02:06:15 charon mtp-probe[3209]: checking bus 2, device 3: "/sys/devices/pci0000:00/0000:00:14.0/usb2/2-1"
> Dec 03 02:06:15 charon mtp-probe[3209]: bus: 2, device: 3 was not an MTP device
> Dec 03 02:06:15 charon mtp-probe[3212]: checking bus 2, device 3: "/sys/devices/pci0000:00/0000:00:14.0/usb2/2-1"
> Dec 03 02:06:15 charon mtp-probe[3212]: bus: 2, device: 3 was not an MTP device

This is basically a repeat of the first event.

> Dec 03 02:06:46 charon kernel: sd 5:0:0:0: tag#28 uas_eh_abort_handler 0 uas-tag 1 inflight: IN 
> Dec 03 02:06:46 charon kernel: sd 5:0:0:0: tag#28 CDB: Report supported operation codes a3 0c 01 12 00 00 00 00 02 00 00 00

This is a SCSI command: REPORT SUPPORTED OPERATION CODES command
Having this command fail is a bit ironic I suppose.

> Dec 03 02:06:46 charon kernel: scsi host5: uas_eh_device_reset_handler start
> Dec 03 02:06:47 charon kernel: usb 2-1: reset SuperSpeed Gen 1 USB device number 3 using xhci_hcd
> Dec 03 02:06:47 charon kernel: scsi host5: uas_eh_device_reset_handler success
> Dec 03 02:07:17 charon kernel: scsi host5: uas_eh_device_reset_handler start
> Dec 03 02:07:17 charon kernel: sd 5:0:0:0: tag#28 uas_zap_pending 0 uas-tag 1 inflight: 
> Dec 03 02:07:17 charon kernel: sd 5:0:0:0: tag#28 CDB: Report supported operation codes a3 0c 01 12 00 00 00 00 02 00 00 00
> Dec 03 02:07:17 charon kernel: usb 2-1: reset SuperSpeed Gen 1 USB device number 3 using xhci_hcd
> Dec 03 02:07:17 charon kernel: scsi host5: uas_eh_device_reset_handler success

And it happens again. This device is seriously buggy. Is it usable
after that or did you just cut the log?

	Regards & Thanks
		Oliver


