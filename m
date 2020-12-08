Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A8522D2F1A
	for <lists+linux-usb@lfdr.de>; Tue,  8 Dec 2020 17:08:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730281AbgLHQHi convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Tue, 8 Dec 2020 11:07:38 -0500
Received: from avasout01.plus.net ([84.93.230.227]:35452 "EHLO
        avasout01.plus.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730247AbgLHQHh (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 8 Dec 2020 11:07:37 -0500
Received: from APOLLO ([212.159.61.44])
        by smtp with ESMTPA
        id mfVpkyoMHn8O7mfVqkcNNC; Tue, 08 Dec 2020 16:06:50 +0000
X-Clacks-Overhead: "GNU Terry Pratchett"
X-CM-Score: 0.00
X-CNFS-Analysis: v=2.3 cv=Ld6nFgXi c=1 sm=1 tr=0
 a=AGp1duJPimIJhwGXxSk9fg==:117 a=AGp1duJPimIJhwGXxSk9fg==:17
 a=IkcTkHD0fZMA:10 a=ylTo23Gykdq9n7kNIIgA:9 a=QEXdDO2ut3YA:10
X-AUTH: perdrix52@:2500
From:   "David C. Partridge" <david.partridge@perdrix.co.uk>
To:     "'Oliver Neukum'" <oneukum@suse.com>, <linux-usb@vger.kernel.org>
References: <004f01d6b5bd$d4f08ff0$7ed1afd0$@perdrix.co.uk>                                                   <eceedea7ca5d950eb8ea4d186a6b01a04d0a804f.camel@suse.com>                                                <001601d6b67d$e97a1e30$bc6e5a90$@perdrix.co.uk>                                           <aebf92944c1ecb256d21108ce092165a0fd904db.camel@suse.com>                                             <001b01d6b68a$79937fa0$6cba7ee0$@perdrix.co.uk>                                           <007901d6b6ab$f0f66230$d2e32690$@perdrix.co.uk>                                         <43abe2af0352f17f93e2453a86e2ed47b9913b6a.camel@suse.com>                                     <000f01d6c326$1eea3f50$5cbebdf0$@perdrix.co.uk>                           <d478123862a7e94898aaa771c21cc8cb0a3819fc.camel@suse.com>                               <008101d6c3d7$2427ee70$6c77cb50$@perdrix.co.uk>                         <11ea70180f52b4965a451b3970891e0f547c777b.camel@suse.com>                       <000001d6c89c$086812e0$193838a0$@perdrix.co.uk>                 < 6
        12be9a9cd6ffd b9492781e174859c7b4e694a86.camel@suse.com>                 <000301d6c919$af7a94e0$0e6fbea0$@perdrix.co.uk>         <918e298941f820a7cc3310c95dc211cca7596dba.camel@suse.com>       <000e01d6c980$d9a75f70$8cf61e50$@perdrix.co.uk>         <005601d6cc87$2fa608f0$8ef21ad0$@perdrix.co.uk> <36ac7a79c4b24f9f68b3543d18a51ec9af0a4933.camel@suse.com>
In-Reply-To: <36ac7a79c4b24f9f68b3543d18a51ec9af0a4933.camel@suse.com>
Subject: RE: Issues with LaCie USB3 drive and UAS
Date:   Tue, 8 Dec 2020 16:06:49 -0000
Message-ID: <000701d6cd7c$236ec8b0$6a4c5a10$@perdrix.co.uk>
MIME-Version: 1.0
Content-Type: text/plain;
        charset="utf-8"
Content-Transfer-Encoding: 8BIT
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQEj7PcoQVookx4f1d3/LPoLd4O7AAH2dKS3AXO3T8ACPDV8AQK5Jqf9AfTPe88CoAnckwML8I43Acv3vzcCAy63SAJfP5HDAb+vYkUBoOXfxAHZtB/YAwjv7Y4DEjptYgIeJf4hAY/YFQeqKXw0sA==
X-CMAE-Envelope: MS4wfJAtctP38PCh/6tjOjMas2SnGgdN25pIUxMQI0vcatZagj2sJHKG5El6mkTEmOeP2vxv3VmfoXAvS58AxOb6W6rVhApUQaQ+qGR5HOe7NJygB+2NTtrQ
 gYKqArABK0BdcB3+iZrw4ZFgmL7b6KUqQgzgkQy0/i0ii9bTMlLGPk0PK91sLrO7jpKjUqhMyIWtHg==
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

>> 2-1: USB disconnect, device number 2

>Again, did you plug the cable or did the device spontaneously disconnect?

That was a spontaneous disconnect.

> In this case, could you retry with
> usb-storage quirks=059f:105f:kf

Sure! The results are in general a lot more promising (apart from the first line) - plus I was able to read/write files without problems:

Dec 08 15:47:48 charon kernel: usb usb2-port6: config error
Dec 08 15:47:49 charon kernel: usb 1-6: new high-speed USB device number 4 using xhci_hcd
Dec 08 15:47:49 charon kernel: usb 1-6: New USB device found, idVendor=059f, idProduct=105f, bcdDevice= 0.01
Dec 08 15:47:49 charon kernel: usb 1-6: New USB device strings: Mfr=2, Product=3, SerialNumber=1
Dec 08 15:47:49 charon kernel: usb 1-6: Product: 2Big Quadra USB3
Dec 08 15:47:49 charon kernel: usb 1-6: Manufacturer: LaCie
Dec 08 15:47:49 charon kernel: usb 1-6: SerialNumber: 00000000250e9e711084
Dec 08 15:47:49 charon mtp-probe[5230]: checking bus 1, device 4: "/sys/devices/pci0000:00/0000:00:14.0/usb1/1-6"
Dec 08 15:47:49 charon mtp-probe[5230]: bus: 1, device: 4 was not an MTP device
Dec 08 15:47:49 charon kernel: usb_storage: loading out-of-tree module taints kernel.
Dec 08 15:47:49 charon kernel: usb_storage: module verification failed: signature and/or required key missing - tainting kernel
Dec 08 15:47:49 charon kernel: usbcore: registered new interface driver usb-storage
Dec 08 15:47:49 charon kernel: scsi host5: uas
Dec 08 15:47:49 charon kernel: usbcore: registered new interface driver uas
Dec 08 15:47:49 charon kernel: scsi 5:0:0:0: Direct-Access     LaCie    2Big Quadra v3   051E PQ: 0 ANSI: 6
Dec 08 15:47:49 charon mtp-probe[5239]: checking bus 1, device 4: "/sys/devices/pci0000:00/0000:00:14.0/usb1/1-6"
Dec 08 15:47:49 charon mtp-probe[5239]: bus: 1, device: 4 was not an MTP device
Dec 08 15:47:49 charon kernel: sd 5:0:0:0: Attached scsi generic sg3 type 0
Dec 08 15:47:49 charon kernel: sd 5:0:0:0: [sdc] 7814025564 512-byte logical blocks: (4.00 TB/3.64 TiB)
Dec 08 15:47:49 charon kernel: sd 5:0:0:0: [sdc] Write Protect is off
Dec 08 15:47:49 charon kernel: sd 5:0:0:0: [sdc] Mode Sense: 43 00 00 00
Dec 08 15:47:49 charon kernel: sd 5:0:0:0: [sdc] Write cache: enabled, read cache: enabled, doesn't support DPO or FUA
Dec 08 15:47:49 charon kernel: sd 5:0:0:0: [sdc] Optimal transfer size 33553920 bytes
Dec 08 15:47:49 charon kernel:  sdc: sdc1 sdc2
Dec 08 15:47:49 charon kernel: sd 5:0:0:0: [sdc] Attached SCSI disk
Dec 08 15:47:55 charon polkitd(authority=local)[760]: Operator of unix-session:7 successfully authenticated as unix-user:amonra to gain ONE-SHOT authorization for action org.freedesktop.udisks2.filesystem-mount-other-seat for system-bus-name::1.135 [/usr/libexec/gvfs-udisks2-volume-monitor] (owned by unix-user:amonra)
Dec 08 15:47:55 charon kernel: exfat: module is from the staging directory, the quality is unknown, you have been warned.
Dec 08 15:47:55 charon kernel: exFAT: Version 1.3.0
Dec 08 15:47:55 charon kernel: [EXFAT] trying to mount...
Dec 08 15:47:55 charon kernel: [EXFAT] mounted successfully
Dec 08 15:47:55 charon systemd[1]: Created slice system-clean\x2dmount\x2dpoint.slice.
Dec 08 15:47:55 charon systemd[1]: Finished Clean the /media/amonra/4TB mount point.

