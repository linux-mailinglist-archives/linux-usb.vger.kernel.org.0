Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 784D343CF81
	for <lists+linux-usb@lfdr.de>; Wed, 27 Oct 2021 19:15:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243141AbhJ0RR0 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 27 Oct 2021 13:17:26 -0400
Received: from mail.kernel.org ([198.145.29.99]:37596 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S239397AbhJ0RR0 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 27 Oct 2021 13:17:26 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id BE095601FF
        for <linux-usb@vger.kernel.org>; Wed, 27 Oct 2021 17:15:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1635354900;
        bh=VykGUOv6iAmMMlPUjCh2WLnLSbZCRaKGP5Dt2klKku8=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=PXsiV3lChgpa6CAd7SWX6Cetvz6qHfqN5LAOuuxjOZN612seYWAYfUhaxvdonuO2o
         HGv8RvYMHaO237xdJPoODTRtfkz4EVaW5+lReEsRhMwCj4ds1XR3exknZvMgp8Idpd
         FgOQMV7I8oeKlIahHbMRCxiUhywl5zJDO1AHwXS3WBrnTKtVrmsx+D9jblG0W8Nxnj
         heurB81bbPWVSOyd5n/A/MNwUgtRskeDRmUcss20p7MIoDcItI/GHRqQUHzQjj1UPp
         ZDI8902KgSeOtI9w9rD7oJS1131knz3yXJ+kThcL3JSk4Px/EBw+rvzN6n0Hr0/f22
         5/UWfvD9dNjag==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id B077D610CD; Wed, 27 Oct 2021 17:15:00 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 214789] ehci-hcd.c ISR
Date:   Wed, 27 Oct 2021 17:15:00 +0000
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
Message-ID: <bug-214789-208809-xF8OLDW5qW@https.bugzilla.kernel.org/>
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

--- Comment #14 from Scott Arnold (scott.c.arnold@nasa.gov) ---
Hello,
Sorry for the confusion.
While patching echi-hcd.c using meld to change spin_locks " current_status =
=3D
ehci_readl(ehci, &ehci->regs->status);" got changed to "status =3D
ehci_readl(ehci, &ehci->regs->status);" (~line 723).
As a result current_status was used un-initialized (I would have thought gcc
8.3.1 would have warned about that).
This caused the "nobody cared" messages on IRQ's 16 and 23. So ehci-hcd did=
 not
load/allocate the IRQ's.
Spin_locks are not the problem.
If ehci-hcd does not load the timer card works fine.
If ehci-hcd loads the timer card will not work even if ehci-hcd is unloaded.
IRQ count on 16 stuck at ~90 in /proc/interrupts.
Seems like IRQ 16 is somehow left disabled. Could be why uhci-hcd does not =
load
?
All works fine with the 5.3.6 kernel, broken in 5.11+.

Lsudb with 5.3.6:

Bus 002 Device 003: ID 0424:2660 Microchip Technology, Inc. (formerly SMSC)=
 Hub
Bus 002 Device 002: ID 8087:0024 Intel Corp. Integrated Rate Matching Hub
Bus 002 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
Bus 003 Device 001: ID 1d6b:0001 Linux Foundation 1.1 root hub
Bus 001 Device 003: ID 14dd:1007 Raritan Computer, Inc. D2CIM-VUSB KVM
connector
Bus 001 Device 002: ID 8087:0024 Intel Corp. Integrated Rate Matching Hub
Bus 001 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub

Thanks
Scott

-----Original Message-----
From: bugzilla-daemon@bugzilla.kernel.org <bugzilla-daemon@bugzilla.kernel.=
org>=20
Sent: Tuesday, October 26, 2021 9:06 PM
To: Arnold, Scott C. (JSC-CD13)[SGT, INC] <scott.c.arnold@nasa.gov>
Subject: [EXTERNAL] [Bug 214789] ehci-hcd.c ISR

https://gcc02.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fbugzill=
a.kernel.org%2Fshow_bug.cgi%3Fid%3D214789&amp;data=3D04%7C01%7Cscott.c.arno=
ld%40nasa.gov%7Cb7b68d317a8a42969d9508d998ee48e8%7C7005d45845be48ae8140d43d=
a96dd17b%7C0%7C0%7C637708971458208168%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wL=
jAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3DZk=
3yh4xfKyj7NsjmOmmnfWZ%2FukvbAOpeKrziViiPVUc%3D&amp;reserved=3D0

--- Comment #13 from Alan Stern (stern@rowland.harvard.edu) --- What does t=
he
kernel log from a recent kernel say about UHCI?  If it is present in the ol=
der
kernel then it should still show up in the recent kernel.

And if the problem is related to uhci-hcd, why would patching ehci-hcd make=
 it
go away?

--
You may reply to this email to add a comment.

You are receiving this mail because:
You reported the bug.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
