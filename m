Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 21E0B2581DF
	for <lists+linux-usb@lfdr.de>; Mon, 31 Aug 2020 21:37:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729455AbgHaTha convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Mon, 31 Aug 2020 15:37:30 -0400
Received: from mail.kernel.org ([198.145.29.99]:53128 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726764AbgHaTha (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 31 Aug 2020 15:37:30 -0400
From:   bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     linux-usb@vger.kernel.org
Subject: [Bug 208891] Thunderbolt hotplug fails on HP x360 13t-aw000/86FA
 with HP Thunderbolt 3 Dock
Date:   Mon, 31 Aug 2020 19:37:29 +0000
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
Message-ID: <bug-208891-208809-bb5XkGr6Rs@https.bugzilla.kernel.org/>
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

--- Comment #36 from Matt Turner (mattst88@gmail.com) ---
Dang, doesn't work, but it the lspci output looks like we're getting the right
memory addresses (diffing against the attached lspci -vv success output).

--- lspci       2020-08-31 12:16:11.919502424 -0700
+++ lspci-patched-success       2020-08-27 12:47:04.525430133 -0700
@@ -1025,13 +1025,14 @@

 2e:00.0 USB controller [0c03]: ASMedia Technology Inc. ASM1042A USB 3.0 Host
Controller [1b21:1142] (prog-if 30 [XHCI])
        Subsystem: ASMedia Technology Inc. ASM1042A USB 3.0 Host Controller
[1b21:1142]
-       Control: I/O- Mem+ BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr-
Stepping- SERR- FastB2B- DisINTx-
+       Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-
Stepping- SERR- FastB2B- DisINTx+
        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort-
<MAbort- >SERR- <PERR- INTx-
+       Latency: 0, Cache Line Size: 64 bytes
        Interrupt: pin A routed to IRQ 16
-       Region 0: Memory at 68000000 (64-bit, non-prefetchable) [virtual]
[size=32K]
+       Region 0: Memory at 68000000 (64-bit, non-prefetchable) [size=32K]
        Capabilities: [50] MSI: Enable- Count=1/8 Maskable- 64bit+
                Address: 0000000000000000  Data: 0000
-       Capabilities: [68] MSI-X: Enable- Count=8 Masked-
+       Capabilities: [68] MSI-X: Enable+ Count=8 Masked-
                Vector table: BAR=0 offset=00002000
                PBA: BAR=0 offset=00002080
        Capabilities: [78] Power Management version 3
@@ -1071,14 +1072,16 @@
                        Arb:    Fixed- WRR32- WRR64- WRR128- TWRR128- WRR256-
                        Ctrl:   Enable+ ID=0 ArbSelect=Fixed TC/VC=ff
                        Status: NegoPending- InProgress-
+       Kernel driver in use: xhci_hcd

 2f:00.0 Ethernet controller [0200]: Broadcom Inc. and subsidiaries NetXtreme
BCM57762 Gigabit Ethernet PCIe [14e4:1682] (rev 01)
        Subsystem: Broadcom Inc. and subsidiaries NetXtreme BCM57762 Gigabit
Ethernet PCIe [14e4:1682]
-       Control: I/O- Mem+ BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr-
Stepping- SERR- FastB2B- DisINTx-
+       Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-
Stepping- SERR- FastB2B- DisINTx+
        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort-
<MAbort- >SERR- <PERR- INTx-
+       Latency: 0
        Interrupt: pin A routed to IRQ 17
-       Region 0: Memory at 6000100000 (64-bit, prefetchable) [virtual]
[size=64K]
-       Region 2: Memory at 6000110000 (64-bit, prefetchable) [virtual]
[size=64K]
+       Region 0: Memory at 6000100000 (64-bit, prefetchable) [size=64K]
+       Region 2: Memory at 6000110000 (64-bit, prefetchable) [size=64K]
        Capabilities: [48] Power Management version 3
                Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA
PME(D0+,D1-,D2-,D3hot+,D3cold+)
                Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=1 PME-


And the diff against the lspci -vv hotplug failure attachment:

--- lspci       2020-08-31 12:16:11.919502424 -0700
+++ lspci-patched-failure       2020-08-27 12:54:22.300504263 -0700
@@ -654,9 +654,9 @@
        Latency: 0
        Interrupt: pin A routed to IRQ 167
        Bus: primary=2d, secondary=2e, subordinate=2e, sec-latency=0
-       I/O behind bridge: 00005000-00005fff [size=4K]
-       Memory behind bridge: 68000000-680fffff [size=1M]
-       Prefetchable memory behind bridge: 0000006000000000-00000060000fffff
[size=1M]
+       I/O behind bridge: 00000000-00000fff [size=4K]
+       Memory behind bridge: 00000000-000fffff [size=1M]
+       Prefetchable memory behind bridge: 0000000000000000-00000000000fffff
[size=1M]
        Secondary status: 66MHz- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort-
<MAbort- <SERR- <PERR-
        BridgeCtl: Parity- SERR+ NoISA- VGA- VGA16- MAbort- >Reset- FastB2B-
                PriDiscTmr- SecDiscTmr- DiscTmrStat- DiscTmrSERREn-


So the memory addresses look right, but we're missing "[virtual]". Hopefully
that indicates only a small remaining problem :)

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
