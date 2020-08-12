Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E3022430E9
	for <lists+linux-usb@lfdr.de>; Thu, 13 Aug 2020 00:39:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726533AbgHLWjT convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Wed, 12 Aug 2020 18:39:19 -0400
Received: from mail.kernel.org ([198.145.29.99]:56076 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726456AbgHLWjT (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 12 Aug 2020 18:39:19 -0400
From:   bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     linux-usb@vger.kernel.org
Subject: [Bug 208891] Thunderbolt hotplug fails on HP x360 13t-aw000/86FA
 with HP Thunderbolt 3 Dock
Date:   Wed, 12 Aug 2020 22:39:18 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mattst88@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-208891-208809-kVFySLpCos@https.bugzilla.kernel.org/>
In-Reply-To: <bug-208891-208809@https.bugzilla.kernel.org/>
References: <bug-208891-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=208891

--- Comment #12 from Matt Turner (mattst88@gmail.com) ---
With some help from Ben Widawsky, we noticed that PCI device 2d:04.0 (Intel
Corporation DSL6540 Thunderbolt 3 Bridge [Alpine Ridge 4C 2015] [8086:1578])
doesn't get IO space allocated correctly on hotplug:

mattst88@hp-x360 ~ % head working 
2d:04.0 PCI bridge [0604]: Intel Corporation DSL6540 Thunderbolt 3 Bridge
[Alpine Ridge 4C 2015] [8086:1578] (prog-if 00 [Normal decode])
        Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-
Stepping- SERR- FastB2B- DisINTx+
        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort-
<MAbort- >SERR- <PERR- INTx-
        Latency: 0, Cache Line Size: 64 bytes
        Interrupt: pin A routed to IRQ 144
        Bus: primary=2d, secondary=32, subordinate=32, sec-latency=0
        I/O behind bridge: 00005000-00005fff [size=4K]
        Memory behind bridge: [disabled]
        Prefetchable memory behind bridge: [disabled]
        Secondary status: 66MHz- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort-
<MAbort- <SERR- <PERR-
mattst88@hp-x360 ~ % head broken    
2d:04.0 PCI bridge: Intel Corporation DSL6540 Thunderbolt 3 Bridge [Alpine
Ridge 4C 2015] (prog-if 00 [Normal decode])
        Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-
Stepping- SERR- FastB2B- DisINTx+
        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort-
<MAbort- >SERR- <PERR- INTx-
        Latency: 0
        Interrupt: pin A routed to IRQ 169
        Bus: primary=2d, secondary=32, subordinate=56, sec-latency=0
        I/O behind bridge: [disabled]
        Memory behind bridge: 68400000-741fffff [size=190M]
        Prefetchable memory behind bridge: 0000006000400000-000000601bffffff
[size=444M]
        Secondary status: 66MHz- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort-
<MAbort- <SERR- <PERR-


Additionally, when I do 'echo 1 > /sys/bus/pci/rescan' I see this in dmesg:

[Aug12 15:37] pcieport 0000:2d:04.0: bridge window [io  0x1000-0x0fff] to [bus
32-56] add_size 1000
[  +0.000006] pcieport 0000:2d:04.0: BAR 7: no space for [io  size 0x1000]
[  +0.000001] pcieport 0000:2d:04.0: BAR 7: failed to assign [io  size 0x1000]
[  +0.000001] pcieport 0000:2d:04.0: BAR 7: no space for [io  size 0x1000]
[  +0.000000] pcieport 0000:2d:04.0: BAR 7: failed to assign [io  size 0x1000]
[  +0.079302] pci_bus 0000:2e: Allocating resources
[  +0.000017] pci_bus 0000:2f: Allocating resources
[  +0.000016] pci_bus 0000:30: Allocating resources
[  +0.000009] pci_bus 0000:31: Allocating resources
[  +0.000085] pci_bus 0000:2e: Allocating resources
[  +0.000015] pci_bus 0000:2f: Allocating resources
[  +0.000015] pci_bus 0000:30: Allocating resources
[  +0.000010] pci_bus 0000:31: Allocating resources

which seems to corroborate that point.

And 2d:04 appears to be a critical device in the tree, according to lspci -t:

           +-07.1-[2c-56]----00.0-[2d-56]--+-00.0-[2e]----00.0  ASMedia
Technology Inc. ASM1042A USB 3.0 Host Controller [1b21:1142]
           |                               +-01.0-[2f]----00.0  Broadcom Inc.
and subsidiaries NetXtreme BCM57762 Gigabit Ethernet PCIe [14e4:1682]
           |                               +-02.0-[30]--
           |                               +-03.0-[31]--
           |                               \-04.0-[32-56]--

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
