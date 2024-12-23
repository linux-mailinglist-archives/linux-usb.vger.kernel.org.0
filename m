Return-Path: <linux-usb+bounces-18743-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3927E9FB401
	for <lists+linux-usb@lfdr.de>; Mon, 23 Dec 2024 19:29:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9CD901660EE
	for <lists+linux-usb@lfdr.de>; Mon, 23 Dec 2024 18:29:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EC291C1F03;
	Mon, 23 Dec 2024 18:29:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Vy4DF0Hd"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC2F738F82
	for <linux-usb@vger.kernel.org>; Mon, 23 Dec 2024 18:29:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734978557; cv=none; b=f6NUBaLW2QAY0fy8zA+2LXIS70KPtAVLNt4VOczscyowQ7KPXt5f4N/NWJidrpyBBuPyekDRTwz2MOlkQbVGt3JO4QW63zrYEgDlBJ5lRpzrZRsQ/oqb8r0+kfDrFEY2TOPW1n4bGFVArEsTROs2MP6bzfvDXY0iVjT8c1hGoq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734978557; c=relaxed/simple;
	bh=psy7gy52t0orBAtAUVnh5MIFq4/pUGL0ujGa13mdgGc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=BX1XlhTejGNBRQsryYZaBBDnwdq/mLFkrnD44fQb4/sT2fwg59ows2/ZyrWlvLIr3JtcXfL9BHdCTkc4LVYe1NQ6bCOOmCgP04YecpfZrqFXEJO5MdSW1W3uxmZYOh/LRC0duc7l4/fP5vBHGLXGgIncpSVVMBif+9GFCG9l1Rw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Vy4DF0Hd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id BA893C4CEDF
	for <linux-usb@vger.kernel.org>; Mon, 23 Dec 2024 18:29:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734978556;
	bh=psy7gy52t0orBAtAUVnh5MIFq4/pUGL0ujGa13mdgGc=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Vy4DF0HdnNEdxflodpa/hfrlSYxPw0/hBfPcDGXivPjrUkCtqYUYRfo6ZbepR1a4Y
	 aJhdmmVcBnFRomAal9d7gBwoycdXmOePbVXdwMtIxZCVeHwjd1xC5mdzK13qiDouZu
	 lQvvmHj1YbM3k83yMv/hWOfNHoWTF0hDHWNXWUthDEknlmht0/0nnDD4banMgW+Yx4
	 1M/g/hK5cTMKR1RRLsCa0/5QU4SA5npPAEVaHoNkx9pe7Xg4oz6x2dTOFvx0GcEKgY
	 7sMKen0eg1DRIvSx37F5VZyjsF5QjT1yr10gKxKnI8vWJp49ZIiCLMb+boLD76xwJk
	 u+3XFj95WTbog==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id B29DFC3279E; Mon, 23 Dec 2024 18:29:16 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 215906] DMAR fault when connected usb hub (xhci_hcd)
Date: Mon, 23 Dec 2024 18:29:16 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: lists.rolf@reintjes.nrw
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-215906-208809-vumNQTU7Ob@https.bugzilla.kernel.org/>
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

--- Comment #27 from Rolf Reintjes (lists.rolf@reintjes.nrw) ---
(In reply to Micha=C5=82 Pecio from comment #26)
> Honestly, I don't know what's the problem. Maybe as a last ditch effort t=
ry
> dynamic debug, if your kernel supports it:
>=20
> echo 'func xhci_dbg_trace +p' >/proc/dynamic_debug/control
> rmmod xhci-pci
> modprobe xhci-pci
> echo 'func xhci_dbg_trace -p' >/proc/dynamic_debug/control
> dmesg |grep 'page size'
> [  262.117753] xhci_hcd 0000:08:00.0: Supported page size register =3D 0x1
> [  262.117755] xhci_hcd 0000:08:00.0: Supported page size of 8K
> [  262.117756] xhci_hcd 0000:08:00.0: HCD page size set to 4K
>=20
> BTW, don't worry about that 8K, this value is incorrectly calculated and
> then completely ignored.

rolf@i7-5820K-debian-testing1:~$ sudo dmesg |grep 'page size'
[    0.189774] HugeTLB: registered 1.00 GiB page size, pre-allocated 0 pages
[    0.189774] HugeTLB: registered 2.00 MiB page size, pre-allocated 0 pages
[  225.577885] xhci_hcd 0000:00:14.0: Supported page size register =3D 0x1
[  225.577887] xhci_hcd 0000:00:14.0: Supported page size of 8K
[  225.577888] xhci_hcd 0000:00:14.0: HCD page size set to 4K
[  225.584545] xhci_hcd 0000:05:00.0: Supported page size register =3D 0x1
[  225.584547] xhci_hcd 0000:05:00.0: Supported page size of 8K
[  225.584548] xhci_hcd 0000:05:00.0: HCD page size set to 4K
[  225.648450] xhci_hcd 0000:06:00.0: Supported page size register =3D 0x1
[  225.648452] xhci_hcd 0000:06:00.0: Supported page size of 8K
[  225.648453] xhci_hcd 0000:06:00.0: HCD page size set to 4K

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

