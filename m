Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AEF591C2022
	for <lists+linux-usb@lfdr.de>; Fri,  1 May 2020 23:55:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726799AbgEAVzf convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Fri, 1 May 2020 17:55:35 -0400
Received: from mail.kernel.org ([198.145.29.99]:54010 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726045AbgEAVzf (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 1 May 2020 17:55:35 -0400
From:   bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     linux-usb@vger.kernel.org
Subject: [Bug 207219] [BISECTED] Sony Vaio laptop built-in ricoh webcam no
 longer found on Fedora 31 with 5.4.11 kernel
Date:   Fri, 01 May 2020 21:55:33 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: williambader@hotmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-207219-208809-0BnCLpzuXB@https.bugzilla.kernel.org/>
In-Reply-To: <bug-207219-208809@https.bugzilla.kernel.org/>
References: <bug-207219-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=207219

--- Comment #19 from William Bader (williambader@hotmail.com) ---
Created attachment 288867
  --> https://bugzilla.kernel.org/attachment.cgi?id=288867&action=edit
usbmon log

I put the commands in a script to make the procedure faster and more
reproducible without a mouse to cut and paste.
I have the shell log of the script and the dmesg output below.
I attached the usbmon log.

+ echo 'Test webcam by loading ehci-pci after booting'
Test webcam by loading ehci-pci after booting
+ rel=5.6.6.localversion14
+ date='date +%Y%m%d-%H%M%S'
+ mod=/lib/modules/5.6.6.localversion14/kernel/drivers/usb/host/ehci-pci.ko
+ uname -r
5.6.6.localversion14
++ uname -r
+ '[' 5.6.6.localversion14 '!=' 5.6.6.localversion14 ']'
+ ls -l '/dev/vid*'
ls: cannot access '/dev/vid*': No such file or directory
+ lsusb
Bus 002 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
Bus 001 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
+ '[' '!' -f
/lib/modules/5.6.6.localversion14/kernel/drivers/usb/host/ehci-pci.ko- ']'
+ '[' -f /lib/modules/5.6.6.localversion14/kernel/drivers/usb/host/ehci-pci.ko
']'
+ cp -pv /lib/modules/5.6.6.localversion14/kernel/drivers/usb/host/ehci-pci.ko-
/lib/modules/5.6.6.localversion14/kernel/drivers/usb/host/ehci-pci.ko
'/lib/modules/5.6.6.localversion14/kernel/drivers/usb/host/ehci-pci.ko-' ->
'/lib/modules/5.6.6.localversion14/kernel/drivers/usb/host/ehci-pci.ko'
+ sleep 1
+ lsusb
Bus 002 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
Bus 001 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
+ sleep 1
+ dmesg
+ tail
[   29.325653] wlp2s0: associated
[   29.325778] ath: EEPROM regdomain: 0x826c
[   29.325779] ath: EEPROM indicates we should expect a country code
[   29.325780] ath: doing EEPROM country->regdmn map search
[   29.325781] ath: country maps to regdmn code: 0x37
[   29.325782] ath: Country alpha2 being used: PT
[   29.325782] ath: Regpair used: 0x37
[   29.325784] ath: regdomain 0x826c dynamically updated by country element
[   29.357848] IPv6: ADDRCONF(NETDEV_CHANGE): wlp2s0: link becomes ready
[   29.417277] wlp2s0: Limiting TX power to 20 (20 - 0) dBm as advertised by
ac:61:75:cc:bd:58
+ dmesg -C
+ pid=2205
+ cat /sys/kernel/debug/usb/usbmon/0u
+ '[' -z 2205 ']'
+ sleep 1
++ date +%Y%m%d-%H%M%S
+ insmod /lib/modules/5.6.6.localversion14/kernel/drivers/usb/host/ehci-pci.ko
+ sleep 10
+ dmesg
++ date +%Y%m%d-%H%M%S
+ kill 2205

I should have added this to the end of the script:
$ lsusb
Bus 004 Device 003: ID 093a:2510 Pixart Imaging, Inc. Optical Mouse
Bus 004 Device 002: ID 8087:0024 Intel Corp. Integrated Rate Matching Hub
Bus 004 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
Bus 002 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
Bus 001 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
Bus 003 Device 004: ID 05ca:18c0 Ricoh Co., Ltd 
Bus 003 Device 005: ID 0489:e036 Foxconn / Hon Hai 
Bus 003 Device 002: ID 8087:0024 Intel Corp. Integrated Rate Matching Hub
Bus 003 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
$ ls -l /dev/vid*
ls: cannot access '/dev/vid*': No such file or directory

dmesg log:

[  144.769704] ehci-pci: EHCI PCI platform driver
[  144.770153] ehci-pci 0000:00:1a.0: EHCI Host Controller
[  144.770385] ehci-pci 0000:00:1a.0: new USB bus registered, assigned bus
number 3
[  144.770415] ehci-pci 0000:00:1a.0: debug port 2
[  144.774351] ehci-pci 0000:00:1a.0: cache line size of 64 is not supported
[  144.774360] ehci-pci 0000:00:1a.0: irq 16, io mem 0xf7d08000
[  144.781318] ehci-pci 0000:00:1a.0: USB 2.0 started, EHCI 1.00
[  144.781435] usb usb3: New USB device found, idVendor=1d6b, idProduct=0002,
bcdDevice= 5.06
[  144.781437] usb usb3: New USB device strings: Mfr=3, Product=2,
SerialNumber=1
[  144.781439] usb usb3: Product: EHCI Host Controller
[  144.781440] usb usb3: Manufacturer: Linux 5.6.6.localversion14 ehci_hcd
[  144.781440] usb usb3: SerialNumber: 0000:00:1a.0
[  144.781628] hub 3-0:1.0: USB hub found
[  144.781635] hub 3-0:1.0: 2 ports detected
[  144.781886] ehci-pci 0000:00:1d.0: EHCI Host Controller
[  144.781927] ehci-pci 0000:00:1d.0: new USB bus registered, assigned bus
number 4
[  144.781938] ehci-pci 0000:00:1d.0: debug port 2
[  144.785861] ehci-pci 0000:00:1d.0: cache line size of 64 is not supported
[  144.785892] ehci-pci 0000:00:1d.0: irq 23, io mem 0xf7d07000
[  144.792254] ehci-pci 0000:00:1d.0: USB 2.0 started, EHCI 1.00
[  144.792333] usb usb4: New USB device found, idVendor=1d6b, idProduct=0002,
bcdDevice= 5.06
[  144.792335] usb usb4: New USB device strings: Mfr=3, Product=2,
SerialNumber=1
[  144.792337] usb usb4: Product: EHCI Host Controller
[  144.792338] usb usb4: Manufacturer: Linux 5.6.6.localversion14 ehci_hcd
[  144.792340] usb usb4: SerialNumber: 0000:00:1d.0
[  144.792558] hub 4-0:1.0: USB hub found
[  144.792572] hub 4-0:1.0: 2 ports detected
[  145.106318] usb 3-1: new high-speed USB device number 2 using ehci-pci
[  145.114281] usb 4-1: new high-speed USB device number 2 using ehci-pci
[  145.121056] usb 3-1: New USB device found, idVendor=8087, idProduct=0024,
bcdDevice= 0.00
[  145.121063] usb 3-1: New USB device strings: Mfr=0, Product=0,
SerialNumber=0
[  145.121681] hub 3-1:1.0: USB hub found
[  145.121802] hub 3-1:1.0: 6 ports detected
[  145.129798] usb 4-1: New USB device found, idVendor=8087, idProduct=0024,
bcdDevice= 0.00
[  145.129804] usb 4-1: New USB device strings: Mfr=0, Product=0,
SerialNumber=0
[  145.130315] hub 4-1:1.0: USB hub found
[  145.130439] hub 4-1:1.0: 6 ports detected
[  145.392316] usb 3-1.2: new full-speed USB device number 3 using ehci-pci
[  145.400313] usb 4-1.2: new low-speed USB device number 3 using ehci-pci
[  145.472947] usb 3-1.2: New USB device found, idVendor=0489, idProduct=e036,
bcdDevice= 0.01
[  145.472955] usb 3-1.2: New USB device strings: Mfr=1, Product=2,
SerialNumber=3
[  145.472959] usb 3-1.2: Product: Bluetooth USB Host Controller
[  145.472962] usb 3-1.2: Manufacturer: Atheros Communications
[  145.472966] usb 3-1.2: SerialNumber: Alaska Day 2006
[  145.483172] usb 4-1.2: New USB device found, idVendor=093a, idProduct=2510,
bcdDevice= 1.00
[  145.483178] usb 4-1.2: New USB device strings: Mfr=1, Product=2,
SerialNumber=0
[  145.483182] usb 4-1.2: Product: USB OPTICAL MOUSE
[  145.483186] usb 4-1.2: Manufacturer: PIXART
[  145.487523] input: PIXART USB OPTICAL MOUSE as
/devices/pci0000:00/0000:00:1d.0/usb4/4-1/4-1.2/4-1.2:1.0/0003:093A:2510.0001/input/input13
[  145.487824] hid-generic 0003:093A:2510.0001: input,hidraw0: USB HID v1.11
Mouse [PIXART USB OPTICAL MOUSE] on usb-0000:00:1d.0-1.2/input0
[  145.538206] usb 3-1.3: new high-speed USB device number 4 using ehci-pci
[  145.539293] Bluetooth: Core ver 2.22
[  145.539311] NET: Registered protocol family 31
[  145.539312] Bluetooth: HCI device and connection manager initialized
[  145.539317] Bluetooth: HCI socket layer initialized
[  145.539319] Bluetooth: L2CAP socket layer initialized
[  145.539323] Bluetooth: SCO socket layer initialized
[  145.547061] usbcore: registered new interface driver btusb
[  145.556685] usb 3-1.3: config 247 has too many interfaces: 120, using
maximum allowed: 32
[  145.556688] usb 3-1.3: config 247 descriptor has 1 excess byte, ignoring
[  145.556690] usb 3-1.3: config 247 has 0 interfaces, different from the
descriptor's value: 120
[  145.557672] usb 3-1.3: New USB device found, idVendor=05ca, idProduct=18c0,
bcdDevice= 7.32
[  145.557675] usb 3-1.3: New USB device strings: Mfr=1, Product=2,
SerialNumber=0
[  145.557676] usb 3-1.3: Product: USB2.0 Camera
[  145.557678] usb 3-1.3: Manufacturer: Ricoh Company Ltd.
[  145.557903] usb 3-1.3: can't set config #247, error -32
[  145.594790] usbcore: registered new interface driver ath3k
[  145.799929] usb 3-1.2: USB disconnect, device number 3
[  145.972344] usb 3-1.2: new full-speed USB device number 5 using ehci-pci
[  151.252988] usb 3-1.2: New USB device found, idVendor=0489, idProduct=e036,
bcdDevice= 0.02
[  151.252996] usb 3-1.2: New USB device strings: Mfr=1, Product=2,
SerialNumber=3
[  151.253000] usb 3-1.2: Product: Bluetooth USB Host Controller
[  151.253003] usb 3-1.2: Manufacturer: Atheros Communications
[  151.253007] usb 3-1.2: SerialNumber: Alaska Day 2006

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
