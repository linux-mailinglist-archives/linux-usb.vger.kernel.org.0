Return-Path: <linux-usb+bounces-27533-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 92BC4B43184
	for <lists+linux-usb@lfdr.de>; Thu,  4 Sep 2025 07:11:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 326325E68D2
	for <lists+linux-usb@lfdr.de>; Thu,  4 Sep 2025 05:11:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8090422A4FC;
	Thu,  4 Sep 2025 05:11:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Iah+ywNM"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC3A91C84B9
	for <linux-usb@vger.kernel.org>; Thu,  4 Sep 2025 05:11:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756962674; cv=none; b=lD9GC+nGjGxBMu8H38WC9TCjP9vHsfFhucEwSdL4lOEzWdMuM3Iwf8OS9wNPNlZmcjSapCppz3v0uJoyLDiLKjLKvFubneLBkOCOpuurlMcRjUX22tDGAFtqC89RWPRpaWE6kWTVPs0slJUGmPcrn6xawgXbUCKjvUlDjKfddvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756962674; c=relaxed/simple;
	bh=BYO8fsKfOpMAZVDvBEorJfYVbipCWw4asgU6o2P6pwk=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jL3TWRhKaDFE8BVUrMIKGnieFg192OQ86vXnXLH950E3u8w5xD9wtWpBGLYBJTb4yxfIm3cC1k2R3BwkV02wwoEQfVUFbKVCqOV9V3LDTa7yPeYwI7RXBJWuWdes0/ciqIbmBrK18VzrkVKcd9KcL6B0BhqMRsGQppjwk5bLPb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Iah+ywNM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7CFD3C4CEF0
	for <linux-usb@vger.kernel.org>; Thu,  4 Sep 2025 05:11:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756962672;
	bh=BYO8fsKfOpMAZVDvBEorJfYVbipCWw4asgU6o2P6pwk=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Iah+ywNMVM85Lru0thQggNoSBkT6kQ+iK/mwKHWkRiYMTuJhw1TGyHq4L0kuSVGUk
	 79MsVM1Vag6MCtxNLIzde9CSvWdhsmEKYeA66VKp4IZQjviB/zV9p5xDfSm/BDQZ8r
	 JyFDz2vGO579NOp02VOguphcSrentcqkJzzfrZ2GiEyxizuI2ylScTwvh4FoM+3AZ0
	 SzP45hX0yb1539X6LvNBQA/osHR9U0ObKtcTl5de0zyeebaJMFhlTp3GeGELX52t6J
	 +rOIZYJ85Ode35rt/tJyvvoNiw6K1qBhEGqiK6eg9GQj/yswMg7qMW2FE1A+AFuhot
	 H2YgmYYczwR2g==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 6C281C3279F; Thu,  4 Sep 2025 05:11:12 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220491] usb_storage connected SD card disconnects/reconnects on
 resume from suspend
Date: Thu, 04 Sep 2025 05:11:12 +0000
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
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220491-208809-Kt0fNF335S@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220491-208809@https.bugzilla.kernel.org/>
References: <bug-220491-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220491

--- Comment #38 from Micha=C5=82 Pecio (michal.pecio@gmail.com) ---
(In reply to Paul Ausbeck from comment #31)
> Created attachment 308613 [details]
> xhci_hcd and usbcore dmesg trace, emb-qm77, S/R, USB storage manually
> disconnected
>=20
> This is a dmesg log fragment with xhci_hcd and usbcore dynamic debug
> enabled, suspend/resume events, with the USB storage device being physica=
lly
> unplugged wile the machine is suspended.

This nicely illustrates why usb_persist is hard (and dangerous: you could
disconnect the device and connect a different one). This log is *exactly* t=
he
same as the one you posted before, except that when the kernel restores pow=
er,
the root hub port goes to RxDetect state (detecting electrical SuperSpeed
connection) and stays there because the device is gone.

[  368.488920] xhci_hcd 0000:00:14.0: Set port 4-2 link state, portsc: 0x12=
03,
write 0x11261
[  368.859068] xhci_hcd 0000:00:14.0: Port change event, 4-2, id 6, portsc:
0x100080
[  369.862706] xhci_hcd 0000:00:14.0: set port power 4-2 ON, portsc: 0x1000=
80
[  369.966674] xhci_hcd 0000:00:14.0: Get port status 4-2 read: 0x1002a0,
return 0x802a0

I suspect that usb_persist fails in this case because it simply doesn't
consider overcurrent ports to be eligible, or something like that.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

