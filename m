Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AA6692D0E78
	for <lists+linux-usb@lfdr.de>; Mon,  7 Dec 2020 11:54:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726110AbgLGKyM convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Mon, 7 Dec 2020 05:54:12 -0500
Received: from avasout02.plus.net ([212.159.14.17]:54641 "EHLO
        avasout02.plus.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725842AbgLGKyL (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 7 Dec 2020 05:54:11 -0500
Received: from APOLLO ([212.159.61.44])
        by smtp with ESMTPA
        id mE8xkEgBl0K1OmE8ykuirc; Mon, 07 Dec 2020 10:53:24 +0000
X-Clacks-Overhead: "GNU Terry Pratchett"
X-CM-Score: 0.00
X-CNFS-Analysis: v=2.3 cv=QaP9QvTv c=1 sm=1 tr=0
 a=AGp1duJPimIJhwGXxSk9fg==:117 a=AGp1duJPimIJhwGXxSk9fg==:17
 a=IkcTkHD0fZMA:10 a=YtiR03RJH2t6E5nAUL8A:9 a=QEXdDO2ut3YA:10
X-AUTH: perdrix52@:2500
From:   "David C. Partridge" <david.partridge@perdrix.co.uk>
To:     "'Oliver Neukum'" <oneukum@suse.com>, <linux-usb@vger.kernel.org>
References: <004f01d6b5bd$d4f08ff0$7ed1afd0$@perdrix.co.uk>                                              <eceedea7ca5d950eb8ea4d186a6b01a04d0a804f.camel@suse.com>                                               <001601d6b67d$e97a1e30$bc6e5a90$@perdrix.co.uk>                                         <aebf92944c1ecb256d21108ce092165a0fd904db.camel@suse.com>                                       <001b01d6b68a$79937fa0$6cba7ee0$@perdrix.co.uk>                                         <007901d6b6ab$f0f66230$d2e32690$@perdrix.co.uk>                                 <43abe2af0352f17f93e2453a86e2ed47b9913b6a.camel@suse.com>                               <000f01d6c326$1eea3f50$5cbebdf0$@perdrix.co.uk>                         <d478123862a7e94898aaa771c21cc8cb0a3819fc.camel@suse.com>                         <008101d6c3d7$2427ee70$6c77cb50$@perdrix.co.uk>                 <11ea70180f52b4965a451b3970891e0f547c777b.camel@suse.com>                 <000001d6c89c$086812e0$193838a0$@perdrix.co.uk>         <612be9a9cd6ffd
                b9492781e174859c7b4e694a86.camel@suse.com>         <000301d6c919$af7a94e0$0e6fbea0$@perdrix.co.uk> <918e298941f820a7cc3310c95dc211cca7596dba.camel@suse.com> <000e01d6c980$d9a75f70$8cf61e50$@perdrix.co.uk>
In-Reply-To: <000e01d6c980$d9a75f70$8cf61e50$@perdrix.co.uk>
Subject: RE: Issues with LaCie USB3 drive and UAS
Date:   Mon, 7 Dec 2020 10:53:23 -0000
Message-ID: <005601d6cc87$2fa608f0$8ef21ad0$@perdrix.co.uk>
MIME-Version: 1.0
Content-Type: text/plain;
        charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Mailer: Microsoft Outlook 14.0
Content-Language: en-gb
Thread-Index: AQEj7PcoQVookx4f1d3/LPoLd4O7AAH2dKS3AXO3T8ACPDV8AQK5Jqf9AfTPe88CoAnckwML8I43Acv3vzcCAy63SAJfP5HDAb+vYkUBE57rhQHZtB/YAwjv7Y4DEjptYqpJe4rw
X-CMAE-Envelope: MS4wfOWnFd6spcUghtMJJQMnukAy6GbF/DBTN7kJ6+pKYtC7MHZ2vk+q+cvnurFV1CTpuR7x2wo6pUkcIjyQ925wmkwkl7mFJhFCmF0xpkssC2DoPVPDxHQT
 8l0TGtelVPo6V4VcsJlAWQcPcHtRzK0KakZXdtcrjWB/hGTc28rTN8SLxUinmqLgqYpnU8iZBM4d3w==
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Using options usb-storage quirks=059f:105f:ks

Dec 07 10:40:40 charon kernel: usb 2-1: new SuperSpeed Gen 1 USB device number 2 using xhci_hcd
Dec 07 10:40:40 charon kernel: usb 2-1: New USB device found, idVendor=059f, idProduct=105f, bcdDevice= 0.01
Dec 07 10:40:40 charon kernel: usb 2-1: New USB device strings: Mfr=2, Product=3, SerialNumber=1
Dec 07 10:40:40 charon kernel: usb 2-1: Product: 2Big Quadra USB3
Dec 07 10:40:40 charon kernel: usb 2-1: Manufacturer: LaCie
Dec 07 10:40:40 charon kernel: usb 2-1: SerialNumber: 00000000250e9e711084
Dec 07 10:40:40 charon mtp-probe[2790]: checking bus 2, device 2: "/sys/devices/pci0000:00/0000:00:14.0/usb2/2-1"
Dec 07 10:40:40 charon mtp-probe[2790]: bus: 2, device: 2 was not an MTP device
Dec 07 10:40:40 charon kernel: usb_storage: loading out-of-tree module taints kernel.
Dec 07 10:40:40 charon kernel: usb_storage: module verification failed: signature and/or required key missing - tainting kernel
Dec 07 10:40:40 charon kernel: usbcore: registered new interface driver usb-storage
Dec 07 10:40:40 charon kernel: scsi host5: uas
Dec 07 10:40:40 charon kernel: usbcore: registered new interface driver uas
Dec 07 10:40:40 charon kernel: scsi 5:0:0:0: Direct-Access     LaCie    2Big Quadra v3   051E PQ: 0 ANSI: 6
Dec 07 10:40:40 charon kernel: sd 5:0:0:0: Attached scsi generic sg3 type 0
Dec 07 10:40:40 charon mtp-probe[2799]: checking bus 2, device 2: "/sys/devices/pci0000:00/0000:00:14.0/usb2/2-1"
Dec 07 10:40:40 charon mtp-probe[2799]: bus: 2, device: 2 was not an MTP device
Dec 07 10:40:40 charon kernel: sd 5:0:0:0: [sdc] 7814025564 512-byte logical blocks: (4.00 TB/3.64 TiB)
Dec 07 10:40:40 charon kernel: sd 5:0:0:0: [sdc] Write Protect is off
Dec 07 10:40:40 charon kernel: sd 5:0:0:0: [sdc] Mode Sense: 43 00 00 00
Dec 07 10:40:40 charon kernel: sd 5:0:0:0: [sdc] Write cache: enabled, read cache: enabled, doesn't support DPO or FUA
Dec 07 10:40:57 charon kernel: usb 2-1: USB disconnect, device number 2
Dec 07 10:40:57 charon kernel: sd 5:0:0:0: [sdc] Optimal transfer size 33553920 bytes
Dec 07 10:40:57 charon kernel: sd 5:0:0:0: [sdc] Read Capacity(16) failed: Result: hostbyte=DID_ERROR driverbyte=DRIVER_OK
Dec 07 10:40:57 charon kernel: sd 5:0:0:0: [sdc] Sense not available.
Dec 07 10:40:58 charon kernel: sd 5:0:0:0: [sdc] Read Capacity(10) failed: Result: hostbyte=DID_ERROR driverbyte=DRIVER_OK
Dec 07 10:40:58 charon kernel: sd 5:0:0:0: [sdc] Sense not available.
Dec 07 10:40:58 charon kernel: sd 5:0:0:0: [sdc] 0 512-byte logical blocks: (0 B/0 B)
Dec 07 10:40:58 charon kernel: sd 5:0:0:0: [sdc] Attached SCSI disk
Dec 07 10:40:58 charon kernel: usb 2-1: new SuperSpeed Gen 1 USB device number 3 using xhci_hcd
Dec 07 10:40:58 charon kernel: usb 2-1: New USB device found, idVendor=059f, idProduct=105f, bcdDevice= 0.01
Dec 07 10:40:58 charon kernel: usb 2-1: New USB device strings: Mfr=2, Product=3, SerialNumber=1
Dec 07 10:40:58 charon kernel: usb 2-1: Product: 2Big Quadra USB3
Dec 07 10:40:58 charon kernel: usb 2-1: Manufacturer: LaCie
Dec 07 10:40:58 charon kernel: usb 2-1: SerialNumber: 00000000250e9e711084
Dec 07 10:40:58 charon kernel: scsi host5: uas
Dec 07 10:40:58 charon kernel: scsi 5:0:0:0: Direct-Access     LaCie    2Big Quadra v3   051E PQ: 0 ANSI: 6
Dec 07 10:40:58 charon kernel: scsi 5:0:0:0: Attached scsi generic sg3 type 0
Dec 07 10:40:58 charon kernel: sd 5:0:0:0: [sdc] 7814025564 512-byte logical blocks: (4.00 TB/3.64 TiB)
Dec 07 10:40:58 charon kernel: sd 5:0:0:0: [sdc] Write Protect is off
Dec 07 10:40:58 charon kernel: sd 5:0:0:0: [sdc] Mode Sense: 43 00 00 00
Dec 07 10:40:58 charon kernel: sd 5:0:0:0: [sdc] Write cache: enabled, read cache: enabled, doesn't support DPO or FUA
Dec 07 10:40:59 charon mtp-probe[2858]: checking bus 2, device 3: "/sys/devices/pci0000:00/0000:00:14.0/usb2/2-1"
Dec 07 10:40:59 charon mtp-probe[2858]: bus: 2, device: 3 was not an MTP device
Dec 07 10:40:59 charon mtp-probe[2861]: checking bus 2, device 3: "/sys/devices/pci0000:00/0000:00:14.0/usb2/2-1"
Dec 07 10:40:59 charon mtp-probe[2861]: bus: 2, device: 3 was not an MTP device
Dec 07 10:41:29 charon kernel: sd 5:0:0:0: tag#6 uas_eh_abort_handler 0 uas-tag 1 inflight: IN 
Dec 07 10:41:29 charon kernel: sd 5:0:0:0: tag#6 CDB: Report supported operation codes a3 0c 01 12 00 00 00 00 02 00 00 00
Dec 07 10:41:29 charon kernel: scsi host5: uas_eh_device_reset_handler start
Dec 07 10:41:29 charon kernel: usb 2-1: reset SuperSpeed Gen 1 USB device number 3 using xhci_hcd
Dec 07 10:41:29 charon kernel: scsi host5: uas_eh_device_reset_handler success

David


