Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EAD5943675E
	for <lists+linux-usb@lfdr.de>; Thu, 21 Oct 2021 18:13:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231566AbhJUQPk (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 21 Oct 2021 12:15:40 -0400
Received: from mail.kernel.org ([198.145.29.99]:39436 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229702AbhJUQPk (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 21 Oct 2021 12:15:40 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 02F196120F
        for <linux-usb@vger.kernel.org>; Thu, 21 Oct 2021 16:13:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1634832804;
        bh=p9uBSqY0RGj610mTtlg4njIT50uqLoWcjR+rVZxqIK8=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=bR0EVMnH/Us6B+MeKUuhY8YS47ouSAPevnPhGHr4ellEoIuN26KGkk4Ky+zfw7pIP
         07Ap5mEgtUyhfvSel0kl+I3pfgTqdHlRe1DLoYWvd6b0ckfnc9qyqjQ1IchGWo1mfo
         Yn2troNantapO9vvDh3jd6GrPzMVl5CbM+YVH9zygqSeWUOIBsWDWTcXRA3vusM54f
         Fr1YtL09AbKbRySfP8lMBhyPgHjq3rrIYDZWFo0EsEuw0lPexR6hqlNHH33Rpo4nPf
         e/WiqyaVpb3HiAbIqFcxt35VrtzE7PUi9jGWtGpYDUZgNFlCe3DhfAmdi3/5/TOg+Z
         +tsscqmW9C2Dg==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id E6FCA60E8C; Thu, 21 Oct 2021 16:13:23 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 214789] ehci-hcd.c ISR
Date:   Thu, 21 Oct 2021 16:13:23 +0000
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
Message-ID: <bug-214789-208809-0sL95uFuyL@https.bugzilla.kernel.org/>
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

--- Comment #4 from Scott Arnold (scott.c.arnold@nasa.gov) ---
Hello,
Timing card is not receiving interrupts when sharing a IRQ (16) with the
ehci-hcd driver and the 5.11.17  (also tried 5.14.13) kernel.
I changed the spin_lock/spin_unlock back to spin_lock_irqsave/irqrestore in
ehci_irq in the 5.14.13 kernel and timing card now getting interrupts as
expected.
The 5.3 (and probably prior although I have not checked) are using the
irqsave/restore versions of spinlock in ehci_irq.
From 5.3:
       /*
         * For threadirqs option we use spin_lock_irqsave() variant to prev=
ent
         * deadlock with ehci hrtimer callback, because hrtimer callbacks r=
un
         * in interrupt context even when threadirqs is specified. We can go
         * back to spin_lock() variant when hrtimer callbacks become thread=
ed.
         */
        spin_lock_irqsave(&ehci->lock, flags);

Thanks
Scott

-----Original Message-----
From: bugzilla-daemon@bugzilla.kernel.org <bugzilla-daemon@bugzilla.kernel.=
org>=20
Sent: Thursday, October 21, 2021 11:03 AM
To: Arnold, Scott C. (JSC-CD13)[SGT, INC] <scott.c.arnold@nasa.gov>
Subject: [EXTERNAL] [Bug 214789] ehci-hcd.c ISR

https://gcc02.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fbugzill=
a.kernel.org%2Fshow_bug.cgi%3Fid%3D214789&amp;data=3D04%7C01%7Cscott.c.arno=
ld%40nasa.gov%7Ce7de881063ce46edc00808d994ac34f6%7C7005d45845be48ae8140d43d=
a96dd17b%7C0%7C0%7C637704289608055302%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wL=
jAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3Dkl=
AQp1A7%2FNOCGgcfJ29A2EQwDD%2Fa5UQbX%2BLUaHU5fb4%3D&amp;reserved=3D0

--- Comment #3 from Alan Stern (stern@rowland.harvard.edu) --- Can you prov=
ide
more information about exactly what goes wrong?  And why shared IRQs should
make any difference?

--
You may reply to this email to add a comment.

You are receiving this mail because:
You reported the bug.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
