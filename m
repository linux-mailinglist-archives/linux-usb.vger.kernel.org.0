Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 10E0A3DFDE7
	for <lists+linux-usb@lfdr.de>; Wed,  4 Aug 2021 11:23:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237004AbhHDJXU (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 4 Aug 2021 05:23:20 -0400
Received: from mail.kernel.org ([198.145.29.99]:59990 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236381AbhHDJXT (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 4 Aug 2021 05:23:19 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 5B6F660F10
        for <linux-usb@vger.kernel.org>; Wed,  4 Aug 2021 09:23:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1628068986;
        bh=gUUKZmyGEaAXQb/bC+AsrjcwDJ3tCf/XxyuhDAPOwI4=;
        h=From:To:Subject:Date:From;
        b=fk/a+P3w8cqvSvGdAbbpsPpQeT1uFwCcUCQspYl0VHBd5NzOwHhBErxxrWNMXm2Hr
         eNB7gXYx+vO+WnsJO0a6pHjWkM7ZKosfrS3yfjtCa8sUtOfOuqBwSvJSWB+ku5O/3v
         SP1IP658uCzl360NeZCJPi91/h6b40MFjaieLk3NqFusV0agypsmLHrZZpVse3gS6s
         YsHtp2Ok1o3XTlSKi8I7F2F5gJs0Rls9p6DCFm8G3QB0n4RuiRgBOwRyN2uIXYCII0
         SEmFJMGDR2tGpTVP/BNgzcpOSf6U8U0+r6GePSVfqvdvHzfzCGBM7qfabI3eooNPKa
         In3a56c0EVFGg==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id 47929603BE; Wed,  4 Aug 2021 09:23:06 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 213967] New: Thinkpad T14 Chicony Webcam not recognized by
 kernel
Date:   Wed, 04 Aug 2021 09:23:06 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: dev@horatiuion.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression
Message-ID: <bug-213967-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D213967

            Bug ID: 213967
           Summary: Thinkpad T14 Chicony Webcam not recognized by kernel
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.13.6
          Hardware: All
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: dev@horatiuion.com
        Regression: No

Distro: Arch Linux


Timeline:

- after upgrading from 5.12.15 to 5.13.4, my webcam wasn't being recognized=
 by
the kernel (nothing showing up in the kernel logs regarding uvcvideo and
nothing showing up in lsusb)
- a temporary fix (as determined by the distro community) was to install the
firmware from this repository
(https://github.com/denisandroid/uPD72020x-Firmware) while waiting for the
official fix
- the potential fix was issued (commit
44cf53602f5a0db80d53c8fff6cdbcae59650a42) and merged in 5.13.6
- after upgrading to 5.13.6 my webcam stopped working yet again. Suspecting
that I no longer needed the uPD72020x-Firmware, I uninstalled it, with no
success. My webcam is still not being recognized


Right now I'm running 5.13.5 with uPD72020x-Firmware installed, which is the
only working solution for now.


Kernel logs:
```
kernel: usb 2-2: new high-speed USB device number 2 using xhci_hcd
kernel: usb 2-2: New USB device found, idVendor=3D04f2, idProduct=3Db6d0,
bcdDevice=3D58.18
kernel: usb 2-2: New USB device strings: Mfr=3D3, Product=3D1, SerialNumber=
=3D2
kernel: usb 2-2: Product: Integrated Camera
kernel: usb 2-2: Manufacturer: Chicony Electronics Co.,Ltd.
kernel: usb 2-2: SerialNumber: 0001
kernel: usb 2-2: Found UVC 1.10 device Integrated Camera (04f2:b6d0)
kernel: input: Integrated Camera: Integrated C as
/devices/pci0000:00/0000:00:02.7/0000:06:00.0/usb2/2-2/2-2:1.0/input/input30
kernel: usbcore: registered new interface driver btusb
kernel: usb 2-2: Found UVC 1.50 device Integrated Camera (04f2:b6d0)
kernel: input: Integrated Camera: Integrated I as
/devices/pci0000:00/0000:00:02.7/0000:06:00.0/usb2/2-2/2-2:1.2/input/input31
kernel: usbcore: registered new interface driver uvcvideo
```

lsusb:
```
Bus 007 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
Bus 006 Device 003: ID 8087:0029 Intel Corp. AX200 Bluetooth
Bus 006 Device 002: ID 06cb:00bd Synaptics, Inc. Prometheus MIS Touch
Fingerprint Reader
Bus 006 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
Bus 005 Device 004: ID 05e3:0749 Genesys Logic, Inc. SD Card Reader and Wri=
ter
Bus 005 Device 005: ID 2109:0812 VIA Labs, Inc. VL812 Hub
Bus 005 Device 006: ID 0bda:8153 Realtek Semiconductor Corp. RTL8153 Gigabit
Ethernet Adapter
Bus 005 Device 003: ID 0bda:0411 Realtek Semiconductor Corp. Hub
Bus 005 Device 002: ID 2109:0817 VIA Labs, Inc. USB3.0 Hub=20=20=20=20=20=
=20=20=20=20=20=20=20=20
Bus 005 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
Bus 004 Device 003: ID 058f:9540 Alcor Micro Corp. AU9540 Smartcard Reader
Bus 004 Device 007: ID 046d:c52b Logitech, Inc. Unifying Receiver
Bus 004 Device 008: ID 24f0:0140 Metadot Das Keyboard 4
Bus 004 Device 006: ID 2109:2812 VIA Labs, Inc. VL812 Hub
Bus 004 Device 005: ID 0bda:5411 Realtek Semiconductor Corp. RTS5411 Hub
Bus 004 Device 004: ID 2109:0102 VIA Labs, Inc. USB 2.0 BILLBOARD=20=20=20=
=20=20=20=20=20=20=20=20=20=20
Bus 004 Device 002: ID 2109:2817 VIA Labs, Inc. USB2.0 Hub=20=20=20=20=20=
=20=20=20=20=20=20=20=20
Bus 004 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
Bus 003 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
Bus 002 Device 002: ID 04f2:b6d0 Chicony Electronics Co., Ltd Integrated Ca=
mera
Bus 002 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
Bus 001 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
```

I have tried grepping the kernel logs for the pci bridge in the working and
non-working versions

Working:
```
kernel: pci 0000:00:02.7: [1022:1634] type 01 class 0x060400
kernel: pci 0000:00:02.7: PME# supported from D0 D3hot D3cold
kernel: pci 0000:00:02.7: PCI bridge to [bus 06]
kernel: pci 0000:00:02.7:   bridge window [mem 0xfd400000-0xfd4fffff]
kernel: pci 0000:00:02.7: PCI bridge to [bus 06]
kernel: pci 0000:00:02.7:   bridge window [mem 0xfd400000-0xfd4fffff]
kernel: pci 0000:00:02.7: Adding to iommu group 7
kernel: pcieport 0000:00:02.7: PME: Signaling with IRQ 31
kernel: input: Integrated Camera: Integrated C as
/devices/pci0000:00/0000:00:02.7/0000:06:00.0/usb2/2-2/2-2:1.0/input/input30
kernel: input: Integrated Camera: Integrated I as
/devices/pci0000:00/0000:00:02.7/0000:06:00.0/usb2/2-2/2-2:1.2/input/input31
```

Not working:
```
kernel: pci 0000:00:02.7: [1022:1634] type 01 class 0x060400
kernel: pci 0000:00:02.7: PME# supported from D0 D3hot D3cold
kernel: pci 0000:00:02.7: PCI bridge to [bus 06]
kernel: pci 0000:00:02.7:   bridge window [mem 0xfd400000-0xfd4fffff]
kernel: pci 0000:00:02.7: PCI bridge to [bus 06]
kernel: pci 0000:00:02.7:   bridge window [mem 0xfd400000-0xfd4fffff]
kernel: pci 0000:00:02.7: Adding to iommu group 7
kernel: pcieport 0000:00:02.7: PME: Signaling with IRQ 31
```

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
