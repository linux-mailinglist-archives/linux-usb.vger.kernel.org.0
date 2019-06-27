Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3FE4C58AD4
	for <lists+linux-usb@lfdr.de>; Thu, 27 Jun 2019 21:15:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726587AbfF0TPw (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 27 Jun 2019 15:15:52 -0400
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:33741 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726426AbfF0TPw (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 27 Jun 2019 15:15:52 -0400
Received: from [IPv6:2001:980:42b2:1:864c:11e8:201d:7c52] ([IPv6:2001:980:42b2:1:864c:11e8:201d:7c52])
        by smtp-cloud8.xs4all.net with ESMTPSA
        id gZs2hJGlE7KeZgZs3hqXKo; Thu, 27 Jun 2019 21:15:49 +0200
To:     linux-usb@vger.kernel.org
Reply-To: bjdouma@xs4all.nl
From:   Bauke Jan Douma <bjdouma@xs4all.nl>
Organization: a training zoo
Subject: HDD's attached via USB3 ports not automatically seen by kernel
Message-ID: <0a7055a3-1664-0099-09cf-c4c0fdbd205d@xs4all.nl>
Date:   Thu, 27 Jun 2019 21:15:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfE/bRC2Tf7H2yxPfG7PN2bVzNW3zOtszwmZC1OZzN98Gwj6bGeMw58D1BaGcklxc3KOl+2Bp1ONNv3RhSnLf3Jpm6iAoBr0vFmOsGw6w+1+LxHVOycYu
 /3xmZWlpevxEHKfpvHWgiSaJmyGhnZtp5SzINkogc+hx+HgjS1G4xyJzQHYRMgR0yScuEO2Vgy+U205GDt83XYVoWYxVYQeUkS3ZGbwVZJudib7+oAAw1XwZ
 bS78xAgLnaN78pKT4KBxRQCUB6Ntc78rmW/2EeY6nXQ=
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Kernel: Linux 4.15.0-52-generic #56~16.04.1-Ubuntu SMP Thu Jun 6 12:03:31 UTC 2019 x86_64 x86_64 x86_64 GNU/Linux


I have two additional ('DeLock') USB docks in my pc. One with two USB3 ports+2USB2 ports, the other with two USB3 ports.  I have several external HDD's, some that I hook up through an external SATA adapter through USB, some (e.g. Western Digital My 
Passport) that seem to directly hook up to USB.

The two docks are seen as follows (nothing externally attached) by lsusb:

Bus 004 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
Bus 003 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
Bus 002 Device 002: ID 174c:3074 ASMedia Technology Inc. ASM1074 SuperSpeed hub    <---
Bus 002 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
Bus 001 Device 003: ID abcd:5555 Unknown
Bus 001 Device 002: ID 174c:2074 ASMedia Technology Inc. ASM1074 High-Speed hub    <---
Bus 001 Device 006: ID 0b05:18a3 ASUSTek Computer, Inc.
Bus 001 Device 005: ID 05e3:0610 Genesys Logic, Inc. 4-port hub
Bus 001 Device 004: ID 046d:c537 Logitech, Inc.
Bus 001 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub

I suppose the 174c:2074 is the USB2 ports and the 174c:3074 is the USB3 ports on the two docks.
Now when I hook up let's say an external WD My Passport 4TB drive, the kernel does emit /no messages/ at all in /var/log/kern.log. The drive is 'not seen' at all by the kernel.

I found out that the drive /is reconized', when /as root/, I run 'lsusb -v -d 174c:2074' or 'lsusb -v -d 174c:3074'.
After this, kernel output is:

Jun 24 15:10:12 skyscraper kernel: [12351.798828] usb 2-2.1: new SuperSpeed USB device number 12 using xhci_hcd
Jun 24 15:10:12 skyscraper kernel: [12351.819758] usb 2-2.1: New USB device found, idVendor=1058, idProduct=25e2
Jun 24 15:10:12 skyscraper kernel: [12351.819764] usb 2-2.1: New USB device strings: Mfr=2, Product=3, SerialNumber=1
Jun 24 15:10:12 skyscraper kernel: [12351.819768] usb 2-2.1: Product: My Passport 25E2
Jun 24 15:10:12 skyscraper kernel: [12351.819772] usb 2-2.1: Manufacturer: Western Digital
Jun 24 15:10:12 skyscraper kernel: [12351.819775] usb 2-2.1: SerialNumber: 575831314438375237413535
Jun 24 15:10:12 skyscraper kernel: [12351.844428] usb-storage 2-2.1:1.0: USB Mass Storage device detected
Jun 24 15:10:12 skyscraper kernel: [12351.844896] scsi host6: usb-storage 2-2.1:1.0
Jun 24 15:10:13 skyscraper kernel: [12352.875529] scsi 6:0:0:0: Direct-Access     WD       My Passport 25E2 4004 PQ: 0 ANSI: 6
Jun 24 15:10:13 skyscraper kernel: [12352.875979] scsi 6:0:0:1: Enclosure         WD       SES Device       4004 PQ: 0 ANSI: 6
Jun 24 15:10:13 skyscraper kernel: [12352.877672] sd 6:0:0:0: Attached scsi generic sg4 type 0
Jun 24 15:10:13 skyscraper kernel: [12352.877984] ses 6:0:0:1: Attached Enclosure device
Jun 24 15:10:13 skyscraper kernel: [12352.878003] sd 6:0:0:0: [sdd] Very big device. Trying to use READ CAPACITY(16).
Jun 24 15:10:13 skyscraper kernel: [12352.878146] sd 6:0:0:0: [sdd] 7813969920 512-byte logical blocks: (4.00 TB/3.64 TiB)
Jun 24 15:10:13 skyscraper kernel: [12352.878150] sd 6:0:0:0: [sdd] 4096-byte physical blocks
Jun 24 15:10:13 skyscraper kernel: [12352.878257] ses 6:0:0:1: Attached scsi generic sg5 type 13
Jun 24 15:10:13 skyscraper kernel: [12352.878360] sd 6:0:0:0: [sdd] Write Protect is off
Jun 24 15:10:13 skyscraper kernel: [12352.878365] sd 6:0:0:0: [sdd] Mode Sense: 47 00 10 08
Jun 24 15:10:13 skyscraper kernel: [12352.878482] ses 6:0:0:1: Wrong diagnostic page; asked for 1 got 8
Jun 24 15:10:13 skyscraper kernel: [12352.878491] ses 6:0:0:1: Failed to get diagnostic page 0x1
Jun 24 15:10:13 skyscraper kernel: [12352.878497] ses 6:0:0:1: Failed to bind enclosure -19
Jun 24 15:10:13 skyscraper kernel: [12352.878681] sd 6:0:0:0: [sdd] No Caching mode page found
Jun 24 15:10:13 skyscraper kernel: [12352.878689] sd 6:0:0:0: [sdd] Assuming drive cache: write through
Jun 24 15:10:13 skyscraper kernel: [12352.879314] sd 6:0:0:0: [sdd] Very big device. Trying to use READ CAPACITY(16).
Jun 24 15:10:13 skyscraper kernel: [12353.068512]  sdd: sdd1
Jun 24 15:10:13 skyscraper kernel: [12353.069456] sd 6:0:0:0: [sdd] Very big device. Trying to use READ CAPACITY(16).
Jun 24 15:10:13 skyscraper kernel: [12353.070066] sd 6:0:0:0: [sdd] Attached SCSI disk

and lsusb reports:
Bus 004 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
Bus 003 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
Bus 002 Device 002: ID 174c:3074 ASMedia Technology Inc. ASM1074 SuperSpeed hub
Bus 002 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
Bus 001 Device 003: ID abcd:5555 Unknown
Bus 001 Device 002: ID 174c:2074 ASMedia Technology Inc. ASM1074 High-Speed hub
Bus 001 Device 006: ID 0b05:18a3 ASUSTek Computer, Inc.
Bus 001 Device 005: ID 05e3:0610 Genesys Logic, Inc. 4-port hub
Bus 001 Device 004: ID 046d:c537 Logitech, Inc.
Bus 001 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub

For the external drive with SATA adapter with USB cable, the following is reported upon running
'lsusb -v -d 174c:2074' or 'lsusb -v -d 174c:3074' as root:

Jun 24 15:13:15 skyscraper kernel: [12535.113834] usb 2-2.1: new SuperSpeed USB device number 13 using xhci_hcd
Jun 24 15:13:15 skyscraper kernel: [12535.134627] usb 2-2.1: New USB device found, idVendor=174c, idProduct=55aa
Jun 24 15:13:15 skyscraper kernel: [12535.134632] usb 2-2.1: New USB device strings: Mfr=2, Product=3, SerialNumber=1
Jun 24 15:13:15 skyscraper kernel: [12535.134637] usb 2-2.1: Product: ASMT1153e
Jun 24 15:13:15 skyscraper kernel: [12535.134640] usb 2-2.1: Manufacturer: asmedia
Jun 24 15:13:15 skyscraper kernel: [12535.134644] usb 2-2.1: SerialNumber: 1234567892F2
Jun 24 15:13:15 skyscraper kernel: [12535.159184] usb-storage 2-2.1:1.0: USB Mass Storage device detected
Jun 24 15:13:15 skyscraper kernel: [12535.159360] usb-storage 2-2.1:1.0: Quirks match for vid 174c pid 55aa: 400000
Jun 24 15:13:15 skyscraper kernel: [12535.159433] scsi host6: usb-storage 2-2.1:1.0
Jun 24 15:13:16 skyscraper kernel: [12536.200851] scsi 6:0:0:0: Direct-Access     WDC WD40 EFRX-68N32N0     0    PQ: 0 ANSI: 6
Jun 24 15:13:16 skyscraper kernel: [12536.201613] sd 6:0:0:0: Attached scsi generic sg4 type 0
Jun 24 15:13:16 skyscraper kernel: [12536.201889] sd 6:0:0:0: [sdd] 7814037168 512-byte logical blocks: (4.00 TB/3.64 TiB)
Jun 24 15:13:16 skyscraper kernel: [12536.201895] sd 6:0:0:0: [sdd] 4096-byte physical blocks
Jun 24 15:13:16 skyscraper kernel: [12536.202285] sd 6:0:0:0: [sdd] Write Protect is off
Jun 24 15:13:16 skyscraper kernel: [12536.202291] sd 6:0:0:0: [sdd] Mode Sense: 43 00 00 00
Jun 24 15:13:16 skyscraper kernel: [12536.202570] sd 6:0:0:0: [sdd] Write cache: enabled, read cache: enabled, doesn't support DPO or FUA
Jun 24 15:13:16 skyscraper kernel: [12536.383027]  sdd: sdd1
Jun 24 15:13:16 skyscraper kernel: [12536.384195] sd 6:0:0:0: [sdd] Attached SCSI disk

with lsusb:
Bus 004 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
Bus 003 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
Bus 002 Device 013: ID 174c:55aa ASMedia Technology Inc. ASM1051E SATA 6Gb/s bridge, ASM1053E SATA 6Gb/s bridge, ASM1153 SATA 3Gb/s bridge
Bus 002 Device 002: ID 174c:3074 ASMedia Technology Inc. ASM1074 SuperSpeed hub
Bus 002 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
Bus 001 Device 003: ID abcd:5555 Unknown
Bus 001 Device 002: ID 174c:2074 ASMedia Technology Inc. ASM1074 High-Speed hub
Bus 001 Device 006: ID 0b05:18a3 ASUSTek Computer, Inc.
Bus 001 Device 005: ID 05e3:0610 Genesys Logic, Inc. 4-port hub
Bus 001 Device 004: ID 046d:c537 Logitech, Inc.
Bus 001 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub

I am not an expert here, but did try a suggestion to add lines:
options usb-storage quirks=174c:2074:u
options usb-storage quirks=174c:3074:u
options usb-storage quirks=174c:55aa:u

to /etc/modprobe.d/blacklist_uas.conf (each line individually, and also all the lines together) and run
sudo update-initramfs -u; sudo reboot, but all this did not change the behaviour. The above described behavious is with none of those lines in /etc/modprobe.d/blacklist_uas.conf.


So the bizarre thing is: I have to run , as root (regular user does NOT work) 'lsusb -v -d 174c:2074' or 'lsusb -v -d 174c:3074' to 'trigger' recognition as it were, to make the external drive be seen by the kernel. After that, it can be mounted of course, 
etc.

