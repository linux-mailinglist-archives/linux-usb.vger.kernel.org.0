Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7B9CA1A0E00
	for <lists+linux-usb@lfdr.de>; Tue,  7 Apr 2020 14:55:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728555AbgDGMzZ convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Tue, 7 Apr 2020 08:55:25 -0400
Received: from mail.kernel.org ([198.145.29.99]:45032 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728304AbgDGMzZ (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 7 Apr 2020 08:55:25 -0400
From:   bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     linux-usb@vger.kernel.org
Subject: [Bug 207147] New: USB errors: uhci_hcd 0000:01:00.4: swiotlb buffer
 is full (sz: 8 bytes) ; iommu=off
Date:   Tue, 07 Apr 2020 12:55:24 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: John.p.donnelly@oracle.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression
Message-ID: <bug-207147-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=207147

            Bug ID: 207147
           Summary: USB errors: uhci_hcd 0000:01:00.4: swiotlb buffer is
                    full (sz: 8 bytes) ; iommu=off
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.6.0.rc6
          Hardware: All
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: John.p.donnelly@oracle.com
        Regression: No

Platform:

HP Gen9 and Gen10 servers. 

This USB device Bus 03 ( usb3 )  is associated with the HP iLO subsystem. 

When iommu=on the device and virtual keyboard and mouse works :

 lsusb -t
/:  Bus 05.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/6p, 5000M
/:  Bus 04.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/15p, 480M
    |__ Port 3: Dev 2, If 0, Class=Hub, Driver=hub/2p, 480M
/:  Bus 03.Port 1: Dev 1, Class=root_hub, Driver=uhci_hcd/2p, 12M
    |__ Port 1: Dev 2, If 0, Class=Human Interface Device, Driver=usbhid, 12M
    |__ Port 1: Dev 2, If 1, Class=Human Interface Device, Driver=usbhid, 12M
/:  Bus 02.Port 1: Dev 1, Class=root_hub, Driver=ehci-pci/2p, 480M
    |__ Port 1: Dev 2, If 0, Class=Hub, Driver=hub/8p, 480M
/:  Bus 01.Port 1: Dev 1, Class=root_hub, Driver=ehci-pci/2p, 480M
    |__ Port 1: Dev 2, If 0, Class=Hub, Driver=hub/6p, 480M


When iommu=off the keyboard and mouse are not enumerated:


 lsusb -t
/:  Bus 05.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/6p, 5000M
/:  Bus 04.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/15p, 480M
    |__ Port 3: Dev 2, If 0, Class=Hub, Driver=hub/2p, 480M
/:  Bus 03.Port 1: Dev 1, Class=root_hub, Driver=uhci_hcd/2p, 12M
/:  Bus 02.Port 1: Dev 1, Class=root_hub, Driver=ehci-pci/2p, 480M
/:  Bus 01.Port 1: Dev 1, Class=root_hub, Driver=ehci-pci/2p, 480M


Device info :

[    4.233918] pci 0000:01:00.4: [103c:3300] type 00 class 0x0c0300
[    4.235902] pci 0000:01:00.4: reg 0x20: [io  0x1300-0x131f]


[    8.172229] uhci_hcd 0000:01:00.4: UHCI Host Controller
[    8.185583] clocksource: tsc: mask: 0xffffffffffffffff max_cycles:
0x1e3c373503e, max_idle_ns: 440795250101 ns
[    8.198841] uhci_hcd 0000:01:00.4: new USB bus registered, assigned bus
number 3
[    8.228336] clocksource: Switched to clocksource tsc
[    8.228355] uhci_hcd 0000:01:00.4: detected 8 ports
[    8.255642] uhci_hcd 0000:01:00.4: port count misdetected? forcing to 2
ports
[    8.269807] uhci_hcd 0000:01:00.4: supports USB remote wakeup
[    8.269833] uhci_hcd 0000:01:00.4: irq 19, io base 0x00001300
[    8.284303] usb usb3: default language 0x0409
[    8.284319] usb usb3: udev 1, busnum 3, minor = 256
[    8.284322] usb usb3: New USB device found, idVendor=1d6b, idProduct=0001,
bcdDevice= 5.06
[    8.299961] usb usb3: New USB device strings: Mfr=3, Product=2,
SerialNumber=1
[    8.314767] usb usb3: Product: UHCI Host Controller
[    8.328498] usb usb3: Manufacturer: Linux 5.6.0-rc6+ uhci_hcd
[    8.342875] usb usb3: SerialNumber: 0000:01:00.4

[    8.853062] usb usb4-port3: status 0101, change 0000, 12 Mb/s
[    8.853847] usb 3-1: new full-speed USB device number 2 using uhci_hcd
[    8.869995] uhci_hcd 0000:01:00.4: swiotlb buffer is full (sz: 8 bytes),
total 0 (slots), used 0 (slots)
[    8.886593] uhci_hcd 0000:01:00.4: swiotlb buffer is full (sz: 8 bytes),
total 0 (slots), used 0 (slots)
[    8.903838] uhci_hcd 0000:01:00.4: swiotlb buffer is full (sz: 8 bytes),
total 0 (slots), used 0 (slots)
[    9.074128] ehci-pci 0000:00:1d.0: swiotlb buffer is full (sz: 8 bytes),
total 0 (slots), used 0 (slots)
[    9.090870] usb 1-1: device not accepting address 2, error -11
[    9.105875] hub 5-0:1.0: state 7 ports 6 chg 0000 evt 0000
[    9.105948] hub 5-0:1.0: hub_suspend
[    9.105957] usb usb5: bus auto-suspend, wakeup 1
[    9.142840] usb 3-1: device descriptor read/64, error -11



When iommu=on , the devices are enervated :



[    9.149664] uhci_hcd 0000:01:00.4: new USB bus registered, assigned bus
number 3
[    9.163434] uhci_hcd 0000:01:00.4: detected 8 ports
[    9.176561] uhci_hcd 0000:01:00.4: port count misdetected? forcing to 2
ports
[    9.190639] uhci_hcd 0000:01:00.4: supports USB remote wakeup
[    9.190655] uhci_hcd 0000:01:00.4: irq 19, io base 0x00001300
[    9.204506] uhci_hcd 0000:01:00.4: DMAR: Setting identity map [0x791dc000 -
0x791ddfff]
[    9.220241] uhci_hcd 0000:01:00.4: DMAR: Setting identity map [0x791cb000 -
0x791dbfff]
[    9.233903] uhci_hcd 0000:01:00.4: DMAR: Setting identity map [0x791de000 -
0x791f3fff]
[    9.247398] uhci_hcd 0000:01:00.4: DMAR: Setting identity map [0x791f4000 -
0x791f7fff]
[    9.260767] uhci_hcd 0000:01:00.4: DMAR: 32bit DMA uses non-identity mapping
[    9.274196] usb usb3: default language 0x0409
[    9.274211] usb usb3: udev 1, busnum 3, minor = 256
[    9.274214] usb usb3: New USB device found, idVendor=1d6b, idProduct=0001,
bcdDevice= 5.06
[    9.288716] usb usb3: New USB device strings: Mfr=3, Product=2,
SerialNumber=1
[    9.302288] usb usb3: Product: UHCI Host Controller
[    9.315276] usb usb3: Manufacturer: Linux 5.6.0-rc6+ uhci_hcd
[    9.329689] usb usb3: SerialNumber: 0000:01:00.4
[    9.342071] usb 1-1: new high-speed USB device number 2 using ehci-pci
[    9.356176] usb usb2-port1: status 0501 change 0001
[    9.356199] usb usb3: usb_probe_device
[    9.356201] usb usb3: configuration #1 chosen from 1 choice
[    9.356208] usb usb3: adding 3-0:1.0 (config #1, interface 0)



[   10.512162] usbhid 3-1:1.0: usb_probe_interface
[   10.512164] usbhid 3-1:1.0: usb_probe_interface - got id
[   10.513820] input: BMC Virtual Keyboard  as
/devices/pci0000:00/0000:00:1c.2/0000:01:00.4/usb3/3-1/3-1:1.0/0003:03F0:7029.0001/input/input1
[   10.595493] hid-generic 0003:03F0:7029.0001: input,hidraw0: USB HID v1.01
Keyboard [BMC Virtual Keyboard ] on usb-0000:01:00.4-1/input0
[   10.627314] usbhid 3-1:1.1: usb_probe_interface
[   10.627315] usbhid 3-1:1.1: usb_probe_interface - got id
[   10.629630] input: BMC Virtual Keyboard  as
/devices/pci0000:00/0000:00:1c.2/0000:01:00.4/usb3/3-1/3-1:1.1/0003:03F0:7029.0002/input/input2
[   10.662296] hid-generic 0003:03F0:7029.0002: input,hidraw1: USB HID v1.01
Mouse [BMC Virtual Keyboard ] on usb-0000:01:00.4-1/input1
[   10.696057] usbcore: registered new interface driver usbhid



( Complete dmesg will be attached )

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
