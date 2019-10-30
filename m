Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7001BE976E
	for <lists+linux-usb@lfdr.de>; Wed, 30 Oct 2019 08:56:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725953AbfJ3H4P (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 30 Oct 2019 03:56:15 -0400
Received: from trent.utfs.org ([94.185.90.103]:52322 "EHLO trent.utfs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725822AbfJ3H4P (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 30 Oct 2019 03:56:15 -0400
X-Greylist: delayed 377 seconds by postgrey-1.27 at vger.kernel.org; Wed, 30 Oct 2019 03:56:14 EDT
Received: from localhost (localhost [IPv6:::1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by trent.utfs.org (Postfix) with ESMTPS id 9C4CA60174;
        Wed, 30 Oct 2019 08:49:56 +0100 (CET)
Date:   Wed, 30 Oct 2019 00:49:56 -0700 (PDT)
From:   Christian Kujau <lists@nerdbynature.de>
To:     linux-usb@vger.kernel.org
cc:     Julian Sikorski <belegdol@gmail.com>
Subject: OWC Mercury Elite Pro Dual does not work with UAS
Message-ID: <alpine.DEB.2.21.99999.352.1910292356500.8115@trent.utfs.org>
User-Agent: Alpine 2.21.99999 (DEB 352 2019-06-22)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,

I have an external disk enclosure called "Mercury Elite Pro Dual" from OWC 
holding 2 disks that doesn't seem to work when connected via USB 3 to a 
Thinkpad E431 laptop, see below. Notice how the 2nd disk in the enclosure 
(sdd) gets "Attached" only later, but is then detached again.

I found a posting on linux-usb[0] from August 2019 and adding the ":u" 
quirk[1] (US_FL_IGNORE_UAS) worked in my case as well:

   options usb-storage quirks=1e91:a3a8:u

I have yet to test with a more current kernel (I'm on 4.19.80 now), but as 
I couldn't find the vendor (0x1e91) listed in 
drivers/usb/storage/unusual_devs.h, I wanted to report this to the list 
too.

Thanks for reading, and thanks Julian to mention the quirks option, that 
saved quite a bit of digging!

Christian.

=== Full dmesg: https://paste.debian.net/1111925/

 scsi host6: uas
 usbcore: registered new interface driver uas
 scsi 6:0:0:0: Direct-Access     ElitePro Dual U3FW-1      0207 PQ: 0 ANSI: 6
 scsi 6:0:0:1: Direct-Access     ElitePro Dual U3FW-2      0207 PQ: 0 ANSI: 6
 sd 6:0:0:0: [sdc] 7814037168 512-byte logical blocks: (4.00 TB/3.64 TiB)
 sd 6:0:0:1: [sdd] 7814037168 512-byte logical blocks: (4.00 TB/3.64 TiB)
 sd 6:0:0:0: [sdc] Write Protect is off
 sd 6:0:0:0: [sdc] Mode Sense: 67 00 10 08
 sd 6:0:0:1: [sdd] Write Protect is off
 sd 6:0:0:1: [sdd] Mode Sense: 67 00 10 08
 sd 6:0:0:0: [sdc] Write cache: enabled, read cache: enabled, supports DPO and FUA
 sd 6:0:0:1: [sdd] Write cache: enabled, read cache: enabled, supports DPO and FUA
 sd 6:0:0:0: [sdc] Optimal transfer size 33553920 bytes
 sd 6:0:0:0: [sdc] Attached SCSI disk
 [...]
 sd 6:0:0:1: tag#0 uas_eh_abort_handler 0 uas-tag 1 inflight: IN 
 sd 6:0:0:1: tag#0 CDB: opcode=0x12 12 01 00 00 40 00
 scsi host6: uas_eh_device_reset_handler start
 usb 4-3: reset SuperSpeed Gen 1 USB device number 2 using xhci_hcd
 usb 4-3: device firmware changed
 scsi host6: uas_eh_device_reset_handler FAILED err -19
 sd 6:0:0:1: Device offlined - not ready after error recovery
 sd 6:0:0:1: [sdd] Optimal transfer size 33553920 bytes
 usb 4-3: USB disconnect, device number 2
 sd 6:0:0:1: [sdd] Attached SCSI disk
 sd 6:0:0:0: [sdc] Synchronizing SCSI cache
 sd 6:0:0:0: [sdc] Synchronize Cache(10) failed: Result: hostbyte=0x07 driverbyte=0x00
 sd 6:0:0:1: [sdd] Synchronizing SCSI cache
 sd 6:0:0:1: [sdd] Synchronize Cache(10) failed: Result: hostbyte=0x07 driverbyte=0x00


[0] Lacie Rugged USB3-FW does not work with UAS
    https://lore.kernel.org/linux-usb/1566567572.8347.54.camel@suse.com/T/ 
[1] SDB:USB 3.0 Hard Drive troubleshooting
    https://en.opensuse.org/SDB:USB_3.0_Hard_Drive_troubleshooting
-- 
BOFH excuse #70:

nesting roaches shorted out the ether cable
