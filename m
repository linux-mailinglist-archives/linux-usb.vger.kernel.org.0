Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2C61C3F7DA4
	for <lists+linux-usb@lfdr.de>; Wed, 25 Aug 2021 23:23:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232326AbhHYVXw (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 25 Aug 2021 17:23:52 -0400
Received: from mail.kernel.org ([198.145.29.99]:60806 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232049AbhHYVXv (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 25 Aug 2021 17:23:51 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id C405660F6F
        for <linux-usb@vger.kernel.org>; Wed, 25 Aug 2021 21:23:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1629926585;
        bh=C1HV5ro6GAox4Ga3q5sKC1+njI0+Qht/2BWsBSPpdLA=;
        h=From:To:Subject:Date:From;
        b=XM/5w+Kj70ayNegVUZIT4osMn03FJZwvwHVXq9XwQ78n4THqlKnVVQf9e7o6+rCTx
         Ojl13GNI+ltvwxbZYmeSBu6VSOIynO6/pDy+v+NHOXC2+1h+CXKo062bTryLQOy7Ja
         0ayJtNcrMhQwLoH3giaFYG3XtVssBkne07rwCyOv7NlUZaLKJ+7UYTj2WatqiIj9j6
         Mm45vpx4QXmGURZTKhE4wcZpjOCOFsDLN4FKLD4aDnxqyBTcifhp1c5wZhrOBP2924
         b+k1rLYDOxyrBKuXoKgSUTJdFeqQpOFWRG2Io5Z9M4v6QSYF5fg8e5qC4ptq2/Fpil
         yHyWq3ssuyfpw==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id B4D1A61001; Wed, 25 Aug 2021 21:23:05 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 214173] New: Built-in Renesas uPD720202 fails to initialize on
 Thinkpad T14 AMD
Date:   Wed, 25 Aug 2021 21:23:05 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: milan.plzik@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression
Message-ID: <bug-214173-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D214173

            Bug ID: 214173
           Summary: Built-in Renesas uPD720202 fails to initialize on
                    Thinkpad T14 AMD
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.13.12
          Hardware: x86-64
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: high
          Priority: P1
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: milan.plzik@gmail.com
        Regression: No

After doing a series of upgrades on a dual-boot Thinkpad T14 AMD (comprised=
 of
Windows driver/firmware upgrade and linux kernel upgrade), the Renesas USB =
3.0
doesn't seem to get initialized anymore, timing out on initialization.

```
# journalctl -xb |grep -i 06:00
Aug 24 17:05:47 archlinux kernel: pci 0000:06:00.0: [1912:0015] type 00 cla=
ss
0x0c0330
Aug 24 17:05:47 archlinux kernel: pci 0000:06:00.0: reg 0x10: [mem
0xfd400000-0xfd401fff 64bit]
Aug 24 17:05:47 archlinux kernel: pci 0000:06:00.0: PME# supported from D0
D3hot
Aug 24 17:05:47 archlinux kernel: pci 0000:06:00.0: xHCI HW not ready after=
 5
sec (HC bug?) status =3D 0x1801
Aug 24 17:05:47 archlinux kernel: pci 0000:06:00.0:
quirk_usb_early_handoff+0x0/0x740 took 4882933 usecs
Aug 24 17:05:47 archlinux kernel: pci 0000:06:00.0: Adding to iommu group 16
Aug 24 17:05:47 archlinux kernel: xhci_hcd 0000:06:00.0: xHCI Host Controll=
er
Aug 24 17:05:47 archlinux kernel: xhci_hcd 0000:06:00.0: new USB bus
registered, assigned bus number 2
Aug 24 17:05:47 archlinux kernel: xhci_hcd 0000:06:00.0: Zeroing 64bit base
registers, expecting fault
Aug 24 17:05:57 archlinux kernel: xhci_hcd 0000:06:00.0: can't setup: -110
Aug 24 17:05:57 archlinux kernel: xhci_hcd 0000:06:00.0: USB bus 2 deregist=
ered
Aug 24 17:05:57 archlinux kernel: xhci_hcd 0000:06:00.0: init 0000:06:00.0
fail, -110
Aug 24 17:05:57 archlinux kernel: xhci_hcd: probe of 0000:06:00.0 failed wi=
th
error -110
```

This is a notable regression to the previous laptop's state where this got
correctly initialized:

```
# journalctl -xb -10 |grep 06:00
Jun 26 11:06:21 archlinux kernel: pci 0000:06:00.0: [1912:0015] type 00 cla=
ss
0x0c0330
Jun 26 11:06:21 archlinux kernel: pci 0000:06:00.0: reg 0x10: [mem
0xfd400000-0xfd401fff 64bit]
Jun 26 11:06:21 archlinux kernel: pci 0000:06:00.0: PME# supported from D0
D3hot D3cold
Jun 26 11:06:21 archlinux kernel: pci 0000:06:00.0: Adding to iommu group 16
Jun 26 11:06:21 archlinux kernel: xhci_hcd 0000:06:00.0: xHCI Host Controll=
er
Jun 26 11:06:21 archlinux kernel: xhci_hcd 0000:06:00.0: new USB bus
registered, assigned bus number 2
Jun 26 11:06:21 archlinux kernel: xhci_hcd 0000:06:00.0: Zeroing 64bit base
registers, expecting fault
Jun 26 11:06:21 archlinux kernel: xhci_hcd 0000:06:00.0: hcc params 0x01405=
1cf
hci version 0x100 quirks 0x0000001100000090
Jun 26 11:06:21 archlinux kernel: usb usb2: SerialNumber: 0000:06:00.0
Jun 26 11:06:21 archlinux kernel: xhci_hcd 0000:06:00.0: xHCI Host Controll=
er
Jun 26 11:06:21 archlinux kernel: xhci_hcd 0000:06:00.0: new USB bus
registered, assigned bus number 3
Jun 26 11:06:21 archlinux kernel: xhci_hcd 0000:06:00.0: Host supports USB =
3.0
SuperSpeed
Jun 26 11:06:21 archlinux kernel: usb usb3: SerialNumber: 0000:06:00.0
```

Most notably, this renders the laptop's built-in webcam unusable (not showi=
ng
on the USB bus). There's anecdotal evidence that installing a package
containing older firmware resolves this issue (i.e.
https://forums.lenovo.com/t5/Other-Linux-Discussions/No-camera-on-thinkpad-=
P14s-AMD/m-p/5090434),
but since a lot of data indicates that the firmware is actually located in =
ROM
(and maybe RAM). Since this is a dual-boot system, I'm being a bit cautious
with not using an older version if Windows might expect a newer version
already.

I'll be happy to do some testing if needed, assuming there's no chance of
accidentally bricking the laptop.

Additional info:

Hardware: Thinpad T14 AMD Gen 1


```
$ lspci -vv
...
06:00.0 USB controller: Renesas Technology Corp. uPD720202 USB 3.0 Host
Controller (rev 02) (prog-if 30 [XHCI])
        Flags: fast devsel, IRQ 34, IOMMU group 16
        Memory at fd400000 (64-bit, non-prefetchable) [size=3D8K]
        Capabilities: [50] Power Management version 3
        Capabilities: [70] MSI: Enable- Count=3D1/8 Maskable- 64bit+
        Capabilities: [90] MSI-X: Enable- Count=3D8 Masked-
        Capabilities: [a0] Express Endpoint, MSI 00
        Capabilities: [100] Advanced Error Reporting
        Capabilities: [150] Latency Tolerance Reporting
        Kernel modules: xhci_pci
...
```

```
$ uname -a
Linux thinkpad 5.13.12-arch1-1 #1 SMP PREEMPT Wed, 18 Aug 2021 20:49:03 +00=
00
x86_64 GNU/Linux
```

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
