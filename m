Return-Path: <linux-usb+bounces-18729-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 969FB9FA82E
	for <lists+linux-usb@lfdr.de>; Sun, 22 Dec 2024 21:49:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F414616563A
	for <lists+linux-usb@lfdr.de>; Sun, 22 Dec 2024 20:49:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 388A61714D7;
	Sun, 22 Dec 2024 20:49:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JzxQVHUJ"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB84028DA1
	for <linux-usb@vger.kernel.org>; Sun, 22 Dec 2024 20:49:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734900586; cv=none; b=KuRQeaIH0uy3pnItdNdO9CcQjQYmZCfNOSG+E6j1wda25pNf4Xh9o0lq3+jLWAWtYN7ubKHYOMBXHa8VkeSo4st/ZQhMZmg4Uo5fHE3iTWOQDf93X/O/mtIoRaaoKIJIuXH1b/VpITfxGfowIIrhj4jjcyZC76CBtxweFnuPLsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734900586; c=relaxed/simple;
	bh=so7c878bc4AFC2lHPhhDeSkaDeRhkXmadB/DQr9OBak=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=MaES3QwIx0qBZkQ0gw0OSoTzxhbjkU6eCiDxKfsg4okE6rkohqPd0UF06C8DnGPPZLaEyWZZk5qj3zRLrJeSfy6POOAGthbeeWN26gleKEy8BPy28xtDbsyyPEomQr3MhrcpRg6feCA4yqyokV4DR+/pUyBWPuG5g6KaLKqNYPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JzxQVHUJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4C48BC4CEE0
	for <linux-usb@vger.kernel.org>; Sun, 22 Dec 2024 20:49:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734900586;
	bh=so7c878bc4AFC2lHPhhDeSkaDeRhkXmadB/DQr9OBak=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=JzxQVHUJvgUgDN12zv3xS6NKsmqG/ZuFOazpDn8Mt12aK5IWFrNnRirOepbvVss7q
	 /QrKoX18vygtPGohiWwSiJc9wqQh+jFO8SqBIBztXL7fYx3IqlsbI8md7md3Demaoi
	 p56ZwCf8bLA39kBnaYwIUSJuMQX+tTrgUKq6j1KKFR3EjjNMTEhuWKGF57UQgTOF0y
	 uM9zF/mRxBmGv0H7eS6k1filWH7G0dFOqsRPz/zZAEdCqRytUXT2N6we9929r/BTPL
	 2gxJuSYf6xW5sc3hE8Kkno95SB4has/2nkXQ5eDd+bq7+NsjfFNH2WK0DC/AIiZodx
	 HocS4MpLVNk9g==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 42C36C41613; Sun, 22 Dec 2024 20:49:46 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 215906] DMAR fault when connected usb hub (xhci_hcd)
Date: Sun, 22 Dec 2024 20:49:45 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: michal.pecio@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-215906-208809-8eqU1TMfSv@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215906-208809@https.bugzilla.kernel.org/>
References: <bug-215906-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

https://bugzilla.kernel.org/show_bug.cgi?id=3D215906

Micha=C5=82 Pecio (michal.pecio@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |michal.pecio@gmail.com

--- Comment #20 from Micha=C5=82 Pecio (michal.pecio@gmail.com) ---
By a complete accident I found that VL805 has a known bug where it overfetc=
hes
transfer rings:
https://github.com/raspberrypi/linux/issues/4685

Rolf, there is a workaround for similar bug in Zhaoxin hardware which may s=
olve
your IOMMU faults.

Update to at least v6.6, or the latest v6.12 series if it's not a problem.

Run the following (if using a USB keyboard put it all in a script):
rmmod xhci_pci
rmmod xhci_hcd
modprobe xhci_hcd quirks=3D0x200000000000
modprobe xhci_pci

Verify that it worked:
dmesg |grep quirks
[122123.422469] xhci_hcd 0000:08:00.0: hcc params 0x002841eb hci version 0x=
100
quirks 0x0000200000000890
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20
            ^-- here
And see if it helps.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

