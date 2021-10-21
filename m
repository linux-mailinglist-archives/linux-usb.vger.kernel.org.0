Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 23343436BBC
	for <lists+linux-usb@lfdr.de>; Thu, 21 Oct 2021 22:04:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232000AbhJUUGg (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 21 Oct 2021 16:06:36 -0400
Received: from mail.kernel.org ([198.145.29.99]:44942 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230020AbhJUUGW (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 21 Oct 2021 16:06:22 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 852726128B
        for <linux-usb@vger.kernel.org>; Thu, 21 Oct 2021 20:04:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1634846646;
        bh=NoCBr1XPXdIdkwYEyKYBdySQoubvfIR/amtsitcAPkU=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=C3ODIye9rNGoHQ+WiT/72Y/vaF9I18RtUZ5fqxssz6+wPTZntgd767NvKQporPPrQ
         o+p66QvxBmafaxXMjAYszZ4O0gQcwzf5qkSU6k+f/YP4Cl1dxWC7fcvf3jv5vgyUoa
         EmRwd2XOy+jwY2RvQWCAeFt9M/jorDGnjwCH6ToKN/DkQzfQzV5EzApxmIT4jELwoy
         764p4UhuVgWZgHYZHBz3D+CKjzRcLPa/sH+9j2qRMLLwmv8ac3F7ITTydAV3PCzm7b
         NY5iBr1QzGN0lKYkdn92Ckye1LISGYJDBWBu6Bz8A5SZOO8AZL++AQ1tAuJTtEFXU2
         1IZJuKjE/3lpQ==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id 7772260F92; Thu, 21 Oct 2021 20:04:06 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 214789] ehci-hcd.c ISR
Date:   Thu, 21 Oct 2021 20:04:06 +0000
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
Message-ID: <bug-214789-208809-pZY0CUx8KD@https.bugzilla.kernel.org/>
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

--- Comment #9 from Scott Arnold (scott.c.arnold@nasa.gov) ---
Hello,
The timing card driver receives no interrupts according to debug.
IRQ16:  IO-APIC   16-fasteoi   ehci_hcd:usb1, hpilo, rt_pcclk

Ehci_hcd entries in /sys/kernel/debug/usb/devices:

T:  Bus=3D01 Lev=3D00 Prnt=3D00 Port=3D00 Cnt=3D00 Dev#=3D  1 Spd=3D480  Mx=
Ch=3D 2
B:  Alloc=3D  0/800 us ( 0%), #Int=3D  4, #Iso=3D  0
D:  Ver=3D 2.00 Cls=3D09(hub  ) Sub=3D00 Prot=3D00 MxPS=3D64 #Cfgs=3D  1
P:  Vendor=3D1d6b ProdID=3D0002 Rev=3D 5.11
S:  Manufacturer=3DLinux 5.11.17_OBCS_1 ehci_hcd
S:  Product=3DEHCI Host Controller
S:  SerialNumber=3D0000:00:1a.0
C:* #Ifs=3D 1 Cfg#=3D 1 Atr=3De0 MxPwr=3D  0mA
I:* If#=3D 0 Alt=3D 0 #EPs=3D 1 Cls=3D09(hub  ) Sub=3D00 Prot=3D00 Driver=
=3Dhub
E:  Ad=3D81(I) Atr=3D03(Int.) MxPS=3D   4 Ivl=3D256ms

T:  Bus=3D02 Lev=3D00 Prnt=3D00 Port=3D00 Cnt=3D00 Dev#=3D  1 Spd=3D480  Mx=
Ch=3D 2
B:  Alloc=3D  0/800 us ( 0%), #Int=3D  0, #Iso=3D  0
D:  Ver=3D 2.00 Cls=3D09(hub  ) Sub=3D00 Prot=3D00 MxPS=3D64 #Cfgs=3D  1
P:  Vendor=3D1d6b ProdID=3D0002 Rev=3D 5.11
S:  Manufacturer=3DLinux 5.11.17_OBCS_1 ehci_hcd
S:  Product=3DEHCI Host Controller
S:  SerialNumber=3D0000:00:1d.0
C:* #Ifs=3D 1 Cfg#=3D 1 Atr=3De0 MxPwr=3D  0mA
I:* If#=3D 0 Alt=3D 0 #EPs=3D 1 Cls=3D09(hub  ) Sub=3D00 Prot=3D00 Driver=
=3Dhub
E:  Ad=3D81(I) Atr=3D03(Int.) MxPS=3D   4 Ivl=3D256ms

I have not tried enabling debug in ehci_hcd yet.
Moving card to another slot did not help, still sharing IRQ 16

Thanks
Scott
-----Original Message-----
From: bugzilla-daemon@bugzilla.kernel.org <bugzilla-daemon@bugzilla.kernel.=
org>=20
Sent: Thursday, October 21, 2021 2:46 PM
To: Arnold, Scott C. (JSC-CD13)[SGT, INC] <scott.c.arnold@nasa.gov>
Subject: [EXTERNAL] [Bug 214789] ehci-hcd.c ISR

https://gcc02.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fbugzill=
a.kernel.org%2Fshow_bug.cgi%3Fid%3D214789&amp;data=3D04%7C01%7Cscott.c.arno=
ld%40nasa.gov%7Ccc119a80759145cdeec508d994cb775f%7C7005d45845be48ae8140d43d=
a96dd17b%7C0%7C0%7C637704423875337090%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wL=
jAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3DJ1=
5Rmcdsnn%2Bp7O%2FFtRSqnlohPqS%2FxEGqznFqLMQaNOs%3D&amp;reserved=3D0

--- Comment #8 from Alan Stern (stern@rowland.harvard.edu) --- How many of
those 90 interrupts were issued by the EHCI host controller as opposed to t=
he
card?

Are there any USB devices attached to the host controller?  What does
/sys/kernel/debug/usb/devices have to say?

Does the card use edge-triggered interrupts rather than level-triggered?

Have you tried adding any debugging messages to ehci_irq to find out what's
going on when it runs?

--
You may reply to this email to add a comment.

You are receiving this mail because:
You reported the bug.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
