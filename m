Return-Path: <linux-usb+bounces-2908-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 38EB27ED1F3
	for <lists+linux-usb@lfdr.de>; Wed, 15 Nov 2023 21:24:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D69A21F27E5D
	for <lists+linux-usb@lfdr.de>; Wed, 15 Nov 2023 20:24:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70A83433DD;
	Wed, 15 Nov 2023 20:24:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Cdx5aNyy"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5B8A433C9
	for <linux-usb@vger.kernel.org>; Wed, 15 Nov 2023 20:24:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5E8EDC433CB
	for <linux-usb@vger.kernel.org>; Wed, 15 Nov 2023 20:24:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700079892;
	bh=UD583q+jMxaQuBHSecqZhvMtyFMVpNRn0F0x214xatU=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Cdx5aNyylsfuhqv3dFUvk1w3MG5Wpn5ipLhhpmAe9aTO0uDvpSrcyusY2CspugumF
	 9aQ22n+L0/7G1ULdRxMgOie3pfagbmTC7kTuH6eNceR+/WTkJqYbn8c6kRUCmW1mer
	 53QVUN/6QRiphRFkP0TMot0ddPLfAQVTcV5q36SLZ1sMm+Vuz6qbvRjwrR7D/qEQXE
	 zdstFvu4NRbKxuoyfyY7JgWjF08qp6ePlrAIQshCUb+68xNXjLdR3zWeope6diSnxf
	 CzuLT9MO5LEVtGX+Ii7vHu4Om3G5p6m9jby6aS4TJES2zrDmdofAJZojGoF7A1Pi0T
	 AkdCRBDj3XQ9Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 49991C53BC6; Wed, 15 Nov 2023 20:24:52 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 215740] kernel warning: DMA-API: xhci_hcd: cacheline tracking
 EEXIST, overlapping mappings aren't supported
Date: Wed, 15 Nov 2023 20:24:51 +0000
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
Message-ID: <bug-215740-208809-i0mgbqtEbn@https.bugzilla.kernel.org/>
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

--- Comment #12 from Ferry Toth (ferry.toth@elsinga.info) ---
Ah, ok I was looking at a stack trace from a more recent kernel. So, here to
add some more data points (2 different kernels):

This is with EVB LAN9514 plugged in while booting:

: ------------[ cut here ]------------
: DMA-API: dwc3 dwc3.0.auto: cacheline tracking EEXIST, overlapping mappings
aren't supported
: WARNING: CPU: 1 PID: 32 at kernel/dma/debug.c:602 add_dma_entry+0x1eb/0x2=
b0
: Modules linked in: mmc_block extcon_intel_mrfld sdhci_pci cqhci sdhci
led_class mmc_core intel_soc_pmic_mrfld btrfs libcrc32c xor zlib_deflate
zstd_compress raid6_pq
: CPU: 1 PID: 32 Comm: kworker/1:1 Not tainted
6.6.0-next-20231106-edison-acpi-standard+ #1
: Hardware name: Intel Corporation Merrifield/BODEGA BAY, BIOS 542
2015.01.21:18.19.48
: Workqueue: usb_hub_wq hub_event
: RIP: 0010:add_dma_entry+0x1eb/0x2b0
: Code: 0f 84 cc 00 00 00 4c 8b 67 50 4d 85 e4 75 03 4c 8b 27 e8 48 1f 68 0=
0 48
89 c6 4c 89 e2 48 c7 c7 80 04 3d a4 e8 76 fb f5 ff 90 <0f> 0b 90 90 48 85 e=
d 74
1a 48 c7 c7 68 84 35 a4 e8 f0 0c fd ff 8b
: RSP: 0000:ffffa5bb0021fab0 EFLAGS: 00010286
: RAX: 0000000000000000 RBX: 00000000ffffffff RCX: 00000000ffffdfff
: RDX: 0000000000000000 RSI: 00000000ffffffea RDI: 0000000000000001
: RBP: ffff9f50c122da80 R08: ffffffffa4738d08 R09: 00000000ffffdfff
: R10: ffffffffa4658d20 R11: ffffffffa4708d20 R12: ffff9f50c2879550
: R13: 0000000000000001 R14: 0000000000000202 R15: 00000000002047f8
: FS:  0000000000000000(0000) GS:ffff9f50fe300000(0000) knlGS:0000000000000=
000
: CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
: CR2: 00005647b6a03c0f CR3: 0000000009ce0000 CR4: 00000000001006f0
: Call Trace:
:  <TASK>
:  ? __warn+0x7e/0x130
:  ? add_dma_entry+0x1eb/0x2b0
:  ? report_bug+0x18e/0x1a0
:  ? handle_bug+0x3d/0x70
:  ? exc_invalid_op+0x18/0x70
:  ? asm_exc_invalid_op+0x1a/0x20
:  ? add_dma_entry+0x1eb/0x2b0
:  dma_map_page_attrs+0x105/0x280
:  ? __virt_addr_valid+0xe7/0x130
:  usb_hcd_map_urb_for_dma+0x3c2/0x500
:  usb_hcd_submit_urb+0x9b/0xb70
:  ? kmem_cache_alloc+0x20d/0x230
:  ? usb_hcd_link_urb_to_ep+0x72/0xa0
:  ? prepare_transfer+0x104/0x140
:  usb_start_wait_urb+0x60/0x160
:  usb_control_msg+0xe0/0x150
:  hub_ext_port_status+0x85/0x1b0
:  hub_event+0x1f7/0x1ba0
:  ? hub_activate+0x59b/0x8f0
:  process_one_work+0x136/0x2f0
:  ? __pfx_worker_thread+0x10/0x10
:  worker_thread+0x2ed/0x400
:  ? __pfx_worker_thread+0x10/0x10
:  kthread+0xd3/0x100
:  ? __pfx_kthread+0x10/0x10
:  ret_from_fork+0x2f/0x50
:  ? __pfx_kthread+0x10/0x10
:  ret_from_fork_asm+0x1a/0x30
:  </TASK>
: ---[ end trace 0000000000000000 ]---
: DMA-API: Mapped at:
:  debug_dma_map_page+0x68/0x100
:  dma_map_page_attrs+0x105/0x280
:  usb_hcd_map_urb_for_dma+0x3c2/0x500
:  usb_hcd_submit_urb+0x9b/0xb70
:  usb_start_wait_urb+0x60/0x160

This is after boot, plugging the EVM-USB2517, then plugging a mouse:

------------[ cut here ]------------
DMA-API: dwc3 dwc3.0.auto: cacheline tracking EEXIST, overlapping mappings
aren't supported
WARNING: CPU: 0 PID: 587 at kernel/dma/debug.c:568 add_dma_entry+0x1ed/0x280
Modules linked in: rfcomm bnep iptable_nat snd_sof_nocodec spi_pxa2xx_platf=
orm
dw_dmac snd_sof_pci_intel_tng snd_sof_pci snd_sof_intel_atom pwm_lpss_pci
pwm_lpss>
CPU: 0 PID: 587 Comm: kworker/0:3 Not tainted 6.1.55-edison-acpi-standard #1
Hardware name: Intel Corporation Merrifield/BODEGA BAY, BIOS 542
2015.01.21:18.19.48
Workqueue: usb_hub_wq hub_event
RIP: 0010:add_dma_entry+0x1ed/0x280
Code: ff 0f 84 97 00 00 00 4c 8b 67 50 4d 85 e4 75 03 4c 8b 27 e8 f5 a6 5a =
00
48 89 c6 4c 89 e2 48 c7 c7 10 ed 62 b8 e8 e3 ce f7 ff <0f> 0b 48 85 ed 0f 8=
5 4c
d3 >
RSP: 0018:ffffa3400066fae0 EFLAGS: 00010286
RAX: 0000000000000000 RBX: 00000000ffffffff RCX: 0000000000000000
RDX: 0000000000000002 RSI: ffffffffb8634309 RDI: 00000000ffffffff
RBP: ffff92a981295f00 R08: ffffffffb8937828 R09: 00000000ffffdfff
R10: ffffffffb8857840 R11: ffffffffb8907840 R12: ffff92a982ca37a0
R13: 0000000000000001 R14: 0000000000000206 R15: 00000000000b716f
FS:  0000000000000000(0000) GS:ffff92a9be200000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 000055bed6f3b078 CR3: 000000000e00c000 CR4: 00000000001006f0
Call Trace:
 <TASK>
 ? __warn+0x74/0xc0
 ? add_dma_entry+0x1ed/0x280
 ? report_bug+0xee/0x170
 ? prb_read_valid+0x12/0x20
 ? handle_bug+0x3c/0x70
 ? exc_invalid_op+0x14/0x70
 ? asm_exc_invalid_op+0x16/0x20
 ? add_dma_entry+0x1ed/0x280
 dma_map_page_attrs+0x101/0x270
 ? preempt_count_add+0x6b/0xa0
 ? preempt_count_add+0x6b/0xa0
 usb_hcd_map_urb_for_dma+0x410/0x570
 usb_hcd_submit_urb+0x97/0xb80
 ? hub_activate+0x2db/0x890
 ? hub_resume+0x2e/0xf0
 usb_start_wait_urb+0x60/0x160
 usb_control_msg+0xdc/0x140
 hub_ext_port_status+0x82/0x110
 hub_event+0x442/0x1840
 ? _raw_spin_unlock+0xd/0x30
 ? finish_task_switch.isra.0+0x89/0x260
 process_one_work+0x1d7/0x3a0
 worker_thread+0x48/0x3c0
 ? process_one_work+0x3a0/0x3a0
 kthread+0xe3/0x110
 ? kthread_complete_and_exit+0x20/0x20
 ret_from_fork+0x22/0x30
 </TASK>
---[ end trace 0000000000000000 ]---
DMA-API: Mapped at:
 debug_dma_map_page+0x64/0x100
 dma_map_page_attrs+0x101/0x270
 usb_hcd_map_urb_for_dma+0x410/0x570
 usb_hcd_submit_urb+0x97/0xb80
 usb_start_wait_urb+0x60/0x160

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

