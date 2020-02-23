Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D2D61169A79
	for <lists+linux-usb@lfdr.de>; Sun, 23 Feb 2020 23:32:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726678AbgBWWck convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Sun, 23 Feb 2020 17:32:40 -0500
Received: from mail.kernel.org ([198.145.29.99]:37696 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726302AbgBWWck (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sun, 23 Feb 2020 17:32:40 -0500
From:   bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     linux-usb@vger.kernel.org
Subject: [Bug 206649] Lenovo C940 - USB3 disk not detected if connected after
 boot - no space for [mem size 0x00010000]
Date:   Sun, 23 Feb 2020 22:32:39 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: email-ext@laposte.net
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: short_desc
Message-ID: <bug-206649-208809-IO0eX4818h@https.bugzilla.kernel.org/>
In-Reply-To: <bug-206649-208809@https.bugzilla.kernel.org/>
References: <bug-206649-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=206649

A (email-ext@laposte.net) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
            Summary|Lenovo C940 - USB3 disk not |Lenovo C940 - USB3 disk not
                   |detected if connected after |detected if connected after
                   |boot                        |boot - no space for [mem
                   |                            |size 0x00010000]

--- Comment #2 from A (email-ext@laposte.net) ---
Here are some complementary dmesg log when plugin back the disk to thunderbolt
port on dock. From the log the following errors occured:

   97.075649] usb 12-1: USB disconnect, device number 2
[   97.076371] sd 1:0:0:0: [sda] Synchronizing SCSI cache
[   97.092456] pcieport 0000:02:04.0: pciehp: Slot(0-2): Link Down
[   97.092460] pcieport 0000:02:04.0: pciehp: Slot(0-2): Card not present
[   97.092466] xhci_hcd 0000:07:00.0: PME# disabled
[   97.092483] xhci_hcd 0000:07:00.0: remove, state 1
[   97.092490] usb usb12: USB disconnect, device number 1
[   97.187858] xhci_hcd 0000:07:00.0: xHCI host controller not responding,
assume dead
[   97.281395] sd 1:0:0:0: [sda] Synchronize Cache(10) failed: Result:
hostbyte=DID_ERROR driverbyte=DRIVER_OK
[   97.354815] xhci_hcd 0000:07:00.0: WARN Can't disable streams for endpoint
0x81, streams are being disabled already
[   97.355682] xhci_hcd 0000:07:00.0: USB bus 12 deregistered
[   97.355695] xhci_hcd 0000:07:00.0: remove, state 4
[   97.355700] usb usb11: USB disconnect, device number 1
[   97.355933] xhci_hcd 0000:07:00.0: Host halt failed, -19
[   97.355937] xhci_hcd 0000:07:00.0: Host not accessible, reset failed.
[   97.356817] xhci_hcd 0000:07:00.0: USB bus 11 deregistered
[   97.357314] pci 0000:07:00.0: Removing from iommu group 3
[   97.357379] pcieport 0000:02:04.0: saving config space at offset 0x0
(reading 0x15d38086)
[   97.357384] pcieport 0000:02:04.0: saving config space at offset 0x4
(reading 0x100407)
[   97.357388] pcieport 0000:02:04.0: saving config space at offset 0x8
(reading 0x6040002)
[   97.357392] pcieport 0000:02:04.0: saving config space at offset 0xc
(reading 0x10010)
[   97.357396] pcieport 0000:02:04.0: saving config space at offset 0x10
(reading 0x0)
[   97.357400] pcieport 0000:02:04.0: saving config space at offset 0x14
(reading 0x0)
[   97.357405] pcieport 0000:02:04.0: saving config space at offset 0x18
(reading 0x2c0702)
[   97.357409] pcieport 0000:02:04.0: saving config space at offset 0x1c
(reading 0x1f1)
[   97.357413] pcieport 0000:02:04.0: saving config space at offset 0x20
(reading 0x5fd05400)
[   97.357418] pcieport 0000:02:04.0: saving config space at offset 0x24
(reading 0x1bf10001)
[   97.357422] pcieport 0000:02:04.0: saving config space at offset 0x28
(reading 0x60)
[   97.357426] pcieport 0000:02:04.0: saving config space at offset 0x2c
(reading 0x60)
[   97.357430] pcieport 0000:02:04.0: saving config space at offset 0x30
(reading 0x0)
[   97.357434] pcieport 0000:02:04.0: saving config space at offset 0x34
(reading 0x80)
[   97.357437] pcieport 0000:02:04.0: saving config space at offset 0x38
(reading 0x0)
[   97.357441] pcieport 0000:02:04.0: saving config space at offset 0x3c
(reading 0x201ff)
[   97.357521] pcieport 0000:02:04.0: PME# enabled
[  134.658112] pcieport 0000:02:04.0: restoring config space at offset 0x2c
(was 0x60, writing 0x60)
[  134.658120] pcieport 0000:02:04.0: restoring config space at offset 0x28
(was 0x60, writing 0x60)
[  134.658127] pcieport 0000:02:04.0: restoring config space at offset 0x24
(was 0x1bf10001, writing 0x1bf10001)
[  134.658239] pcieport 0000:02:04.0: PME# disabled
[  134.658289] pcieport 0000:02:04.0: pciehp: Slot(0-2): Card present
[  134.658291] pcieport 0000:02:04.0: pciehp: Slot(0-2): Link Up
[  134.658304] pcieport 0000:00:07.0: PME: Spurious native interrupt!
[  134.791395] pci 0000:07:00.0: [8086:15d4] type 00 class 0x0c0330
[  134.791453] pci 0000:07:00.0: reg 0x10: [mem 0x00000000-0x0000ffff]
[  134.791548] pci 0000:07:00.0: enabling Extended Tags
[  134.791760] pci 0000:07:00.0: supports D1 D2
[  134.791762] pci 0000:07:00.0: PME# supported from D0 D1 D2 D3hot D3cold
[  134.791771] pci 0000:07:00.0: PME# disabled
[  134.791897] pci 0000:07:00.0: 8.000 Gb/s available PCIe bandwidth, limited
by 2.5 GT/s x4 link at 0000:00:07.0 (capable of 31.504 Gb/s with 8 GT/s x4
link)
[  134.792031] pci 0000:07:00.0: Adding to iommu group 3
[  134.792033] pci 0000:07:00.0: DMAR: Use Intel IOMMU bounce page dma_ops
[  134.792144] pcieport 0000:02:04.0: ASPM: current common clock configuration
is broken, reconfiguring
[  134.792214] pcieport 0000:02:04.0: bridge window [io  0x1000-0x0fff] to [bus
07-2c] add_size 1000
[  134.792222] pcieport 0000:02:04.0: BAR 13: no space for [io  size 0x1000]
[  134.792224] pcieport 0000:02:04.0: BAR 13: failed to assign [io  size
0x1000]
[  134.792227] pcieport 0000:02:04.0: BAR 13: no space for [io  size 0x1000]
[  134.792229] pcieport 0000:02:04.0: BAR 13: failed to assign [io  size
0x1000]
[  134.792234] pci 0000:07:00.0: BAR 0: no space for [mem size 0x00010000]
[  134.792236] pci 0000:07:00.0: BAR 0: failed to assign [mem size 0x00010000]
[  134.792239] pcieport 0000:02:04.0: PCI bridge to [bus 07-2c]
[  134.792249] pcieport 0000:02:04.0:   bridge window [mem
0x54000000-0x5fdfffff]
[  134.792256] pcieport 0000:02:04.0:   bridge window [mem
0x6000000000-0x601bffffff 64bit pref]
[  134.792266] PCI: No. 2 try to assign unassigned res
[  134.792269] pcieport 0000:02:04.0: resource 14 [mem 0x54000000-0x5fdfffff]
released
[  134.792271] pcieport 0000:02:04.0: PCI bridge to [bus 07-2c]
[  134.792278] pcieport 0000:02:04.0: bridge window [io  0x1000-0x0fff] to [bus
07-2c] add_size 1000
[  134.792284] pcieport 0000:02:04.0: BAR 14: no space for [mem size
0x0be00000]
[  134.792286] pcieport 0000:02:04.0: BAR 14: failed to assign [mem size
0x0be00000]
[  134.792289] pcieport 0000:02:04.0: BAR 13: no space for [io  size 0x1000]
[  134.792290] pcieport 0000:02:04.0: BAR 13: failed to assign [io  size
0x1000]
[  134.792294] pcieport 0000:02:04.0: BAR 14: no space for [mem size
0x0be00000]
[  134.792295] pcieport 0000:02:04.0: BAR 14: failed to assign [mem size
0x0be00000]
[  134.792298] pcieport 0000:02:04.0: BAR 13: no space for [io  size 0x1000]
[  134.792299] pcieport 0000:02:04.0: BAR 13: failed to assign [io  size
0x1000]
[  134.792302] pci 0000:07:00.0: BAR 0: no space for [mem size 0x00010000]
[  134.792303] pci 0000:07:00.0: BAR 0: failed to assign [mem size 0x00010000]
[  134.792305] pcieport 0000:02:04.0: PCI bridge to [bus 07-2c]
[  134.792318] pcieport 0000:02:04.0:   bridge window [mem
0x6000000000-0x601bffffff 64bit pref]
[  134.793120] xhci_hcd 0000:07:00.0: init 0000:07:00.0 fail, -16
[  134.793131] xhci_hcd: probe of 0000:07:00.0 failed with error -16
[  279.153557] audit: type=1101 audit(1582476267.943:111): pid=2448

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
