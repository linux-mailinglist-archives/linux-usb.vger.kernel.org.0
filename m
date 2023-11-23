Return-Path: <linux-usb+bounces-3271-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 74C737F68A7
	for <lists+linux-usb@lfdr.de>; Thu, 23 Nov 2023 22:27:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8AB531C20B50
	for <lists+linux-usb@lfdr.de>; Thu, 23 Nov 2023 21:27:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63516156C9;
	Thu, 23 Nov 2023 21:27:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O/zgkhz7"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9D2A154A8
	for <linux-usb@vger.kernel.org>; Thu, 23 Nov 2023 21:27:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2E597C433CB
	for <linux-usb@vger.kernel.org>; Thu, 23 Nov 2023 21:27:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700774827;
	bh=qDIhtfcrbqNZCvk+fx9EUS3ujU6mx9OfbSRWWft6Ei8=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=O/zgkhz7m6R9yjOUk2ZdfqbseU2ZXA3Z7m7nXJk/pEU0E8+j3kAWNeiMzHPOslj8X
	 KRMBOECriNDGTL97jBMZc4lfGKt/fI8OgMt/gAJuX/53J8HfTgSrnftMYUf+ZMHu4q
	 R0+UZn5NUtvwwG2amX5iVwkjrys6UvozEF6RgKanAxVzWOdUrKXdbguH1unY5GLwUI
	 lopM2SeQVOzRFlF+e/4ssauCRqf6b1V4TfQxckPasdW0TsCF/ZCy5FGBp5mMTth+5M
	 6vOKqwchTn7Au9uRyatVNMsa6QMBwWvtqELjqfhQ23QbgtYxT+QB0NH+XelrvH12zj
	 iDCFQVM1i1M5g==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 1B888C53BD5; Thu, 23 Nov 2023 21:27:07 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 215740] kernel warning: DMA-API: xhci_hcd: cacheline tracking
 EEXIST, overlapping mappings aren't supported
Date: Thu, 23 Nov 2023 21:27:06 +0000
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
Message-ID: <bug-215740-208809-Xf0V58dyrt@https.bugzilla.kernel.org/>
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

--- Comment #20 from Ferry Toth (ferry.toth@elsinga.info) ---
It's not a conflict or so, I am getting (using qgit or cli):
git am --signoff /home/ferry/Downloads/dma-dbg.patch
Patch format detection failed.

when I add --patch-format=3Dmbox I get:
\Applying: @@ -, +, @@
fatal: empty ident name (for <>) not allowed

Never had this before.

I am testing on Intel Merrifield (Edison Arduino):

root@yuna:~# lsusb -t=20
/:  Bus 02.Port 1: Dev 1, Class=3Droot_hub, Driver=3Dxhci-hcd/1p, 5000M
/:  Bus 01.Port 1: Dev 1, Class=3Droot_hub, Driver=3Dxhci-hcd/1p, 480M
    |__ Port 1: Dev 2, If 0, Class=3DHub, Driver=3Dhub/7p, 480M
        |__ Port 1: Dev 3, If 0, Class=3DHuman Interface Device, Driver=3Du=
sbhid,
1.5M

But root_hub 5000M is not available due to no phy.

With Diagnostic to find DMA overlap attachment 305456

------------[ cut here ]------------
DMA-API: dwc3 dwc3.0.auto: cacheline tracking EEXIST, overlapping mappings
aren't supported
WARNING: CPU: 0 PID: 105 at kernel/dma/debug.c:608 add_dma_entry+0x1fc/0x370
Modules linked in: rfcomm iptable_nat bnep snd_sof_nocodec spi_pxa2xx_platf=
orm
dw_dmac brcmfmac_wcc pwm_lpss_pci pwm_lpss snd_sof_pci_intel_tng
intel_mrfld_pwrbtn snd_sof_pci snd_sof_intel_atom intel_mrfld_adc snd_sof
dw_dmac_pci snd_sof_utils snd_sof_xtensa_dsp dw_dmac_core snd_intel_dspcfg
snd_soc_acpi spi_pxa2xx_pci brcmfmac brcmutil hci_uart leds_gpio btbcm
ti_ads7950 tun ledtrig_timer ledtrig_heartbeat mmc_block extcon_intel_mrfld
sdhci_pci cqhci sdhci led_class mmc_core intel_soc_pmic_mrfld btrfs libcrc3=
2c
xor zlib_deflate zstd_compress raid6_pq
CPU: 0 PID: 105 Comm: kworker/0:3 Not tainted 6.6.0-edison-acpi-standard+ #1
Hardware name: Intel Corporation Merrifield/BODEGA BAY, BIOS 542
2015.01.21:18.19.48
Workqueue: usb_hub_wq hub_event
RIP: 0010:add_dma_entry+0x1fc/0x370
Code: ff 0f 84 80 01 00 00 4c 8b 67 50 4d 85 e4 75 03 4c 8b 27 e8 e6 9d 6a =
00
48 89 c6 4c 89 e2 48 c7 c7 10 21 5a b1 e8 94 a5 f5 ff <0f> 0b 48 85 db 74 1=
a 48
c7 c7 44 18 53 b1 e8 01 f9 fc ff 8b 73 4c
RSP: 0000:ffffb63c403fbab0 EFLAGS: 00010286
RAX: 0000000000000000 RBX: ffff908001374f00 RCX: 0000000000000027
RDX: ffff90803e21c5c8 RSI: 0000000000000001 RDI: ffff90803e21c5c0
RBP: 000000000019d4b5 R08: ffffffffb19431e8 R09: 00000000ffffdfff
R10: ffffffffb1863200 R11: ffffffffb1913200 R12: ffff908002124860
R13: 0000000000000001 R14: 0000000000000202 R15: 000000000019d4b5
FS:  0000000000000000(0000) GS:ffff90803e200000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007fd58c003000 CR3: 0000000008096000 CR4: 00000000001006f0
Call Trace:
 <TASK>
 ? __warn+0x84/0x140
 ? add_dma_entry+0x1fc/0x370
 ? report_bug+0x199/0x1b0
 ? handle_bug+0x3c/0x70
 ? exc_invalid_op+0x18/0x70
 ? asm_exc_invalid_op+0x1a/0x20
 ? add_dma_entry+0x1fc/0x370
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
 process_one_work+0x139/0x2f0
 ? __pfx_worker_thread+0x10/0x10
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
DMA-API: Overlapped entry: 108342600 size 1
DMA-API: Mapped at:
 debug_dma_map_page+0x6d/0x100
 dma_map_page_attrs+0x10a/0x280
 usb_hcd_map_urb_for_dma+0x46f/0x650
 usb_hcd_submit_urb+0xa0/0xaa0
 hub_activate+0x29c/0x890
Map error: 108342608 108342608 len 4
Map error: 108342608 108342608 len 4
usb 1-1.1: new low-speed USB device number 3 using xhci-hcd
Map error: 108342608 108342608 len 4
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

I also notice now on unplugging the mouse:

Map error: 108342608 108342608 len 4
usb 1-1.1: USB disconnect, device number 3
Map error: 108342608 108342608 len 4
Map error: 108342608 108342608 len 4
Map error: 108342608 108342608 len 4
Map error: 108342608 108342608 len 4
Map error: 108342608 108342608 len 4

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

