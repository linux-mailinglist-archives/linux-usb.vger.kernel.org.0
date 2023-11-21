Return-Path: <linux-usb+bounces-3133-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5434C7F36D2
	for <lists+linux-usb@lfdr.de>; Tue, 21 Nov 2023 20:32:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E9806B218B8
	for <lists+linux-usb@lfdr.de>; Tue, 21 Nov 2023 19:32:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D5205B20D;
	Tue, 21 Nov 2023 19:31:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LBU+QB5Q"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E55BE266D4
	for <linux-usb@vger.kernel.org>; Tue, 21 Nov 2023 19:31:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 73EF9C433CA
	for <linux-usb@vger.kernel.org>; Tue, 21 Nov 2023 19:31:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700595118;
	bh=n+aIDU1OBej+MpSS0O0Lf1lHb8wR5BCdhL3T7QiEjpw=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=LBU+QB5QJXYHB/H8axiXTn4Vx27/4PQlg7Zl1B2vZp7mBDsplMGG/l4opD3BxrnfT
	 2ab0tsy2OS4GOVCAtzhyBZZjpSsxXUoRH3WJ/j0dua5jzPh+kWg0jgaNg3vHWdCws3
	 9jINhWTCt6IvyTK+KjMqaKjq2R5UuklbxanReTgXclJzvmBKzXhQlxrWBfIuCtwMki
	 uyLZwAQ9sWrZRRZjr3Eg2HnDZRjTryrivC+DC0yyywd/FOVS1T9fm9dgU1Mg4jqyMg
	 4pG1oeY58GU+RrsPwe5lP/5iIndYrLEOoJeeW2uerNkGmW/w8iAi7exbonSKbud5CL
	 tipu/iP5W5ARQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 62635C53BD5; Tue, 21 Nov 2023 19:31:58 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 215740] kernel warning: DMA-API: xhci_hcd: cacheline tracking
 EEXIST, overlapping mappings aren't supported
Date: Tue, 21 Nov 2023 19:31:58 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: ferry.toth@elsinga.info
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-215740-208809-bdwYfbRTMX@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215740-208809@https.bugzilla.kernel.org/>
References: <bug-215740-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D215740

--- Comment #18 from Ferry Toth (ferry.toth@elsinga.info) ---
Hi Alan, would you know why your patches won't apply using git to v6.6? I f=
ixed
up manually. Results of Revised diagnostics attachment 305444 below:

------------[ cut here ]------------
DMA-API: dwc3 dwc3.0.auto: cacheline tracking EEXIST, overlapping mappings
aren't supported, len 4
WARNING: CPU: 0 PID: 7 at kernel/dma/debug.c:607 add_dma_entry+0x207/0x2c0
Modules linked in: rfcomm bnep iptable_nat snd_sof_nocodec spi_pxa2xx_platf=
orm
dw_dmac brcmfmac_wcc snd_sof_pci_intel_tng snd_sof_pci snd_sof_intel_atom
pwm_lpss>
CPU: 0 PID: 7 Comm: kworker/0:0 Not tainted 6.6.0-edison-acpi-standard+ #1
Hardware name: Intel Corporation Merrifield/BODEGA BAY, BIOS 542
2015.01.21:18.19.48
Workqueue: usb_hub_wq hub_event
RIP: 0010:add_dma_entry+0x207/0x2c0
Code: c8 00 00 00 4c 8b 67 50 4d 85 e4 75 03 4c 8b 27 e8 fe a3 6a 00 48 89 =
c6
4c 89 e9 4c 89 e2 48 c7 c7 a8 1d 9a 99 e8 69 ac f5 ff <0f> 0b 48 85 db 74 1=
a 48
c7 >
RSP: 0018:ffffa4de00043ab0 EFLAGS: 00010286
RAX: 0000000000000000 RBX: ffff9c5f01376e80 RCX: 0000000000000027
RDX: ffff9c5f3e21c5c8 RSI: 0000000000000001 RDI: ffff9c5f3e21c5c0
RBP: 00000000ffffffff R08: ffffffff99d431e8 R09: 00000000ffffdfff
R10: ffffffff99c63200 R11: ffffffff99d13200 R12: ffff9c5f012375f0
R13: 0000000000000004 R14: 0000000000000206 R15: 00000000001eb8d2
FS:  0000000000000000(0000) GS:ffff9c5f3e200000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f57691956b0 CR3: 000000003682e000 CR4: 00000000001006f0
Call Trace:
 <TASK>
 ? __warn+0x84/0x140
 ? add_dma_entry+0x207/0x2c0
 ? report_bug+0x199/0x1b0
 ? handle_bug+0x3c/0x70
 ? exc_invalid_op+0x18/0x70
 ? asm_exc_invalid_op+0x1a/0x20
 ? add_dma_entry+0x207/0x2c0
 dma_map_page_attrs+0x10a/0x280
 usb_hcd_map_urb_for_dma+0x46f/0x650
 usb_hcd_submit_urb+0xa0/0xaa0
 ? kick_hub_wq+0x69/0xf0
 ? hub_activate+0x2c3/0x890
 ? usb_disable_remote_wakeup+0x34/0x70
 usb_start_wait_urb+0x65/0x100
 usb_control_msg+0xe5/0x150
 hub_ext_port_status+0x8a/0x1b0
 hub_event+0x1d1/0x18e0
 ? trace_hardirqs_on+0x21/0x90
 process_one_work+0x139/0x2f0
 worker_thread+0x2f4/0x400
 ? __pfx_worker_thread+0x10/0x10
 kthread+0xe6/0x120
 ? __pfx_kthread+0x10/0x10
 ret_from_fork+0x34/0x50
 ? __pfx_kthread+0x10/0x10
 ret_from_fork_asm+0x1b/0x30
 </TASK>
---[ end trace 0000000000000000 ]---
DMA-API: Mapped at:
 debug_dma_map_page+0x6d/0x100
 dma_map_page_attrs+0x10a/0x280
 usb_hcd_map_urb_for_dma+0x46f/0x650
 usb_hcd_submit_urb+0xa0/0xaa0
 usb_start_wait_urb+0x65/0x100
Map error: 128857248 128857248 len 4
Map error: 128857248 128857248 len 4
usb 1-1.1: new low-speed USB device number 3 using xhci-hcd
Map error: 128857248 128857248 len 4
usb 1-1.1: New USB device found, idVendor=3D046d, idProduct=3Dc03e, bcdDevi=
ce=3D20.00
usb 1-1.1: New USB device strings: Mfr=3D1, Product=3D2, SerialNumber=3D0
usb 1-1.1: Product: USB-PS/2 Optical Mouse
usb 1-1.1: Manufacturer: Logitech
input: Logitech USB-PS/2 Optical Mouse as
/devices/pci0000:00/0000:00:11.0/dwc3.0.auto/xhci-hcd.1.auto/usb1/1-1/1-1.1=
/1-1.1:1.0/0003:046D:C03E.0001/input/input1
hid-generic 0003:046D:C03E.0001: input,hidraw0: USB HID v1.10 Mouse [Logite=
ch
USB-PS/2 Optical Mouse] on usb-xhci-hcd.1.auto-1.1/input0

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

