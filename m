Return-Path: <linux-usb+bounces-7286-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D1A9D86BE76
	for <lists+linux-usb@lfdr.de>; Thu, 29 Feb 2024 02:49:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D136B1C21AB9
	for <lists+linux-usb@lfdr.de>; Thu, 29 Feb 2024 01:49:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 256E92E85B;
	Thu, 29 Feb 2024 01:49:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V7fpKpc7"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A01EE36AFF
	for <linux-usb@vger.kernel.org>; Thu, 29 Feb 2024 01:49:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709171384; cv=none; b=bM2U+OwAKPz6CYpxOM810LjVA5RW+sWGqyG09JTsKvZV4IRy0cAQKmA5gghY3q5odsetAkJl7d070XyoYURO3qREEZEfcHRm9o7sOgHJSiAp2RdlE1j/YuhJqizw4M1dmOTSFzEWXqo1XCXDCWZH9jPxwXMxJb6z4V1C6QCXKgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709171384; c=relaxed/simple;
	bh=a0KUjr8Sw4OT8CMQYpx1UQtlzna33/mQzSBsxu50gOc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ss3G+0jU1IteBQmirB3LpAdJBA5/YH3HYK7ni3zUh0ZMArHtCcU9Z0KRxsMgmouh0edVC0OAzZ++vNn+0Jfm4o5K3DCN2L7BZr7NpyAKyf9PSJqOZi/YH7sxxgkDrlTCcLwI5zypvZ68ckfcMBrnD5kMjtDAjlJCqrst5na0UNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V7fpKpc7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 204AFC433C7
	for <linux-usb@vger.kernel.org>; Thu, 29 Feb 2024 01:49:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709171384;
	bh=a0KUjr8Sw4OT8CMQYpx1UQtlzna33/mQzSBsxu50gOc=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=V7fpKpc7WfOcOVoJsIEgqUrd99X4+M1umHHi7iKZGDhu5xHDUXvwWAEzOo5IqG0yT
	 dWJZlxJmP+u2wCSnHcM5FfSf8Wl8NtQHf4P2xKwkKVeae7jyJF/fkZJTyZBVU4IP+A
	 V3IHo5yIXvspXosrLGKl9m9RJMz+BpOxVineVyQLjPX/4nceoYD80vHvLg01pVWZSu
	 /tY+0TNUtJWTeto+m54q3f2PD7agZyKWpFfI0rEuXOR7mEMQK0ZJjQqtYSOuvG0I1K
	 P1GYBM6MvHdVOlA423fom+YwlYUOvowjYd/j8XbNBxwbuaMRnAT7ikBT0W6T6M7AcG
	 xjzhdnCGjFZmA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 1239EC53BC6; Thu, 29 Feb 2024 01:49:44 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 218525] Thunderbolt eGPU bad performance
Date: Thu, 29 Feb 2024 01:49:43 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: kaukov.peter@pm.me
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-218525-208809-M4ggr1uhh8@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218525-208809@https.bugzilla.kernel.org/>
References: <bug-218525-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218525

kaukov.peter@pm.me changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |kaukov.peter@pm.me

--- Comment #3 from kaukov.peter@pm.me ---
I would also like to chime in regarding eGPUs on Linux. I'm using Nvidia an=
d my
current setup uses an RTX 4090. I ran the Unigine Heaven Benchmark 4.0 on t=
he
Extreme preset on both Windows 11 Pro and Gentoo with kernel 6.6.16 and
Nvidia's proprietary 550.54.14 drivers. I will attempt to attach both bench=
mark
results later.

The Windows benchmark scored 238 points higher and its minimum fps 21.2 hig=
her,
while the maximum fps is 23.8 higher. The average fps is 9.4 higher on Wind=
ows.

The results seem ok, but the real-world performance is different.

On Nvidia, when opening a program that's hardware-accelerated, the whole sy=
stem
stutters. I think this is an Nvidia-only bug so it can be dismissed.

Some native Linux games straight up crash or run very poorly on the eGPU. My
latest encounter is Last Epoch where I got ~20fps on the native port and
~50-60fps via DXVK.

The worst offenders are Unity3D Engine games and MMORPGs. The only game that
was able to achieve close to Windows performance was World of Warcraft and
that's after ticking or unticking the "Tripple Buffering" graphics option e=
ven
though vsync isn't used in-game. This somehow refreshes the game/renderer a=
nd
it starts rendering at high frames per second. FFXIV is stuck at 40-70 fps.
Guild Wars 2 struggles to go beyond 20fps even though the RTX3050Ti dGPU of=
 the
same laptop manages to get 40-60fps.

Baldur's Gate 3 is also a prime example of the issue. On Linux, I get 35-40=
fps
on the character select screen and 2-12fps in-game. I can get 60-80fps on t=
he
3050Ti dGPU. Both when running via DXVK.

The eGPU runs at the expected PCIe3.0x4 speed - LinkSta 8GT/s.

Wayland is completely unusable on the eGPU while perfectly fine on the dGPU.

I'll also try uploading dmesg and lspci logs here.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

