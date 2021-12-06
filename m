Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 18CFC46AAA1
	for <lists+linux-usb@lfdr.de>; Mon,  6 Dec 2021 22:44:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350866AbhLFVre (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 6 Dec 2021 16:47:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229979AbhLFVrd (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 6 Dec 2021 16:47:33 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01EC7C0613F8
        for <linux-usb@vger.kernel.org>; Mon,  6 Dec 2021 13:44:04 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 876C1B815A2
        for <linux-usb@vger.kernel.org>; Mon,  6 Dec 2021 21:44:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3D489C341C1
        for <linux-usb@vger.kernel.org>; Mon,  6 Dec 2021 21:44:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1638827041;
        bh=1v+ILbGerXuQj/r70uk0sIa31Hu0CZM9OSQeZ5XnsSg=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=N7olHJsWNMJNTlpiDfun2ybeR2jVSLI4fkZKXsAlo/f8m/RFchAHOkkZPE8sS96+K
         6ValNYrI100vCA+MyIaOW+fwlZ6/VBobYNggp7+J4lvWtAI1BBr1uOw8cuqu46mEYh
         0oGdEaYKQg2FyCcEXVPSMal1as/QW+FqccMNglkXQYYHRugoaOhSgfp8oDKVoSeS4w
         SWRgBZkCIExJxjy5uJ+Rg9uuCPopb7u4KmONTKq+XBo8AGje+7Vuawf1/cTi1s84Og
         MpMvfKJ0RerAWaKhxpsGO2iSdKvX40pFBpo5FGpmwbEoLaPF3BPbjLVEJAyoJHlkls
         CDLCeh4cDERmA==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id 141AD61177; Mon,  6 Dec 2021 21:44:01 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 214789] ehci-hcd.c ISR
Date:   Mon, 06 Dec 2021 21:44:00 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: scott.c.arnold@nasa.gov
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-214789-208809-LhPITtijmG@https.bugzilla.kernel.org/>
In-Reply-To: <bug-214789-208809@https.bugzilla.kernel.org/>
References: <bug-214789-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D214789

--- Comment #30 from Scott Arnold (scott.c.arnold@nasa.gov) ---
Hello,
The device does not appear to support MSI.
pci_enable_msi and pci_alloc_irq_vectors fail.

From lspci (devices uses a bridge chip):

87:00.0 PCI bridge: PLX Technology, Inc. PEX8112 x1 Lane PCI Express-to-PCI
Bridge (rev aa) (prog-if 00 [Normal decode])
        Physical Slot: 5
        Flags: bus master, fast devsel, latency 0, IRQ 16, NUMA node 2
        Bus: primary=3D87, secondary=3D88, subordinate=3D88, sec-latency=3D=
64
        I/O behind bridge: 0000a000-0000afff
        Memory behind bridge: ca100000-ca1fffff
        Capabilities: [40] Power Management version 2
        Capabilities: [50] MSI: Enable- Count=3D1/1 Maskable- 64bit+
        Capabilities: [60] Express PCI-Express to PCI/PCI-X Bridge, MSI 00
        Capabilities: [100] Power Budgeting <?>

88:00.0 Signal processing controller: Datum Inc. Bancomm-Timing Division De=
vice
4013 (rev 20)
        Subsystem: Datum Inc. Bancomm-Timing Division Device 4013
        Flags: medium devsel, IRQ 16, NUMA node 2
        I/O ports at a000 [size=3D128]
        Memory at ca101000 (32-bit, non-prefetchable) [size=3D2K]
        Memory at ca100000 (32-bit, non-prefetchable) [size=3D2K]

This is a custom driver for our simulation environment.

I will have to schedule time on the machine to try pci=3Dnoioapicreroute.

Scott

-----Original Message-----
From: bugzilla-daemon@bugzilla.kernel.org <bugzilla-daemon@bugzilla.kernel.=
org>=20
Sent: Friday, December 3, 2021 6:03 PM
To: Arnold, Scott C. (JSC-CD13)[SGT, INC] <scott.c.arnold@nasa.gov>
Subject: [EXTERNAL] [Bug 214789] ehci-hcd.c ISR

https://gcc02.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fbugzill=
a.kernel.org%2Fshow_bug.cgi%3Fid%3D214789&amp;data=3D04%7C01%7Cscott.c.arno=
ld%40nasa.gov%7C2cd09dc8c53342df61ca08d9b6b96c85%7C7005d45845be48ae8140d43d=
a96dd17b%7C0%7C0%7C637741729773069186%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wL=
jAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=3DEP=
sPKGihdkKCCxRW2472a6LNLKJ3q1t%2FSZjNKEBUoj0%3D&amp;reserved=3D0

Sean V Kelley (seanvk.dev@oregontracks.org) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |seanvk.dev@oregontracks.org

--- Comment #26 from Sean V Kelley (seanvk.dev@oregontracks.org) --- Hi,

Thanks for reaching out Krzysztof.

So this platform is a Xeon E7-8867.  which makes it a broadwell based Xeon.=
=20

I don't see it in the logs, what is the reported device ID?  Those Xeon have
the capability disable the route to the ICH, which is these quirks are mean=
t to
work with.

It also looks like you are using an out of tree driver?  Is that correct?

Are you unable to use MSI with this device?

Sean

--
You may reply to this email to add a comment.

You are receiving this mail because:
You reported the bug.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
