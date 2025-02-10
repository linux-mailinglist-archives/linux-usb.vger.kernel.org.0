Return-Path: <linux-usb+bounces-20430-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CC2BFA2FB5C
	for <lists+linux-usb@lfdr.de>; Mon, 10 Feb 2025 22:05:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CDF9D7A170A
	for <lists+linux-usb@lfdr.de>; Mon, 10 Feb 2025 21:04:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21FCC158874;
	Mon, 10 Feb 2025 21:05:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bBOxndf8"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 944C22F2A;
	Mon, 10 Feb 2025 21:05:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739221504; cv=none; b=Zg7GwmwB0eGQddIA/JPqbfktafdYuZJBnFzESn9PvXoEqr21YYE82gIkAJb+z5kLK077TOHo7tg7mfnRZckEW/6nrIpgoCtUq+pt2vx9pPbauEUpOgy/pRahncCSNbqefKkb1kc5oXrBsylmlo5qeylYSds8s0NQGbr7Yc/2tRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739221504; c=relaxed/simple;
	bh=H+OSZPYB5GzlkibIe0hVkRQaX+5tWCe5DI8/VCXwxLI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=u09Wt/7aWdLdGxi1nNKmsjeinT3ol5A5MYB4rWDOEEz3abdDngc+4NFENyStblzFaHPVih8rZ1LIKmFpS9Op31952bSvvbzHQsaTdue0mCbOUw31Zn608x3kpzOZVN3rMKyEYgvelgDrfv9RZQ893PXGS+E/MmzmOf6P3j3nhgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bBOxndf8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF8A5C4CED1;
	Mon, 10 Feb 2025 21:05:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739221504;
	bh=H+OSZPYB5GzlkibIe0hVkRQaX+5tWCe5DI8/VCXwxLI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=bBOxndf8JAn5yFlC77VtND6QjcqCfGmDgfZ2Px5Rr3BvLR8p+20RtvxlQamKjxK8f
	 X1aWdF1HYVsrR8dahwqhnOn9cQ+Y8TvCToDoAk6mrmN2i3Nn72aJcZj5ytRG4APYVs
	 b0Qwt7ljHwVQSDvnTWaeD60OY5s6AvNI30/y0Mov/kJnOq4NngNnVUYsPAlJxZyLk3
	 6GPE8rr4MZ1dOQcgHK4XjuHM2lAsr14Q85izRvmJW4ePR9dAVxYZHXm01Bg4Bh8U0G
	 hyeMdHaWr+NFKrZGu4/ASTtBz1fCbdKjR/cagVfewPkvBdeMJRZNDY4K6A6KMRHfvi
	 +5+hPv5jnerbg==
Date: Mon, 10 Feb 2025 15:05:02 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Kenneth Crudup <kenny@panix.com>
Cc: ilpo.jarvinen@linux.intel.com, Bjorn Helgaas <bhelgaas@google.com>,
	Jian-Hong Pan <jhp@endlessos.org>, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?utf-8?B?TmlrbMSBdnMgS2/EvGVzxYZpa292cw==?= <pinkflames.linux@gmail.com>,
	Andreas Noever <andreas.noever@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Yehezkel Bernat <YehezkelShB@gmail.com>, linux-usb@vger.kernel.org
Subject: Re: PCI/ASPM: Fix L1SS saving (linus/master commit 7507eb3e7bfac)
Message-ID: <20250210210502.GA15655@bhelgaas>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b2abd254-d11f-4ef7-8664-b9e5a1409abc@panix.com>

[+cc Thunderbolt folks, original post
https://lore.kernel.org/r/04091f53-3c94-4533-ab48-e9296e6e2841@panix.com]

Wow, something about your platform or usage is really good at finding
these bugs ;)  The original post is a page fault in xe_display_pm_resume()
and this one a NULL pointer dereference in __tb_path_deactivate_hop().
You see these so frequently that I would think Google would find more
reports, but I don't see any, which makes me wonder if this is some
kind of memory corruption related to a driver on your system.

On Sat, Feb 08, 2025 at 07:47:10PM -0800, Kenneth Crudup wrote:
> Eh, NVM.
> 
> Just had another resume crash with it reverted:
> 
> ----
> <6>[69848.656985][T25549] CPU19 is up
> <6>[69848.666220][T25549] ACPI: PM: Waking up from system sleep state S4
> <6>[69848.693976][T25549] ACPI: EC: interrupt unblocked
> <4>[69848.704735][T25549] thunderbolt 0000:00:0d.2: 0:5: path does not end
> on a DP adapter, cleaning up
> <1>[69848.706322][T25549] BUG: kernel NULL pointer dereference, address:
> 0000000000000384
> <1>[69848.706324][T25549] #PF: supervisor read access in kernel mode
> <1>[69848.706325][T25549] #PF: error_code(0x0000) - not-present page
> <6>[69848.706326][T25549] PGD 0 P4D 0
> <4>[69848.706327][T25549] Oops: Oops: 0000 [#1] PREEMPT SMP
> <4>[69848.706330][T25549] CPU: 1 UID: 0 PID: 25549 Comm: systemd-sleep
> Tainted: G S   U     O       6.14.0-rc1-kenny+ #4
> <4>[69848.706332][T25549] Tainted: [S]=CPU_OUT_OF_SPEC, [U]=USER,
> [O]=OOT_MODULE
> <4>[69848.706332][T25549] Hardware name: Dell Inc. XPS 9320/0KNXGD, BIOS
> 2.18.1 12/24/2024
> <4>[69848.706333][T25549] RIP: 0010:__tb_path_deactivate_hop+0x25/0x220
> <4>[69848.706337][T25549] Code: 5d 5d c3 c3 90 55 48 89 e5 41 57 41 56 41 55
> 41 54 53 48 83 ec 18 89 55 c4 65 48 8b 04 25 28 00 00 00 48 89 45 d0 48 8b
> 47 20 <80> b8 84 03 00 00 00 0f 85 64 01 00 00 8b 90 04 03 00 00 44 8d 2c
> <4>[69848.706338][T25549] RSP: 0000:ffffa2d40a9fb7f8 EFLAGS: 00010292
> <4>[69848.706339][T25549] RAX: 0000000000000000 RBX: 0000000000000001 RCX:
> 0000000000000002
> <4>[69848.706340][T25549] RDX: 000000000000000e RSI: 00000000a863e150 RDI:
> ffffa2d400803b00
> <4>[69848.706340][T25549] RBP: ffffa2d40a9fb838 R08: 0000000000000000 R09:
> ffffffffa9a55760
> <4>[69848.706341][T25549] R10: 0000000000000000 R11: 0000000000000000 R12:
> ffff8d1fc6bce7c0
> <4>[69848.706341][T25549] R13: 0000000000000028 R14: ffff8d1fc1861000 R15:
> ffff8d1fc18513e8
> <4>[69848.706342][T25549] FS:  00007fb5b3631940(0000)
> GS:ffff8d272f440000(0000) knlGS:0000000000000000
> <4>[69848.706343][T25549] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> <4>[69848.706343][T25549] CR2: 0000000000000384 CR3: 00000003cea00003 CR4:
> 0000000000770ef0
> <4>[69848.706344][T25549] PKRU: 55555554
> <4>[69848.706344][T25549] Call Trace:
> <4>[69848.706345][T25549]  <TASK>
> <4>[69848.706348][T25549]  ? show_regs.part.0+0x1d/0x20
> <4>[69848.706351][T25549]  ? __die+0x52/0x91
> <4>[69848.706352][T25549]  ? page_fault_oops+0x9a/0x220
> <4>[69848.706354][T25549]  ? exc_page_fault+0x2fc/0x5c0
> <4>[69848.706357][T25549]  ? asm_exc_page_fault+0x27/0x30
> <4>[69848.706359][T25549]  ? __tb_path_deactivate_hop+0x25/0x220
> <4>[69848.706360][T25549]  __tb_path_deactivate_hops+0x37/0x60
> <4>[69848.706361][T25549]  tb_path_deactivate+0x1e/0x110
> <4>[69848.706362][T25549]  tb_tunnel_deactivate+0x65/0x120
> <4>[69848.706363][T25549]  tb_tunnel_discover_dp+0x373/0x670
> <4>[69848.706364][T25549]  tb_switch_discover_tunnels+0x71/0x1e0
> <4>[69848.706366][T25549]  tb_resume_noirq+0x91/0x2a0
> <4>[69848.706368][T25549]  tb_domain_resume_noirq+0x3f/0x60
> <4>[69848.706369][T25549]  nhi_resume_noirq+0x34/0x90
> <4>[69848.706370][T25549]  pci_pm_restore_noirq+0x71/0xc0
> <4>[69848.706372][T25549]  ? new_id_store+0x1b0/0x1b0
> <4>[69848.706373][T25549]  dpm_run_callback+0x40/0xb0
> <4>[69848.706375][T25549]  device_resume_noirq+0xc4/0x2a0
> <4>[69848.706376][T25549]  dpm_noirq_resume_devices+0x11b/0x150
> <4>[69848.706376][T25549]  dpm_resume_start+0xc/0x30
> <4>[69848.706377][T25549]  hibernation_snapshot+0x26d/0x430
> <4>[69848.706379][T25549]  hibernate.cold+0x9c/0x333
> <4>[69848.706380][T25549]  state_store+0xbe/0xc0
> <4>[69848.706381][T25549]  kobj_attr_store+0xf/0x20
> <4>[69848.706383][T25549]  sysfs_kf_write+0x34/0x40
> <4>[69848.706385][T25549]  kernfs_fop_write_iter+0x134/0x1e0
> <4>[69848.706386][T25549]  vfs_write+0x244/0x410
> <4>[69848.706388][T25549]  ksys_write+0x63/0xd0
> <4>[69848.706389][T25549]  __x64_sys_write+0x14/0x20
> <4>[69848.706390][T25549]  x64_sys_call+0x9eb/0xa00
> <4>[69848.706392][T25549]  do_syscall_64+0x63/0xf0
> <4>[69848.706394][T25549]  ? do_filp_open+0xbe/0x170
> <4>[69848.706395][T25549]  ? do_wp_page+0x7f3/0xe80
> <4>[69848.706398][T25549]  ? ___pte_offset_map+0x17/0xe0
> <4>[69848.706399][T25549]  ? __handle_mm_fault+0xb13/0x1160
> <4>[69848.706400][T25549]  ? do_syscall_64+0x6f/0xf0
> <4>[69848.706401][T25549]  ? strncpy_from_user+0x25/0xf0
> <4>[69848.706402][T25549]  ? __count_memcg_events+0x49/0xe0
> <4>[69848.706403][T25549]  ? handle_mm_fault+0x181/0x2a0
> <4>[69848.706404][T25549]  ? irqentry_exit+0x4a/0x60
> <4>[69848.706405][T25549]  ? exc_page_fault+0x196/0x5c0
> <4>[69848.706406][T25549]  entry_SYSCALL_64_after_hwframe+0x4b/0x53
> <4>[69848.706407][T25549] RIP: 0033:0x7fb5b3526274
> <4>[69848.706411][T25549] Code: Unable to access opcode bytes at
> 0x7fb5b352624a.
> <4>[69848.706411][T25549] RSP: 002b:00007ffe667063f8 EFLAGS: 00000202
> ORIG_RAX: 0000000000000001
> <4>[69848.706412][T25549] RAX: ffffffffffffffda RBX: 0000000000000005 RCX:
> 00007fb5b3526274
> <4>[69848.706413][T25549] RDX: 0000000000000005 RSI: 000055ae2380a030 RDI:
> 0000000000000007
> <4>[69848.706413][T25549] RBP: 00007ffe66706420 R08: 0000000000000000 R09:
> 0000000000000001
> <4>[69848.706414][T25549] R10: 0000000000000003 R11: 0000000000000202 R12:
> 0000000000000005
> <4>[69848.706414][T25549] R13: 000055ae2380a030 R14: 000055ae237f62a0 R15:
> 00007fb5b360fea0
> <4>[69848.706415][T25549]  </TASK>
> <4>[69848.706415][T25549] Modules linked in: vmw_vmci snd_soc_sof_sdw
> snd_soc_sdw_utils snd_sof_probes iwlmvm mei_hdcp mei_pxp mac80211
> snd_sof_pci_intel_tgl snd_sof_pci_intel_cnl snd_sof_intel_hda_generic
> snd_sof_pci soundwire_intel soundwire_generic_allocation soundwire_cadence
> snd_sof_intel_hda_common snd_soc_hdac_hda iwlwifi btusb
> snd_sof_intel_hda_mlink btintel snd_sof_intel_hda cfg80211 mei_me ov01a10 xe
> drm_ttm_helper gpu_sched drm_suballoc_helper drm_gpuvm drm_exec i915
> drm_buddy intel_gtt drm_display_helper cec ttm
> <4>[69848.706433][T25549] CR2: 0000000000000384
> <4>[69848.706435][T25549] ---[ end trace 0000000000000000 ]
> ----
> 
> On 2/8/25 12:56, Kenneth Crudup wrote:
> > 
> > Guys, I don't think this commit is right; I've had 2 out of three resume
> > failures since this change went into Linus' master. I've attached a
> > pstore dump of the latest crash, and while it appears to be coming from
> > the Intel XE driver, 95% of my (s0ix) resumes worked previously[1]
> > before this change.
> > 
> > LMK if you need more information.
> > 
> > -Kenny
> > 
> > [1] - unless I forget to detach my NVMe USB4 external drive before
> > suspending, which is a breakage that appears to have gone in sometime
> > around the 6.10 series, but I haven't been able to bisect it
> 
> -- 
> Kenneth R. Crudup / Sr. SW Engineer, Scott County Consulting, Orange County
> CA
> 

