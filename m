Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F0E8B437402
	for <lists+linux-usb@lfdr.de>; Fri, 22 Oct 2021 10:53:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232279AbhJVIzu (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 22 Oct 2021 04:55:50 -0400
Received: from mail.kernel.org ([198.145.29.99]:52960 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231984AbhJVIzt (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 22 Oct 2021 04:55:49 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 8DA3A610CF
        for <linux-usb@vger.kernel.org>; Fri, 22 Oct 2021 08:53:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1634892812;
        bh=ADmpdBRjCUmaTI+1yifrnpntfi9dFWb8XC4sJwCSqpA=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=Sz2ym/BgBWJyo4zzY1eX6hpLFqVRmptMifdftD/bJSYoxeom4LRMIoUaaQP20srlZ
         Ka1Tyw2Zv/26Xqupxqm28AFGDVPrJJCi48EN+otLajYlNvtnMq+BPA6WEHeB9xzyJu
         tEdvVpC9NCAirIn/uRrpaO1cZr8oZW3CJOvSbHeOn15DHex9qLDZzxsBt0m9j3tdMO
         Lc17idGN9D046U4Mju4NqEb+F+bFsQwwJ0ObF+m0b7fgSGcqR9bb/9/d5deDJum6xc
         +bi1rP5QQZIa3YVY7lyMViZxSqx8joDH15LUgJLS3SeUvIAFmVH/n1JZNKL53PCuxi
         oewbjcA2ZRGHQ==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id 7C09460F90; Fri, 22 Oct 2021 08:53:32 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 214789] ehci-hcd.c ISR
Date:   Fri, 22 Oct 2021 08:53:32 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: johan@kernel.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-214789-208809-uTMTxl5xXa@https.bugzilla.kernel.org/>
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

--- Comment #10 from Johan Hovold (johan@kernel.org) ---
On Thu, Oct 21, 2021 at 08:04:06PM +0000, bugzilla-daemon@bugzilla.kernel.o=
rg
wrote:
> https://bugzilla.kernel.org/show_bug.cgi?id=3D214789
>=20
> --- Comment #9 from Scott Arnold (scott.c.arnold@nasa.gov) ---
> Hello,
> The timing card driver receives no interrupts according to debug.
> IRQ16:  IO-APIC   16-fasteoi   ehci_hcd:usb1, hpilo, rt_pcclk

So the IRQ is also shared with some (mainline) HP management-processor
driver (hpilo).

> Ehci_hcd entries in /sys/kernel/debug/usb/devices:
>=20
> T:  Bus=3D01 Lev=3D00 Prnt=3D00 Port=3D00 Cnt=3D00 Dev#=3D  1 Spd=3D480  =
MxCh=3D 2
> B:  Alloc=3D  0/800 us ( 0%), #Int=3D  4, #Iso=3D  0
> D:  Ver=3D 2.00 Cls=3D09(hub  ) Sub=3D00 Prot=3D00 MxPS=3D64 #Cfgs=3D  1
> P:  Vendor=3D1d6b ProdID=3D0002 Rev=3D 5.11
> S:  Manufacturer=3DLinux 5.11.17_OBCS_1 ehci_hcd
> S:  Product=3DEHCI Host Controller
> S:  SerialNumber=3D0000:00:1a.0
> C:* #Ifs=3D 1 Cfg#=3D 1 Atr=3De0 MxPwr=3D  0mA
> I:* If#=3D 0 Alt=3D 0 #EPs=3D 1 Cls=3D09(hub  ) Sub=3D00 Prot=3D00 Driver=
=3Dhub
> E:  Ad=3D81(I) Atr=3D03(Int.) MxPS=3D   4 Ivl=3D256ms

Just to be clear: Are there any USB devices physically connected to this
bus?

What does "lsusb -s1:" say?

> I have not tried enabling debug in ehci_hcd yet.

Try adding

        WARN_ON_ONCE(!irqs_disabled());

at the start of ehci_irq() before grabbing the lock.

That should give us a stack dump in case there's someone calling the
interrupt handler with interrupts enabled (which seems to be the case).

Johan

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
