Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 20407244F92
	for <lists+linux-usb@lfdr.de>; Fri, 14 Aug 2020 23:36:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726700AbgHNVge convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Fri, 14 Aug 2020 17:36:34 -0400
Received: from mail.kernel.org ([198.145.29.99]:42122 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726596AbgHNVge (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 14 Aug 2020 17:36:34 -0400
From:   bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     linux-usb@vger.kernel.org
Subject: [Bug 208891] Thunderbolt hotplug fails on HP x360 13t-aw000/86FA
 with HP Thunderbolt 3 Dock
Date:   Fri, 14 Aug 2020 21:36:33 +0000
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
Message-ID: <bug-208891-208809-ovGRCfD7jA@https.bugzilla.kernel.org/>
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

--- Comment #22 from Matt Turner (mattst88@gmail.com) ---
(In reply to Mika Westerberg from comment #21)
> Thanks for the logs. For some reason the two downstream PCIe ports (2d:00.0
> and 2d:01.0) that lead to the xHCI and the NIC get their bridge windows
> reset to 0 and this prevents drivers from accessing their MMIO registers. I
> also see that you are not running the mainline kernel so can you take v5.8
> vanilla kernel and try that and add "pcie_port_pm=off" to the kernel command
> line to disable runtime PM of those ports.

Tried with v5.8.1. Was previously using 5.8.0-rc7-next-20200729 because I
expected to be asked to test linux-next.

Anyway, pcie_port_pm=off didn't help. Neither did pcie_ports=native.

I also tried adding

+DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_INTEL,  0x1578, quirk_no_bus_reset);

to drivers/pci/quirks.c on a whim because of something I saw in a google
search, but of course that didn't help either.

Is the fact that it works if I attach the dock and then boot the system not
indicative of something? Is the BIOS/EFI setup tasked with programming some
stuff that the thunderbolt driver might be failing to do so?

I just noticed something odd. Coldplugged with the dock working, I can suspend
and resume and it will continue working. But if I unplug and replug the dock
while the system is suspended, it fails to work after resume.

Doesn't that indicate that the thunderbolt firmware is doing something wrong?

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
