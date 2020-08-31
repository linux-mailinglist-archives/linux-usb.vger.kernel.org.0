Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6A04F257A4D
	for <lists+linux-usb@lfdr.de>; Mon, 31 Aug 2020 15:24:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726791AbgHaNY3 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Mon, 31 Aug 2020 09:24:29 -0400
Received: from mail.kernel.org ([198.145.29.99]:52482 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726121AbgHaNY1 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 31 Aug 2020 09:24:27 -0400
From:   bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     linux-usb@vger.kernel.org
Subject: [Bug 208891] Thunderbolt hotplug fails on HP x360 13t-aw000/86FA
 with HP Thunderbolt 3 Dock
Date:   Mon, 31 Aug 2020 13:24:26 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mika.westerberg@linux.intel.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-208891-208809-yD96IYJwa7@https.bugzilla.kernel.org/>
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

--- Comment #32 from Mika Westerberg (mika.westerberg@linux.intel.com) ---
Thanks for the logs. I think I know what is going on. From the failure log:

Registers get saved:
[   80.292442] pci 0000:2d:00.0: saving config space at offset 0x1c (reading
0x101)
[   80.292446] pci 0000:2d:00.0: saving config space at offset 0x20 (reading
0x0)
[   80.292450] pci 0000:2d:00.0: saving config space at offset 0x24 (reading
0x10001)
[   80.292454] pci 0000:2d:00.0: saving config space at offset 0x28 (reading
0x0)
[   80.292458] pci 0000:2d:00.0: saving config space at offset 0x2c (reading
0x0)

Resources are assigned:
[   80.293725] pci 0000:2d:00.0: BAR 8: assigned [mem 0x68000000-0x680fffff]
[   80.293727] pci 0000:2d:00.0: BAR 9: assigned [mem 0x6000000000-0x60000fffff
64bit pref]
[   80.293752] pci 0000:2d:00.0: BAR 7: assigned [io  0x5000-0x5fff]
...
[   80.293803] pci 0000:2d:00.0: PCI bridge to [bus 2e]
[   80.293807] pci 0000:2d:00.0:   bridge window [io  0x5000-0x5fff]
[   80.293816] pci 0000:2d:00.0:   bridge window [mem 0x68000000-0x680fffff]
[   80.293823] pci 0000:2d:00.0:   bridge window [mem 0x6000000000-0x60000fffff
64bit pref]

Note that there is no save happening here. Then shortly after there is register
restore:

[   80.294748] pcieport 0000:2d:00.0: runtime IRQ mapping not provided by arch
[   80.294830] pcieport 0000:2d:00.0: restoring config space at offset 0x2c
(was 0x60, writing 0x0)
[   80.294835] pcieport 0000:2d:00.0: restoring config space at offset 0x28
(was 0x60, writing 0x0)
[   80.294839] pcieport 0000:2d:00.0: restoring config space at offset 0x24
(was 0x10001, writing 0x10001)
[   80.294844] pcieport 0000:2d:00.0: restoring config space at offset 0x20
(was 0x68006800, writing 0x0)
                                                                               
 ^^^^^^^^^^          ^^^
[   80.294848] pcieport 0000:2d:00.0: restoring config space at offset 0x1c
(was 0x5151, writing 0x101)

This ends up clearing the bridge window registers of 2d:00.0 downstream port. I
guess this does not happen always because it is dependent on timing.

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
