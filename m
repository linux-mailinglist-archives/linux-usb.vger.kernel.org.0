Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EF533436B68
	for <lists+linux-usb@lfdr.de>; Thu, 21 Oct 2021 21:38:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231182AbhJUTkY (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 21 Oct 2021 15:40:24 -0400
Received: from mail.kernel.org ([198.145.29.99]:51306 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230020AbhJUTkN (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 21 Oct 2021 15:40:13 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id BBAB160EE9
        for <linux-usb@vger.kernel.org>; Thu, 21 Oct 2021 19:37:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1634845076;
        bh=OgYhVxnVvZZSUC2kTr61g0ZXc7NqAefeesi2u88KIkM=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=jfh2eT6h0S2BciP/q8QZi/K2tlrHAz0d2MF/zZrnaf04gXSt6anWBIo2lJampzOMa
         gX/dDNSVMLCFV0vywMTpMscW/egtrkPkl6UeoiZ9ymT5eZts9uSA/b9ejxuetrDoPe
         WSAzkylJmz5J3wKFb3QhP9UtFrF7MUoaVj/G8CnJRH1k6SEPHlizQyNFMF8q+/6AsC
         muQnH90QBSsfUUZadW/bS2Z+grULCC7InJuFAspH7yEJ6ZJTaZPpPcLpXbeIMvvu9A
         AvA9WXIeiwjg5teNAqq5zSLNZG2zSUtMTXmcnSvDnChS2wAvq+KpqXTYA/sAbTXkGe
         /DNKEFCYRqU2A==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id B335460F92; Thu, 21 Oct 2021 19:37:56 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 214789] ehci-hcd.c ISR
Date:   Thu, 21 Oct 2021 19:37:56 +0000
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
Message-ID: <bug-214789-208809-QZ7MWxoRHT@https.bugzilla.kernel.org/>
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

--- Comment #7 from Scott Arnold (scott.c.arnold@nasa.gov) ---
Anything you want me to try while I have the hardware available?

-----Original Message-----
From: bugzilla-daemon@bugzilla.kernel.org <bugzilla-daemon@bugzilla.kernel.=
org>=20
Sent: Thursday, October 21, 2021 2:28 PM
To: Arnold, Scott C. (JSC-CD13)[SGT, INC] <scott.c.arnold@nasa.gov>
Subject: [EXTERNAL] [Bug 214789] ehci-hcd.c ISR

https://gcc02.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fbugzill=
a.kernel.org%2Fshow_bug.cgi%3Fid%3D214789&amp;data=3D04%7C01%7Cscott.c.arno=
ld%40nasa.gov%7C551e718474f3400d4b2508d994c8e126%7C7005d45845be48ae8140d43d=
a96dd17b%7C0%7C0%7C637704412758963825%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wL=
jAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3Dqr=
laDQOIszpc5Q%2BNbQUxzpDh%2FIyBIvCclogFe2OAAm0%3D&amp;reserved=3D0

--- Comment #5 from Alan Stern (stern@rowland.harvard.edu) --- Okay, but _w=
hy_
don't the timing card's interrupts get handled when ehci_irq uses spin_lock=
?=20
And _why_ does changing to spin_lock_irqsave make a difference?

Do all of the card's interrupt requests get lost or only some of them?

Are you somehow getting recursive (nested) interrupts for the same IRQ line?

Is ehci_irq somehow getting called with interrupts enabled?

I don't want to make any changes to the driver until we know the answers to
these questions.

--
You may reply to this email to add a comment.

You are receiving this mail because:
You reported the bug.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
