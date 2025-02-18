Return-Path: <linux-usb+bounces-20760-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CD3F8A3A5F6
	for <lists+linux-usb@lfdr.de>; Tue, 18 Feb 2025 19:44:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8AA163A9168
	for <lists+linux-usb@lfdr.de>; Tue, 18 Feb 2025 18:44:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6929D1EB5CD;
	Tue, 18 Feb 2025 18:44:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a7EJ/W9h"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC92A1EB5CB
	for <linux-usb@vger.kernel.org>; Tue, 18 Feb 2025 18:44:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739904246; cv=none; b=s8pBsjXhRAI4SN5+4ajEhV3A64aqwj5YZxaeT8bcsI7qGOGoKMLcLyuSWGQ/Z6C45qh+obQ7MsI8XkJJTdX/fwz23HzxhLwuMkL19010uXlhifvevXB5v3Q6644/L/D/u+AXv9/nto1zFzK0awvK/I0q5+h2EvImfUlXveoa8b4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739904246; c=relaxed/simple;
	bh=eJ4HWJD4W0KSmzglq8QCCWGQkiRicb2i+/ZU/ogRU90=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=H4EPMzBTgP/+VTsNZxjpHLupVR1/eilRhU3Ryp/2zfngtuhnYt0IuTT/QWjnST/SP0qOZO4QVejvCmvEI8dFfLgAmACMimmvymmowvjsmvfAmUUXVWOCquCJd0treNZ7ZcnJKpd55oMn2l5jb+44xHZT/sriboEZcUOM34NkOb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a7EJ/W9h; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4860FC4CEE9
	for <linux-usb@vger.kernel.org>; Tue, 18 Feb 2025 18:44:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739904246;
	bh=eJ4HWJD4W0KSmzglq8QCCWGQkiRicb2i+/ZU/ogRU90=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=a7EJ/W9h6dIYMm7v76zcdooDaLBm1ldV4tpwYHqNP3McEJhg2BkbJcGkkHHGH94QX
	 YaOtNiY7ltRjs8C89o6qghym+5HfBmicqocuynHUCgdVcqWL4987o12aPbq6OK5bnq
	 9ZrLtaOgLRrfxdGdqMCH44o2rc1bI8kLDcDrZQxTHNvrN8dHMz96m2rax+L4sjP0Vy
	 IKTkoQgQVYsWQjNiKa3BiXLz5PB62q5y2brMHIsUoWOQdvepLG7PG06MwlIUKNW/Dk
	 Tj0CCfhnxWrV+aWqyWmja+Dv168I3QJ6uLY1nmOxZ01S2/6YcbaRPnv05hSmlduFRt
	 mlZKrdS4WJCAQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 3609AC41614; Tue, 18 Feb 2025 18:44:06 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219590] Linux 6.13 ucsi driver error:
 drivers/usb/typec/ucsi/ucsi.c:1374 ucsi_reset_ppm
Date: Tue, 18 Feb 2025 18:44:05 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: tr.ml@gmx.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-219590-208809-YfBA5YhZNc@https.bugzilla.kernel.org/>
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

RockT (tr.ml@gmx.de) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |tr.ml@gmx.de

--- Comment #15 from RockT (tr.ml@gmx.de) ---
I see it in 6.14rc3:

[   11.560861] WARNING: CPU: 4 PID: 81 at drivers/usb/typec/ucsi/ucsi.c:1377
ucsi_reset_ppm+0x1ad/0x1c0 [typec_ucsi]
[   11.560897] Modules linked in: dm_crypt raid10 raid456 async_raid6_recov
async_memcpy async_pq async_xor async_tx xor raid6_pq raid1 raid0 linear
dm_mirror dm_region_hash dm_log hid_logitech_hidpp hid_logitech_dj hid_gene=
ric
usbhid hid polyval_clmulni rtsx_pci_sdmmc polyval_generic ghash_clmulni_int=
el
nvme thinkpad_acpi ucsi_acpi sha256_ssse3 sha1_ssse3 e1000e psmouse nvram
nvme_core rtsx_pci intel_lpss_pci typec_ucsi nvme_auth intel_lpss snd typec
idma64 soundcore sparse_keymap video platform_profile wmi pinctrl_cannonlake
aesni_intel crypto_simd cryptd
[   11.561052] CPU: 4 UID: 0 PID: 81 Comm: kworker/4:1 Not tainted
6.14.0-061400rc3-generic #202502181422
[   11.561064] Hardware name: LENOVO 20Q5CTO1WW/20Q5CTO1WW, BIOS R0ZET58W (=
1.36
) 02/22/2024
[   11.561072] Workqueue: events_long ucsi_init_work [typec_ucsi]
[   11.561096] RIP: 0010:ucsi_reset_ppm+0x1ad/0x1c0 [typec_ucsi]
[   11.561115] Code: ff 8b 55 bc 81 e2 00 00 00 08 0f 85 33 ff ff ff 4c 89 =
75
c8 48 8b 05 52 9d 10 dc 49 39 c5 79 94 b8 92 ff ff ff e9 19 ff ff ff <0f> 0=
b e9
57 ff ff ff e8 e7 28 01 db 0f 1f 80 00 00 00 00 90 90 90
[   11.561123] RSP: 0018:ffffad1600363d70 EFLAGS: 00010206
[   11.561134] RAX: 0000000008000000 RBX: ffff9e340ec78000 RCX:
0000000000000000
[   11.561141] RDX: 00000000fffb97aa RSI: 0000000000000000 RDI:
0000000000000000
[   11.561146] RBP: ffffad1600363dc0 R08: 0000000000000000 R09:
0000000000000000
[   11.561152] R10: 0000000000000000 R11: 0000000000000000 R12:
ffffad1600363d7c
[   11.561157] R13: 00000000fffb9797 R14: ffff9e340ec78020 R15:
ffff9e340ec780c0
[   11.561164] FS:  0000000000000000(0000) GS:ffff9e3b5e600000(0000)
knlGS:0000000000000000
[   11.561172] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   11.561178] CR2: 00005bd21fb4c028 CR3: 0000000170240004 CR4:
00000000003706f0
[   11.561186] DR0: 0000000000000000 DR1: 0000000000000000 DR2:
0000000000000000
[   11.561190] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7:
0000000000000400
[   11.561196] Call Trace:
[   11.561202]  <TASK>
[   11.561209]  ? show_trace_log_lvl+0x1be/0x310
[   11.561224]  ? show_trace_log_lvl+0x1be/0x310
[   11.561237]  ? ucsi_init+0x2bc/0x310 [typec_ucsi]
[   11.561257]  ? show_regs.part.0+0x22/0x30
[   11.561267]  ? show_regs.cold+0x8/0x10
[   11.561277]  ? ucsi_reset_ppm+0x1ad/0x1c0 [typec_ucsi]
[   11.561293]  ? __warn.cold+0xac/0x10c
[   11.561304]  ? ucsi_reset_ppm+0x1ad/0x1c0 [typec_ucsi]
[   11.561320]  ? report_bug+0x114/0x160
[   11.561332]  ? handle_bug+0x6e/0xb0
[   11.561343]  ? exc_invalid_op+0x18/0x80
[   11.561354]  ? asm_exc_invalid_op+0x1b/0x20
[   11.561369]  ? ucsi_reset_ppm+0x1ad/0x1c0 [typec_ucsi]
[   11.561386]  ? ucsi_send_command_common+0xa4/0x120 [typec_ucsi]
[   11.561404]  ucsi_init+0x2bc/0x310 [typec_ucsi]
[   11.561422]  ucsi_init_work+0x18/0x90 [typec_ucsi]
[   11.561439]  process_one_work+0x174/0x350
[   11.561456]  worker_thread+0x34a/0x480
[   11.561464]  ? _raw_spin_lock_irqsave+0xe/0x20
[   11.561478]  ? __pfx_worker_thread+0x10/0x10
[   11.561486]  kthread+0xf9/0x230
[   11.561497]  ? __pfx_kthread+0x10/0x10
[   11.561508]  ret_from_fork+0x44/0x70
[   11.561518]  ? __pfx_kthread+0x10/0x10
[   11.561527]  ret_from_fork_asm+0x1a/0x30
[   11.561545]  </TASK>
[   11.561549] ---[ end trace 0000000000000000 ]---
[   11.601285] ucsi_acpi USBC000:00: error -ETIMEDOUT: PPM init failed

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

