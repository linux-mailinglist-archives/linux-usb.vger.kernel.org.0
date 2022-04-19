Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C27DB507205
	for <lists+linux-usb@lfdr.de>; Tue, 19 Apr 2022 17:41:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353966AbiDSPoZ convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Tue, 19 Apr 2022 11:44:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354090AbiDSPmw (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 19 Apr 2022 11:42:52 -0400
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BDF1C11A26
        for <linux-usb@vger.kernel.org>; Tue, 19 Apr 2022 08:40:07 -0700 (PDT)
Received: (Authenticated sender: hadess@hadess.net)
        by mail.gandi.net (Postfix) with ESMTPSA id C7CEDE0011
        for <linux-usb@vger.kernel.org>; Tue, 19 Apr 2022 15:40:02 +0000 (UTC)
Message-ID: <cc3fbe613f52f958f2ebe77cad806c18625a8663.camel@hadess.net>
Subject: Debugging problems with USB3 SATA dock
From:   Bastien Nocera <hadess@hadess.net>
To:     linux-usb@vger.kernel.org
Date:   Tue, 19 Apr 2022 17:40:02 +0200
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
User-Agent: Evolution 3.44.0 (3.44.0-1.fc36) 
MIME-Version: 1.0
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hey,

I ran into some problems with a non-UAS USB3 SATA dock I've had for
about a decade in that it simply refuses to work on my system's USB3
ports, constantly connecting and disconnecting.

I used some 5.17, and some current git trunk kernels. It refuses to
work in the USB 3.1 Gen 1 and USB 3.1 Gen 2 front ports on my system,
but works correctly when plugged in through a USB 2 port at the back of
my desktop.

Dock identifies as "04c5:201d".

The same dock/HDD combo also works correctly when plugged in to a
MacBook Air running macOS.

What info would I need to get to debug this issue?

Cheers

dmesg when plugged in the USB2 port (working):
Apr 19 17:26:18 classic kernel: usb 1-3: new high-speed USB device number 10 using xhci_hcd
Apr 19 17:26:18 classic kernel: usb 1-3: New USB device found, idVendor=04c5, idProduct=201d, bcdDevice= 0.01
Apr 19 17:26:18 classic kernel: usb 1-3: New USB device strings: Mfr=1, Product=2, SerialNumber=3
Apr 19 17:26:18 classic kernel: usb 1-3: Product: MB86C30A-REB
Apr 19 17:26:18 classic kernel: usb 1-3: Manufacturer: FUJITSU
Apr 19 17:26:18 classic kernel: usb 1-3: SerialNumber:         K62TT962G9AB
Apr 19 17:26:18 classic kernel: usb-storage 1-3:1.0: USB Mass Storage device detected
Apr 19 17:26:18 classic kernel: scsi host7: usb-storage 1-3:1.0
Apr 19 17:26:18 classic mtp-probe[43260]: checking bus 1, device 10: "/sys/devices/pci0000:00/0000:00:14.0/usb1/1-3"
Apr 19 17:26:18 classic mtp-probe[43260]: bus: 1, device: 10 was not an MTP device
Apr 19 17:26:18 classic mtp-probe[43263]: checking bus 1, device 10: "/sys/devices/pci0000:00/0000:00:14.0/usb1/1-3"
Apr 19 17:26:18 classic mtp-probe[43263]: bus: 1, device: 10 was not an MTP device
Apr 19 17:26:19 classic kernel: scsi 7:0:0:0: Direct-Access     FUJITSU  MHZ2160BH G2     008B PQ: 0 ANSI: 5
Apr 19 17:26:19 classic kernel: sd 7:0:0:0: Attached scsi generic sg1 type 0
Apr 19 17:26:19 classic kernel: sd 7:0:0:0: [sda] 312581808 512-byte logical blocks: (160 GB/149 GiB)
Apr 19 17:26:19 classic kernel: sd 7:0:0:0: [sda] Write Protect is off
Apr 19 17:26:19 classic kernel: sd 7:0:0:0: [sda] Mode Sense: 17 00 00 08
Apr 19 17:26:19 classic kernel: sd 7:0:0:0: [sda] No Caching mode page found
Apr 19 17:26:19 classic kernel: sd 7:0:0:0: [sda] Assuming drive cache: write through
Apr 19 17:26:19 classic kernel:  sda: sda1
Apr 19 17:26:19 classic kernel: sd 7:0:0:0: [sda] Attached SCSI disk
*filesystem gets mounted and stays available from here on out*


dmesg when plugged in the USB3 port (not working):
Apr 19 17:36:17 classic kernel: usb 2-4: new SuperSpeed USB device number 20 using xhci_hcd
Apr 19 17:36:17 classic kernel: usb 2-4: New USB device found, idVendor=04c5, idProduct=201d, bcdDevice= 0.01
Apr 19 17:36:17 classic kernel: usb 2-4: New USB device strings: Mfr=1, Product=2, SerialNumber=3
Apr 19 17:36:17 classic kernel: usb 2-4: Product: MB86C30A-REB
Apr 19 17:36:17 classic kernel: usb 2-4: Manufacturer: FUJITSU
Apr 19 17:36:17 classic kernel: usb 2-4: SerialNumber:         K62TT962G9AB
Apr 19 17:36:17 classic kernel: usb-storage 2-4:1.0: USB Mass Storage device detected
Apr 19 17:36:17 classic kernel: scsi host7: usb-storage 2-4:1.0
Apr 19 17:36:17 classic mtp-probe[44111]: checking bus 2, device 20: "/sys/devices/pci0000:00/0000:00:14.0/usb2/2-4"
Apr 19 17:36:17 classic mtp-probe[44111]: bus: 2, device: 20 was not an MTP device
Apr 19 17:36:17 classic mtp-probe[44114]: checking bus 2, device 20: "/sys/devices/pci0000:00/0000:00:14.0/usb2/2-4"
Apr 19 17:36:17 classic mtp-probe[44114]: bus: 2, device: 20 was not an MTP device
Apr 19 17:36:18 classic kernel: scsi 7:0:0:0: Direct-Access     FUJITSU  MHZ2160BH G2     008B PQ: 0 ANSI: 5
Apr 19 17:36:18 classic kernel: sd 7:0:0:0: Attached scsi generic sg1 type 0
Apr 19 17:36:18 classic kernel: sd 7:0:0:0: [sda] 312581808 512-byte logical blocks: (160 GB/149 GiB)
Apr 19 17:36:18 classic kernel: sd 7:0:0:0: [sda] Write Protect is off
Apr 19 17:36:18 classic kernel: sd 7:0:0:0: [sda] Mode Sense: 17 00 00 08
Apr 19 17:36:18 classic kernel: sd 7:0:0:0: [sda] No Caching mode page found
Apr 19 17:36:18 classic kernel: sd 7:0:0:0: [sda] Assuming drive cache: write through
Apr 19 17:36:19 classic kernel: usb 2-4: USB disconnect, device number 20
Apr 19 17:36:19 classic kernel: xhci_hcd 0000:00:14.0: WARN Set TR Deq Ptr cmd failed due to incorrect slot or ep state.
Apr 19 17:36:19 classic kernel: I/O error, dev sda, sector 0 op 0x0:(READ) flags 0x0 phys_seg 1 prio class 0
Apr 19 17:36:19 classic kernel: Buffer I/O error on dev sda, logical block 0, async page read
Apr 19 17:36:19 classic kernel: I/O error, dev sda, sector 0 op 0x0:(READ) flags 0x0 phys_seg 1 prio class 0
Apr 19 17:36:19 classic kernel: Buffer I/O error on dev sda, logical block 0, async page read
Apr 19 17:36:19 classic kernel: I/O error, dev sda, sector 0 op 0x0:(READ) flags 0x0 phys_seg 1 prio class 0
Apr 19 17:36:19 classic kernel: Buffer I/O error on dev sda, logical block 0, async page read
Apr 19 17:36:19 classic kernel: ldm_validate_partition_table(): Disk read failed.
Apr 19 17:36:19 classic kernel: I/O error, dev sda, sector 0 op 0x0:(READ) flags 0x0 phys_seg 1 prio class 0
Apr 19 17:36:19 classic kernel: Buffer I/O error on dev sda, logical block 0, async page read
Apr 19 17:36:19 classic kernel: I/O error, dev sda, sector 0 op 0x0:(READ) flags 0x0 phys_seg 1 prio class 0
Apr 19 17:36:19 classic kernel: Buffer I/O error on dev sda, logical block 0, async page read
Apr 19 17:36:19 classic kernel: I/O error, dev sda, sector 0 op 0x0:(READ) flags 0x0 phys_seg 1 prio class 0
Apr 19 17:36:19 classic kernel: Buffer I/O error on dev sda, logical block 0, async page read
Apr 19 17:36:19 classic kernel: I/O error, dev sda, sector 0 op 0x0:(READ) flags 0x0 phys_seg 1 prio class 0
Apr 19 17:36:19 classic kernel: Buffer I/O error on dev sda, logical block 0, async page read
Apr 19 17:36:19 classic kernel:  sda: unable to read partition table
Apr 19 17:36:19 classic kernel: sd 7:0:0:0: [sda] Read Capacity(10) failed: Result: hostbyte=DID_ERROR driverbyte=DRIVER_OK
Apr 19 17:36:19 classic kernel: sd 7:0:0:0: [sda] Sense not available.
Apr 19 17:36:19 classic kernel: sd 7:0:0:0: [sda] 0 512-byte logical blocks: (0 B/0 B)
Apr 19 17:36:19 classic kernel: sda: detected capacity change from 312581808 to 0
Apr 19 17:36:19 classic kernel: sd 7:0:0:0: [sda] Attached SCSI disk
Apr 19 17:36:19 classic systemd-udevd[44116]: sda: /usr/lib/udev/rules.d/60-block-scheduler.rules:6 Failed to write ATTR{/sys/devices/pci0000:00/0000:00:14.0/usb2/2-4/2-4:1.0/host7/target7:0:0/7:0:0:0/block/sda/queue/scheduler}, ignoring: No such file or directory
*device reconnects as at the start of this log, then disconnects, etc.*
