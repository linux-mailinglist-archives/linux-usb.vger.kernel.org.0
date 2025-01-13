Return-Path: <linux-usb+bounces-19238-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 95924A0B484
	for <lists+linux-usb@lfdr.de>; Mon, 13 Jan 2025 11:26:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AB5F6164C9D
	for <lists+linux-usb@lfdr.de>; Mon, 13 Jan 2025 10:26:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2872E21ADB6;
	Mon, 13 Jan 2025 10:26:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mNPA8ArT"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A48E81FDA65
	for <linux-usb@vger.kernel.org>; Mon, 13 Jan 2025 10:26:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736764011; cv=none; b=PG0FvYN2xsQ866VfjxBubY/GhhSX78/2XUW7Y21bSQ/Q1SSTH7cGcGSYugis3/treM1xyV58SRrvT5lteV36YtTBFzKNfFWI7oPenEDpy0INeC7OOB2KFOK/xTmuhz9jPTasHXdTZxDKuW3sDMP6Q2tQZrTQP4WWoKCJqKNAjCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736764011; c=relaxed/simple;
	bh=dLFCXqlCwbpo/CBdK4rNYEXhwjF9t+orf2q2/1kLpbY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=DeB3IcgG3Xm54nunZ7XUzQdE5xT3ixHgj1kLPLX3IV0AmbxGOakRfSIsj11Tkw5HvPM4tkUS0anohJjoeS0OAjhxs5xSplqSijpTJqFAyu/gfhptQ/mzSwIRObWRzN4pkN3aeab1KR5paSEurEwhyXoL0kL85Fk4pjnW7GQlJFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mNPA8ArT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6BAD7C4CED6
	for <linux-usb@vger.kernel.org>; Mon, 13 Jan 2025 10:26:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736764011;
	bh=dLFCXqlCwbpo/CBdK4rNYEXhwjF9t+orf2q2/1kLpbY=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=mNPA8ArTpt5DSWaECsMsH9qzXRqrtbWWnF8uHXRtgJUDVTjTCi4tAX93bcE3nJ68L
	 BME7hvBrUSgzxZbUEPCa/qRCTO7G7SBnLe/4ZSgct81lDXRmQwmD9VrvGODxcNRSGn
	 JkXFgsy/hzcRYDGfeaHErmSPRIib/xn5hpsvhxK9Fe/X1ynYe7oN3FrdQU8kltsRha
	 I0tH9zPghpwpAJtMbRO2mx+0i0IwDBEv1zkWr+9oe7N1TmFk3hZshdig+seMLI3Yuo
	 TQ9vTpQp/L5ypj9iv6wSujnlAw1lTzMb5aVz5lCmhBxhe4wVoaqXexGtB9DMeJsvUe
	 K3TXc+Ddk/x+Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 5B535C3279F; Mon, 13 Jan 2025 10:26:51 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219590] Linux 6.13 ucsi driver error:
 drivers/usb/typec/ucsi/ucsi.c:1374 ucsi_reset_ppm
Date: Mon, 13 Jan 2025 10:26:51 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: guido.iodice@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-219590-208809-0wjjWhuNlb@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219590-208809@https.bugzilla.kernel.org/>
References: <bug-219590-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219590

--- Comment #3 from Guido (guido.iodice@gmail.com) ---
Don't know how this is related=20

13.01.2025 10:51:35:637 kernel  ------------[ cut here ]------------
13.01.2025 10:51:35:637 kernel  workqueue: work disable count underflowed
13.01.2025 10:51:35:637 kernel  WARNING: CPU: 1 PID: 25 at
kernel/workqueue.c:4317 enable_work+0xdc/0x100
13.01.2025 10:51:35:637 kernel  Modules linked in:
13.01.2025 10:51:35:637 kernel  CPU: 1 UID: 0 PID: 25 Comm: cpuhp/1 Not tai=
nted
6.13.0-rc6-1-MANJARO #1 0ff203b605de2496cb4d97c5ea24b610f623d28d
13.01.2025 10:51:35:637 kernel  Hardware name: Dell Inc. Inspiron 5502/0WNV=
YK,
BIOS 1.33.1 11/15/2024
13.01.2025 10:51:35:637 kernel  RIP: 0010:enable_work+0xdc/0x100
13.01.2025 10:51:35:637 kernel  Code: de 2e 02 00 74 04 31 ed eb b3 48 c7 c=
7 60
9e 08 9a 48 89 54 24 10 89 44 24 0c 48 89 34 24 c6 05 45 de 2e 02 01 e8 64 =
5e
fd ff <0f> 0b 31 ed 48 8b 34 24 8b 44 24 0c 48 8b 54 24 10 eb 80 e8 4c cc
13.01.2025 10:51:35:637 kernel  RSP: 0000:ffff9aa8c01bfe10 EFLAGS: 00010086
13.01.2025 10:51:35:637 kernel  RAX: 0000000000000000 RBX: ffff8f6cbf4b1a40
RCX: 0000000000000003
13.01.2025 10:51:35:637 kernel  RDX: 0000000000000000 RSI: 0000000000000003
RDI: 0000000000000001
13.01.2025 10:51:35:637 kernel  RBP: ffff9aa8c01bfe28 R08: 0000000000000000
R09: ffff9aa8c01bfc90
13.01.2025 10:51:35:637 kernel  R10: ffffffff9aab5408 R11: 0000000000000003
R12: 00000000000000c4
13.01.2025 10:51:35:637 kernel  R13: ffffffff98be3b30 R14: 0000000000000000
R15: ffff8f6cbf4a1408
13.01.2025 10:51:35:637 kernel  FS:  0000000000000000(0000)
GS:ffff8f6cbf480000(0000) knlGS:0000000000000000
13.01.2025 10:51:35:637 kernel  CS:  0010 DS: 0000 ES: 0000 CR0:
0000000080050033
13.01.2025 10:51:35:637 kernel  CR2: 0000000000000000 CR3: 0000000330e22001
CR4: 0000000000f70ef0
13.01.2025 10:51:35:637 kernel  PKRU: 55555554
13.01.2025 10:51:35:637 kernel  Call Trace:
13.01.2025 10:51:35:637 kernel   <TASK>
13.01.2025 10:51:35:637 kernel   ? enable_work+0xdc/0x100
13.01.2025 10:51:35:637 kernel   ? __warn.cold+0x93/0xf6
13.01.2025 10:51:35:637 kernel   ? enable_work+0xdc/0x100
13.01.2025 10:51:35:637 kernel   ? report_bug+0xff/0x140
13.01.2025 10:51:35:637 kernel   ? handle_bug+0x58/0x90
13.01.2025 10:51:35:637 kernel   ? exc_invalid_op+0x17/0x70
13.01.2025 10:51:35:637 kernel   ? asm_exc_invalid_op+0x1a/0x20
13.01.2025 10:51:35:637 kernel   ? __pfx_vmstat_cpu_online+0x10/0x10
13.01.2025 10:51:35:637 kernel   ? enable_work+0xdc/0x100
13.01.2025 10:51:35:637 kernel   vmstat_cpu_online+0x61/0x70
13.01.2025 10:51:35:637 kernel   cpuhp_invoke_callback+0x11f/0x420
13.01.2025 10:51:35:637 kernel   ? __pfx_smpboot_thread_fn+0x10/0x10
13.01.2025 10:51:35:637 kernel   cpuhp_thread_fun+0xa2/0x170
13.01.2025 10:51:35:637 kernel   smpboot_thread_fn+0xda/0x1d0
13.01.2025 10:51:35:637 kernel   kthread+0xcf/0x100
13.01.2025 10:51:35:637 kernel   ? __pfx_kthread+0x10/0x10
13.01.2025 10:51:35:637 kernel   ret_from_fork+0x31/0x50
13.01.2025 10:51:35:637 kernel   ? __pfx_kthread+0x10/0x10
13.01.2025 10:51:35:637 kernel   ret_from_fork_asm+0x1a/0x30
13.01.2025 10:51:35:637 kernel   </TASK>
13.01.2025 10:51:35:637 kernel  ---[ end trace 0000000000000000 ]---

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

