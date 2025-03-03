Return-Path: <linux-usb+bounces-21269-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E598A4C068
	for <lists+linux-usb@lfdr.de>; Mon,  3 Mar 2025 13:33:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B6C81171466
	for <lists+linux-usb@lfdr.de>; Mon,  3 Mar 2025 12:33:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6B50200BB7;
	Mon,  3 Mar 2025 12:33:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=panix.com header.i=@panix.com header.b="r3oI6/G2"
X-Original-To: linux-usb@vger.kernel.org
Received: from mailbackend.panix.com (mailbackend.panix.com [166.84.1.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17CB81F5402
	for <linux-usb@vger.kernel.org>; Mon,  3 Mar 2025 12:33:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=166.84.1.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741005193; cv=none; b=W6Kn+p4ZYbvh3129x8XAhX4RgSi7cos13wG7nIF4Ks00MDF9477AnbIH/5A+EFyWcj1dUTcIxeEOFLJBEfBxlhPRH+u1JXqRj0StaUaGE9S6dVtYSpgqGY4+54Zw7QBxqN423JDcijeuGl2cQb/7M8rjnygzFa84vBjwiWOd1uU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741005193; c=relaxed/simple;
	bh=237cl5wMEq4dbCoLZYEqgU5a0dGLwSXRIVNkZEtoFKY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nhlHa177zqMZ2EV0/lIPz0C5d9oHHpcxXf7Gafrko0ZBYmvQ2uWLWUg8QqA+QXJJFnGw32+uzs4mbV75LgP6AvuzcIvewqeTN7/xd4eoce9puNFvNeZgU/2b7AbluRD7kASnbTrzaa9fVDcQqCr+y1hUkRo1z+A9xUueDOv4qgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=panix.com; spf=pass smtp.mailfrom=panix.com; dkim=pass (1024-bit key) header.d=panix.com header.i=@panix.com header.b=r3oI6/G2; arc=none smtp.client-ip=166.84.1.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=panix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=panix.com
Received: from [192.168.126.189] (ip72-219-82-239.oc.oc.cox.net [72.219.82.239])
	by mailbackend.panix.com (Postfix) with ESMTPSA id 4Z5ys12nlXz4txV;
	Mon,  3 Mar 2025 07:33:09 -0500 (EST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=panix.com; s=panix;
	t=1741005189; bh=237cl5wMEq4dbCoLZYEqgU5a0dGLwSXRIVNkZEtoFKY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=r3oI6/G2anQdbFYnRZe2HnHQT+ELQinxJpSBz4iaE28T/F89lIYI90aECjRKBX7Hc
	 Yxe/YwHrRn3cIG9JQRRDvVCwjD+px45pcy/CAcw1LTB0Yzqlq2lFrWn1UsrRfIIoA2
	 BZCC1MHGLlOWl2KC0wpYeXF1eVIZTExLKE+GU1Gc=
Message-ID: <68cec31a-0132-43bd-8a61-29e0ac23b326@panix.com>
Date: Mon, 3 Mar 2025 04:33:08 -0800
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: So, I had to revert d6d458d42e1 ("Handle DisplayPort tunnel
 activation asynchronously") too, to stop my resume crashes
To: Mika Westerberg <mika.westerberg@linux.intel.com>, Me <kenny@panix.com>
Cc: linux-usb@vger.kernel.org
References: <8e175721-806f-45d6-892a-bd3356af80c9@panix.com>
 <bd731ba2-5509-44e6-a419-814ef5329bbd@panix.com>
 <992dba2a-4919-4f76-ac48-986792d5843c@panix.com>
 <2b55ab09-8389-4916-8acc-abc73f234d21@panix.com>
 <20250303104618.GP3713119@black.fi.intel.com>
 <f31309e4-6ce5-48cf-910e-cd74f818aac8@panix.com>
 <20250303112149.GS3713119@black.fi.intel.com>
 <d56fcd99-433e-4670-8388-7035812a78d9@panix.com>
 <20250303115329.GT3713119@black.fi.intel.com>
Content-Language: en-US
From: Kenneth Crudup <kenny@panix.com>
In-Reply-To: <20250303115329.GT3713119@black.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


OK, I may not be explaining the history properly, so more background:

(I tend to run Linus' master that I pull every few days, partially 
'cause I like to see all the new fixes and features, and partially 
'cause over the years I'll stumble over bugs and help the subsystems' 
Maintainer(s) fix the problems.)

Anyway, late last year I'd notice lately (it wasn't happening before) 
that once I'd get to the office, my laptop would be hard-hung on resume, 
which I eventually traced back to having my NVMe adaptor connected to my 
TB Dock when I suspended/hibernated. I'd started to try to bisect it, 
but couldn't find a good starting point (or one too far back) and would 
have to give up 'cause I'd run out of time. However, I'd mention the 
issue in the mailing lists, hoping for a solution- and that's when you'd 
discovered 9d573d19.

But between your NVMe discovery (and by this time I was mostly :( 
careful about disconnecting the NVMe adaptor before suspend) and 
sometime around the beginning of the year I was also getting occasional 
hard-hangs on resume even if I hadn't had the NVMe adaptor connected on 
suspend. I'd seen where the pstore dumps were pointing to the display 
driver, so I'd switched back to the i915 from the xe driver, but that 
hadn't fixed it either. In the meantime, having seen one of the OOPses 
be in __tb_path_deactivate_hop(), I'd dropped some printks (actually 
"tb_port_info()", I think) at various points printing the line# so I 
could try and tell approximately where the crash occurred (yeah, I know 
I need to get my ksymoops up and running :) ). I hadn't made the 
correlation yet between having an external monitor connected or not, and 
having seen a number of xe/i915/dp/Thunderbolt changes come thru, was 
both hoping for the fix to be reported and corrected, or try and find 
time and find out why it was happening via my tracing.

So in late February we'd had two failure modes for me in Linus' master:
- 9d573d19 (NVMe adaptor connected on suspend causing an OOPS on resume)
- d6d458d4 (OOPS if external USB-C DP monitor connected on resume)

I couldn't/didn't recognize the 2nd issue fully until you'd discovered 
the cause of the first one.

At home I have a Samsung Odyssey monitor connected to a USB-C-to-DP 2.1 
cable, to a TB port on a CalDigit TB4 dock.

My travel bag has a generic Chinese USB-C DP tunneling portable monitor 
which is usually connected to a Plugable TB hub.

In any case, the resume failures happen with either one.

On 3/3/25 03:53, Mika Westerberg wrote:

> I thought the system resumes fine after you reverted the other commit
> (9d573d19), no? Just you don't get display tunneled so for example if you
> login over ethernet (ssh) you should still be able to get full dmesg.

Nah, it usually hard hangs if a monitor is connected when I resume; has 
to be power-cycled at that point.

> We can actually take PCIe out of the equation so that you ask "boltctl" to
> forget the device temporarily (or from the GNOME settings "privacy and
> security" -> "Thunderbolt" then "forget device" for each).  This means your
> docks do not work fully but display should and then we hopefully can get
> the dmesg.

Well my topology is almost always Laptop -> Dock -> Monitor .

This workflow came about ironically enough 'cause my client has given me 
a MS Surface (Windows) machine with only one TB/USB-C port, and since I 
will physically switch to using my own machine, to minimize setup 
changes I just use the "one cable for all" approach (i.e., never 
connecting the external monitor to the other TB port on my XPS-9320).

Oh and the failure mode for d6d458d4 is ALWAYS this, and always(?) from 
line 436/7 of ".../drivers/thunderbolt/path.c", a call to tb_port_write() :

----
<4>[  236.546634][ T4600] Oops: general protection fault, probably for 
non-canonical address 0xba65fbf27d6de496: 0000 [#1] PREEMPT SMP
<4>[  236.546646][ T4600] CPU: 7 UID: 0 PID: 4600 Comm: systemd-sleep 
Tainted: G S   U  W          6.14.0-rc4-kenny+ #10
<4>[  236.546655][ T4600] Tainted: [S]=CPU_OUT_OF_SPEC, [U]=USER, [W]=WARN
<4>[  236.546657][ T4600] Hardware name: Dell Inc. XPS 9320/0KNXGD, BIOS 
2.18.1 12/24/2024
<4>[  236.546660][ T4600] RIP: 0010:__tb_path_deactivate_hop+0x11/0x49a
<4>[  236.546673][ T4600] Code: f5 f5 db 00 5a 48 8d 65 e8 5b 41 5c 41 
5d 5d c3 b8 ed ff ff ff c3 0f 1f 00 55 48 89 e5 41 57 41 56 41 55 41 54 
53 48 83 ec 18 <4c> 8b 47 20 48 85 ff 65 4c 8b 34 25 28 00 00 00 4c 89 
75 d0 49 89
<4>[  236.546677][ T4600] RSP: 0018:ffffbe85080a77f0 EFLAGS: 00010286
<4>[  236.546682][ T4600] RAX: ffff957ee8373a20 RBX: 0000000000000000 
RCX: 0000000000000002
<4>[  236.546686][ T4600] RDX: 000000000000007d RSI: 0000000011000010 
RDI: ba65fbf27d6de476
<4>[  236.546689][ T4600] RBP: ffffbe85080a7830 R08: 0000000000000000 
R09: ffffffff84255760
<4>[  236.546691][ T4600] R10: 0000000000000000 R11: 0000000000000000 
R12: ffff957ee8373a00
<4>[  236.546693][ T4600] R13: 0000000000000000 R14: ffffbe85080a78a0 
R15: ffffbe85080a7820
<4>[  236.546696][ T4600] FS:  00007f2fcaa4a940(0000) 
GS:ffff9585af5c0000(0000) knlGS:0000000000000000
<4>[  236.546700][ T4600] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
<4>[  236.546703][ T4600] CR2: 0000000000000000 CR3: 00000001f0833002 
CR4: 0000000000770ef0
<4>[  236.546705][ T4600] PKRU: 55555554
<4>[  236.546707][ T4600] Call Trace:
<4>[  236.546710][ T4600]  <TASK>
<4>[  236.546713][ T4600]  ? show_regs.part.0+0x1d/0x20
<4>[  236.546722][ T4600]  ? die_addr.cold+0x8/0xd
<4>[  236.546729][ T4600]  ? exc_general_protection+0x1c0/0x490
<4>[  236.546740][ T4600]  ? asm_exc_general_protection+0x27/0x30
<4>[  236.546747][ T4600]  ? __tb_path_deactivate_hop+0x11/0x49a
<4>[  236.546754][ T4600]  __tb_path_deactivate_hops.cold+0x2e/0xaa
<4>[  236.546760][ T4600]  tb_path_deactivate+0x1e/0x110
<4>[  236.546769][ T4600]  tb_tunnel_deactivate+0x65/0x120
<4>[  236.546775][ T4600]  tb_resume_noirq+0xc2/0x2a0
<4>[  236.546779][ T4600]  tb_domain_resume_noirq+0x3f/0x60
<4>[  236.546787][ T4600]  nhi_resume_noirq+0x34/0x90
<4>[  236.546795][ T4600]  pci_pm_restore_noirq+0x71/0xc0
<4>[  236.546801][ T4600]  ? new_id_store+0x1b0/0x1b0
<4>[  236.546807][ T4600]  dpm_run_callback+0x40/0xb0
<4>[  236.546812][ T4600]  device_resume_noirq+0xc4/0x2a0
<4>[  236.546817][ T4600]  dpm_noirq_resume_devices+0x11b/0x150
<4>[  236.546822][ T4600]  dpm_resume_start+0xc/0x30
<4>[  236.546827][ T4600]  hibernation_snapshot+0x26d/0x430
<4>[  236.546835][ T4600]  hibernate.cold+0x9c/0x333
<4>[  236.546840][ T4600]  state_store+0xbe/0xc0
<4>[  236.546845][ T4600]  kobj_attr_store+0xf/0x20
<4>[  236.546854][ T4600]  sysfs_kf_write+0x34/0x40
<4>[  236.546861][ T4600]  kernfs_fop_write_iter+0x134/0x1e0
<4>[  236.546868][ T4600]  vfs_write+0x244/0x410
<4>[  236.546878][ T4600]  ksys_write+0x63/0xd0
<4>[  236.546885][ T4600]  __x64_sys_write+0x14/0x20
<4>[  236.546892][ T4600]  x64_sys_call+0x9eb/0xa00
<4>[  236.546899][ T4600]  do_syscall_64+0x63/0xf0
<4>[  236.546906][ T4600]  ? do_syscall_64+0x6f/0xf0
<4>[  236.546913][ T4600]  ? do_filp_open+0xbe/0x170
<4>[  236.546919][ T4600]  ? from_kgid_munged+0xd/0x20
<4>[  236.546924][ T4600]  ? cp_new_stat+0x14a/0x180
<4>[  236.546931][ T4600]  ? do_wp_page+0x7f3/0xe80
<4>[  236.546936][ T4600]  ? ___pte_offset_map+0x17/0xe0
<4>[  236.546944][ T4600]  ? __handle_mm_fault+0xb13/0x1160
<4>[  236.546951][ T4600]  ? __count_memcg_events+0x49/0xe0
<4>[  236.546956][ T4600]  ? handle_mm_fault+0x181/0x2a0
<4>[  236.546961][ T4600]  ? irqentry_exit+0x4a/0x60
<4>[  236.546964][ T4600]  ? exc_page_fault+0x196/0x5c0
<4>[  236.546972][ T4600]  entry_SYSCALL_64_after_hwframe+0x4b/0x53
<4>[  236.546977][ T4600] RIP: 0033:0x7f2fca926274
<4>[  236.546984][ T4600] Code: c7 00 16 00 00 00 b8 ff ff ff ff c3 66 
2e 0f 1f 84 00 00 00 00 00 f3 0f 1e fa 80 3d f5 2d 0f 00 00 74 13 b8 01 
00 00 00 0f 05 <48> 3d 00 f0 ff ff 77 54 c3 0f 1f 00 55 48 89 e5 48 83 
ec 20 48 89
<4>[  236.546987][ T4600] RSP: 002b:00007ffec678fb58 EFLAGS: 00000202 
ORIG_RAX: 0000000000000001
<4>[  236.546992][ T4600] RAX: ffffffffffffffda RBX: 0000000000000005 
RCX: 00007f2fca926274
<4>[  236.546994][ T4600] RDX: 0000000000000005 RSI: 000055f4304eb730 
RDI: 0000000000000007
<4>[  236.546996][ T4600] RBP: 00007ffec678fb80 R08: 0000000000000000 
R09: 0000000000000001
<4>[  236.546998][ T4600] R10: 000055f4304eb720 R11: 0000000000000202 
R12: 0000000000000005
<4>[  236.547000][ T4600] R13: 000055f4304eb730 R14: 000055f4304e12a0 
R15: 00007f2fcaa0fea0
<4>[  236.547004][ T4600]  </TASK>
<4>[  236.547006][ T4600] Modules linked in: vmw_vmci btusb btintel 
snd_soc_sof_sdw snd_soc_sdw_utils snd_sof_probes iwlmvm mei_hdcp mei_pxp 
mac80211 snd_sof_pci_intel_tgl snd_sof_pci_intel_cnl 
snd_sof_intel_hda_generic snd_sof_pci soundwire_intel 
soundwire_generic_allocation soundwire_cadence snd_sof_intel_hda_common 
snd_soc_hdac_hda iwlwifi snd_sof_intel_hda_mlink snd_sof_intel_hda 
mei_me cfg80211 ov01a10 xe drm_ttm_helper gpu_sched drm_suballoc_helper 
drm_gpuvm drm_exec i915 drm_buddy intel_gtt drm_display_helper cec ttm
<4>[  236.547061][ T4600] ---[ end trace 0000000000000000 ]---
----

-Kenny

-- 
Kenneth R. Crudup / Sr. SW Engineer, Scott County Consulting, Orange 
County CA


