Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E5A172CCC50
	for <lists+linux-usb@lfdr.de>; Thu,  3 Dec 2020 03:12:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729481AbgLCCMs convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Wed, 2 Dec 2020 21:12:48 -0500
Received: from avasout01.plus.net ([84.93.230.227]:52103 "EHLO
        avasout01.plus.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725859AbgLCCMs (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 2 Dec 2020 21:12:48 -0500
Received: from APOLLO ([212.159.61.44])
        by smtp with ESMTPA
        id ke6Bkqa98n8O7ke6CkZfze; Thu, 03 Dec 2020 02:12:01 +0000
X-Clacks-Overhead: "GNU Terry Pratchett"
X-CM-Score: 0.00
X-CNFS-Analysis: v=2.3 cv=Ld6nFgXi c=1 sm=1 tr=0
 a=AGp1duJPimIJhwGXxSk9fg==:117 a=AGp1duJPimIJhwGXxSk9fg==:17
 a=IkcTkHD0fZMA:10 a=iox4zFpeAAAA:8 a=VwQbUJbxAAAA:8 a=ZT0X36KOlGUsngzDnxcA:9
 a=QEXdDO2ut3YA:10 a=WzC6qhA0u3u7Ye7llzcV:22 a=AjGcO6oz07-iQ99wixmX:22
X-AUTH: perdrix52@:2500
From:   "David C. Partridge" <david.partridge@perdrix.co.uk>
To:     "'Oliver Neukum'" <oneukum@suse.com>, <linux-usb@vger.kernel.org>
References: <004f01d6b5bd$d4f08ff0$7ed1afd0$@perdrix.co.uk>                                      <eceedea7ca5d950eb8ea4d186a6b01a04d0a804f.camel@suse.com>                                       <001601d6b67d$e97a1e30$bc6e5a90$@perdrix.co.uk>                                 <aebf92944c1ecb256d21108ce092165a0fd904db.camel@suse.com>                               <001b01d6b68a$79937fa0$6cba7ee0$@perdrix.co.uk>                                 <007901d6b6ab$f0f66230$d2e32690$@perdrix.co.uk>                         <43abe2af0352f17f93e2453a86e2ed47b9913b6a.camel@suse.com>                       <000f01d6c326$1eea3f50$5cbebdf0$@perdrix.co.uk>                 <d478123862a7e94898aaa771c21cc8cb0a3819fc.camel@suse.com>                 <008101d6c3d7$2427ee70$6c77cb50$@perdrix.co.uk>         <11ea70180f52b4965a451b3970891e0f547c777b.camel@suse.com>         <000001d6c89c$086812e0$193838a0$@perdrix.co.uk> <612be9a9cd6ffdb9492781e174859c7b4e694a86.camel@suse.com>
In-Reply-To: <612be9a9cd6ffdb9492781e174859c7b4e694a86.camel@suse.com>
Subject: RE: Issues with LaCie USB3 drive and UAS
Date:   Thu, 3 Dec 2020 02:11:59 -0000
Message-ID: <000301d6c919$af7a94e0$0e6fbea0$@perdrix.co.uk>
MIME-Version: 1.0
Content-Type: text/plain;
        charset="utf-8"
Content-Transfer-Encoding: 8BIT
X-Mailer: Microsoft Outlook 14.0
Thread-Index: AQEj7PcoQVookx4f1d3/LPoLd4O7AAH2dKS3AXO3T8ACPDV8AQK5Jqf9AfTPe88CoAnckwML8I43Acv3vzcCAy63SAJfP5HDAb+vYkUBebTJRKp/F7gQ
Content-Language: en-gb
X-CMAE-Envelope: MS4wfLsokk8ObWkyhvtiRh4XZjmFXFvte+RaEomrZL16IwlZfTMRdXxaDoXGqNyypXu8iT9c+rK8a5qaPVVG49xjz+WDnDo/Xd3OGI71Ly/NIikstMf1Vijp
 QvGstmnXobTMPKarjLpnnrfzzzMgALyydrWaJjF3d2z0s1PUZFYKZFRdrjHdqV7SLZS5OhaAuTpNtQ==
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Now with uas.ko	and usb-storage.ko 

Dec 03 02:05:56 charon kernel: usb 2-1: new SuperSpeed Gen 1 USB device number 2 using xhci_hcd
Dec 03 02:05:56 charon kernel: usb 2-1: New USB device found, idVendor=059f, idProduct=105f, bcdDevice= 0.01
Dec 03 02:05:56 charon kernel: usb 2-1: New USB device strings: Mfr=2, Product=3, SerialNumber=1
Dec 03 02:05:56 charon kernel: usb 2-1: Product: 2Big Quadra USB3
Dec 03 02:05:56 charon kernel: usb 2-1: Manufacturer: LaCie
Dec 03 02:05:56 charon kernel: usb 2-1: SerialNumber: 00000000250e9e711084
Dec 03 02:05:56 charon mtp-probe[3108]: checking bus 2, device 2: "/sys/devices/pci0000:00/0000:00:14.0/usb2/2-1"
Dec 03 02:05:56 charon mtp-probe[3108]: bus: 2, device: 2 was not an MTP device
Dec 03 02:05:56 charon kernel: usb_storage: loading out-of-tree module taints kernel.
Dec 03 02:05:56 charon kernel: usb_storage: module verification failed: signature and/or required key missing - tainting kernel
Dec 03 02:05:56 charon kernel: usbcore: registered new interface driver usb-storage
Dec 03 02:05:56 charon kernel: scsi host5: uas
Dec 03 02:05:56 charon kernel: usbcore: registered new interface driver uas
Dec 03 02:05:56 charon kernel: scsi 5:0:0:0: Direct-Access     LaCie    2Big Quadra v3   051E PQ: 0 ANSI: 6
Dec 03 02:05:56 charon kernel: sd 5:0:0:0: Attached scsi generic sg3 type 0
Dec 03 02:05:56 charon mtp-probe[3117]: checking bus 2, device 2: "/sys/devices/pci0000:00/0000:00:14.0/usb2/2-1"
Dec 03 02:05:56 charon mtp-probe[3117]: bus: 2, device: 2 was not an MTP device
Dec 03 02:05:56 charon kernel: sd 5:0:0:0: [sdc] 7814025564 512-byte logical blocks: (4.00 TB/3.64 TiB)
Dec 03 02:05:56 charon kernel: sd 5:0:0:0: [sdc] Write Protect is off
Dec 03 02:05:56 charon kernel: sd 5:0:0:0: [sdc] Mode Sense: 43 00 00 00
Dec 03 02:05:56 charon kernel: sd 5:0:0:0: [sdc] Write cache: enabled, read cache: enabled, doesn't support DPO or FUA
Dec 03 02:06:13 charon kernel: usb 2-1: USB disconnect, device number 2
Dec 03 02:06:13 charon kernel: sd 5:0:0:0: [sdc] Optimal transfer size 33553920 bytes
Dec 03 02:06:14 charon kernel: sd 5:0:0:0: [sdc] Read Capacity(16) failed: Result: hostbyte=DID_ERROR driverbyte=DRIVER_OK
Dec 03 02:06:14 charon kernel: sd 5:0:0:0: [sdc] Sense not available.
Dec 03 02:06:14 charon kernel: sd 5:0:0:0: [sdc] Read Capacity(10) failed: Result: hostbyte=DID_ERROR driverbyte=DRIVER_OK
Dec 03 02:06:14 charon kernel: sd 5:0:0:0: [sdc] Sense not available.
Dec 03 02:06:14 charon kernel: sd 5:0:0:0: [sdc] 0 512-byte logical blocks: (0 B/0 B)
Dec 03 02:06:14 charon kernel: sd 5:0:0:0: [sdc] Attached SCSI disk
Dec 03 02:06:15 charon kernel: usb 2-1: new SuperSpeed Gen 1 USB device number 3 using xhci_hcd
Dec 03 02:06:15 charon kernel: usb 2-1: New USB device found, idVendor=059f, idProduct=105f, bcdDevice= 0.01
Dec 03 02:06:15 charon kernel: usb 2-1: New USB device strings: Mfr=2, Product=3, SerialNumber=1
Dec 03 02:06:15 charon kernel: usb 2-1: Product: 2Big Quadra USB3
Dec 03 02:06:15 charon kernel: usb 2-1: Manufacturer: LaCie
Dec 03 02:06:15 charon kernel: usb 2-1: SerialNumber: 00000000250e9e711084
Dec 03 02:06:15 charon kernel: scsi host5: uas
Dec 03 02:06:15 charon kernel: scsi 5:0:0:0: Direct-Access     LaCie    2Big Quadra v3   051E PQ: 0 ANSI: 6
Dec 03 02:06:15 charon kernel: sd 5:0:0:0: Attached scsi generic sg3 type 0
Dec 03 02:06:15 charon kernel: sd 5:0:0:0: [sdc] 7814025564 512-byte logical blocks: (4.00 TB/3.64 TiB)
Dec 03 02:06:15 charon kernel: sd 5:0:0:0: [sdc] Write Protect is off
Dec 03 02:06:15 charon kernel: sd 5:0:0:0: [sdc] Mode Sense: 43 00 00 00
Dec 03 02:06:15 charon kernel: sd 5:0:0:0: [sdc] Write cache: enabled, read cache: enabled, doesn't support DPO or FUA
Dec 03 02:06:15 charon mtp-probe[3209]: checking bus 2, device 3: "/sys/devices/pci0000:00/0000:00:14.0/usb2/2-1"
Dec 03 02:06:15 charon mtp-probe[3209]: bus: 2, device: 3 was not an MTP device
Dec 03 02:06:15 charon mtp-probe[3212]: checking bus 2, device 3: "/sys/devices/pci0000:00/0000:00:14.0/usb2/2-1"
Dec 03 02:06:15 charon mtp-probe[3212]: bus: 2, device: 3 was not an MTP device
Dec 03 02:06:46 charon kernel: sd 5:0:0:0: tag#28 uas_eh_abort_handler 0 uas-tag 1 inflight: IN 
Dec 03 02:06:46 charon kernel: sd 5:0:0:0: tag#28 CDB: Report supported operation codes a3 0c 01 12 00 00 00 00 02 00 00 00
Dec 03 02:06:46 charon kernel: scsi host5: uas_eh_device_reset_handler start
Dec 03 02:06:47 charon kernel: usb 2-1: reset SuperSpeed Gen 1 USB device number 3 using xhci_hcd
Dec 03 02:06:47 charon kernel: scsi host5: uas_eh_device_reset_handler success
Dec 03 02:07:17 charon kernel: scsi host5: uas_eh_device_reset_handler start
Dec 03 02:07:17 charon kernel: sd 5:0:0:0: tag#28 uas_zap_pending 0 uas-tag 1 inflight: 
Dec 03 02:07:17 charon kernel: sd 5:0:0:0: tag#28 CDB: Report supported operation codes a3 0c 01 12 00 00 00 00 02 00 00 00
Dec 03 02:07:17 charon kernel: usb 2-1: reset SuperSpeed Gen 1 USB device number 3 using xhci_hcd
Dec 03 02:07:17 charon kernel: scsi host5: uas_eh_device_reset_handler success

-----Original Message-----
From: Oliver Neukum [mailto:oneukum@suse.com] 
Sent: 02 December 2020 11:38
To: David C. Partridge; linux-usb@vger.kernel.org
Subject: Re: Issues with LaCie USB3 drive and UAS

Am Mittwoch, den 02.12.2020, 11:12 +0000 schrieb David C. Partridge:

Hi,


> A helpful person on the Ubuntu forums sent me a patched usb-storage.ko that was built using your patch file.

that is nice to hear, sorry but I am no good with Ubuntu stuff.
However, the problem is that you need uas.ko.

The log is showing a curious failure. Did you disconnect the device?

	Regards
		Oliver


