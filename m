Return-Path: <linux-usb+bounces-32084-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id EB3BBD06624
	for <lists+linux-usb@lfdr.de>; Thu, 08 Jan 2026 22:56:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id ED7E33012CF1
	for <lists+linux-usb@lfdr.de>; Thu,  8 Jan 2026 21:56:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E70733D50E;
	Thu,  8 Jan 2026 21:56:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fI2MCmvu"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F07AC3033D5
	for <linux-usb@vger.kernel.org>; Thu,  8 Jan 2026 21:56:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767909386; cv=none; b=ZQrc0JpnQu0z7mHQLXLM1D8juNiO6RqMJMUnhySbDTCsh3+0FYKEdPrATRXStA8bStJKgt5SF7OY1Qh7g/EiUewXcG8JzxlAbgM1FawnDyCQefJF+avlpd8Nna058hAluG7w69mOBZe+tRJv2e2oh6leX+XQSabO0yFBGH/anJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767909386; c=relaxed/simple;
	bh=stVKZkXIqFm76+CJnTiSimLbkfJ6uG51H/C4AMhCxOE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=S4yUeGUg+1MaQK0JO+EF1QN5XmoAxMl6YxgSpMNheCaMdQTht4lfft3W9ORdfp1k8Qv11ToS+oWANFARv9AiFf8agfdtaPTTXulHulj72vODRSVDOJ3g5EB8SPE+az1M2r7xPGQyBrKS7jWJioWJBaC48ABI54J7ljrdtgLpqzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fI2MCmvu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 950CDC19422
	for <linux-usb@vger.kernel.org>; Thu,  8 Jan 2026 21:56:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767909385;
	bh=stVKZkXIqFm76+CJnTiSimLbkfJ6uG51H/C4AMhCxOE=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=fI2MCmvuqi6C5yN4n3JaTrw9sYK5jYgtfIasdezmfslFEBI5BrHqc+gTFaLyJNE9z
	 sj4GC/wkU2jZgRPvqUk8dN9eduQVSGjgcMt8Md8EJhNpMLgLCilNfKFy+Hu4icyneD
	 PQqDfyLZMNgvn2tteBv5AfdDaEw8OLYVgGQhdNMWljacTJ9QU+1eSIn+vMhjixs4+C
	 qBsEgDu4Y8fuImuEZ/eVClwexvpI8yQk2fghamJa+zErm7kgNXpmNKQWohQLEIGrkX
	 mdTLBkZKqbAvIHuRpz+jHnLQJPmsq4jiF+WBVdxpAPns68JJKIWTnKGlvfwdcpP798
	 hk/rECTlQBWIA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 88F8CC4160E; Thu,  8 Jan 2026 21:56:25 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220936] ASMedia ASM4242 USB 3.2 xHCI Controller gives command
 timeout
Date: Thu, 08 Jan 2026 21:56:25 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: stuart.a.hayhurst@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220936-208809-G5AFejeysA@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220936-208809@https.bugzilla.kernel.org/>
References: <bug-220936-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220936

--- Comment #1 from Stuart Hayhurst (stuart.a.hayhurst@gmail.com) ---
After the error is thrown the USB 4 ports attached completely stop working,=
 and
don't recognise anything plugged in.

Before the error is thrown, it still seems very unhappy.

Mice and keyboards are basically non-functional. Both devices tested were
Logitech HID++ peripherals (G502 mouse, G915 TKL keyboard), and took ~10
seconds to be completely detected / initialised by hid-logitech-hidpp.
Afterwards, the keyboard is totally unresponsive, and the mouse position
updates every now and then. Normally, the HID++ part would be initialised
immediately after being interacted with, and be completely smooth.

USB storage devices (and NVMes over Thunderbolt) take a long time to open f=
or
benchmarking, but afterwards their throughput is as expected.

The controller will also complain with errors in the format of `[  293.9220=
68]
xhci_hcd 0000:77:00.0: bad transfer trb length 13 in event trb` when a devi=
ce
is plugged in, but the size seems to vary.

I tried looking for firmware updates, but MSI doesn't seem to have published
any. `fwupdmgr get-devices` reports the current version as `200011.240802`.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

