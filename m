Return-Path: <linux-usb+bounces-5776-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7673084756D
	for <lists+linux-usb@lfdr.de>; Fri,  2 Feb 2024 17:55:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B9877B23DE8
	for <lists+linux-usb@lfdr.de>; Fri,  2 Feb 2024 16:55:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DAC45B66F;
	Fri,  2 Feb 2024 16:55:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=schinagl.nl header.i=@schinagl.nl header.b="h9oIY+AQ"
X-Original-To: linux-usb@vger.kernel.org
Received: from 7of9.schinagl.nl (7of9.schinagl.nl [185.238.129.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3581523BE
	for <linux-usb@vger.kernel.org>; Fri,  2 Feb 2024 16:55:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.238.129.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706892923; cv=none; b=lrqa7Gx11DmrSSO56z92+si2PVVcTKUsmcJmZVzic+QpC+FnKisHhE9B+ubZBD49y19cwQd9Eljl3fGM5ZyKNJ+gT7ryZ/uC+rlm2/dBIqSpPFa/dF3TOFj2r45n1KEfBvz9s03DE7kDVyzY/7zwkib9AomHY3fYsJZZiqfZvuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706892923; c=relaxed/simple;
	bh=bPAwgLXk8Gx2Myv2ZaqA8U9hAWd2rrdlb0MvJg+iGBE=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=noCGvDhUNjoJhN+OyEz8rLLDRuZXylbavKqh9PFI8YfUFAik8dqOcByODHqHrDLP4TyWWGUwIP7F4pr8i5+/maOJD1yyibMbhnyYRCT1nHvRh4eGDeORlYekM6UFenMWCNwJXfj4YSGwjBp3syHFlG09T4zEXT9m/ihbdF2z08M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=schinagl.nl; spf=pass smtp.mailfrom=schinagl.nl; dkim=pass (1024-bit key) header.d=schinagl.nl header.i=@schinagl.nl header.b=h9oIY+AQ; arc=none smtp.client-ip=185.238.129.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=schinagl.nl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=schinagl.nl
Received: from [10.2.12.48] (unknown [10.2.12.48])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by 7of9.schinagl.nl (Postfix) with ESMTPSA id 0DD9919A710D;
	Fri,  2 Feb 2024 17:47:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=schinagl.nl; s=7of9;
	t=1706892422; bh=bPAwgLXk8Gx2Myv2ZaqA8U9hAWd2rrdlb0MvJg+iGBE=;
	h=Date:To:Cc:From:Subject;
	b=h9oIY+AQTnDLR5tHWmbZM5cvr/pt49WFBcRrFNVZgxN66nHF235tCbtULcj+DWvHt
	 W2wsw3iPKViRlI4duD4bFCy5OXYzGTwzHW+i6c0X0bwZBC+8Uf9mjG/IaespaI6S9M
	 AHr4gwRUpOIxpEvMVXgiPlZamQ+I+mD52KYFZZuE=
Message-ID: <c24c7882-6254-4e68-8f22-f3e8f65dc84f@schinagl.nl>
Date: Fri, 2 Feb 2024 17:47:01 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: nl
To: Andreas Noever <andreas.noever@gmail.com>,
 Michael Jamet <michael.jamet@intel.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Yehezkel Bernat <YehezkelShB@gmail.com>
Cc: linux-usb <linux-usb@vger.kernel.org>
From: Olliver Schinagl <oliver@schinagl.nl>
Subject: kernel NULL pointer dereference on hotplug
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hey guys,

I noticed this nasty kernel NULL pointer dereference yesterday on 
6.7.2-arch1-1 (haven't done this in a while) but also today, after 
updating to 6.7.3-arch1-1 it's still there, so dumping the panic here. 
Hopefully it'll be resolved by 6.7.4-arch1-1.

The thunderbolt gbit adapter always worked in the past, so this seems 
like a regression. Anyway, here's the log.

[  224.924021] BUG: kernel NULL pointer dereference, address: 
0000000000000020
[  224.924026] #PF: supervisor read access in kernel mode
[  224.924028] #PF: error_code(0x0000) - not-present page
[  224.924030] PGD 0 P4D 0
[  224.924032] Oops: 0000 [#1] PREEMPT SMP NOPTI
[  224.924035] CPU: 2 PID: 282 Comm: kworker/u8:9 Tainted: G 
OE      6.7.3-arch1-1 #1 b8291227ebee24f0bec9b3471a94151938512264
[  224.924038] Hardware name: Apple Inc. 
MacBookPro12,1/Mac-E43C1C25D4880AD6, BIOS 481.0.0.0.0 01/12/2023
[  224.924039] Workqueue: thunderbolt0 tb_handle_hotplug [thunderbolt]
[  224.924060] RIP: 0010:tb_port_do_update_credits+0x1b/0x130 [thunderbolt]
[  224.924079] Code: 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 0f 1f 
44 00 00 55 53 48 83 ec 18 65 48 8b 04 25 28 00 00 00 48 89 44 24 10 31 
c0 <48> 8b 47 20 c7 44 24 0c 00 00 00 00 80 b8 78 03 00 00 00 0f 85 ec
[  224.924081] RSP: 0018:ffffae7e4195bd70 EFLAGS: 00010246
[  224.924083] RAX: 0000000000000000 RBX: ffff99392dfa1c00 RCX: 
0000000003c00000
[  224.924084] RDX: 0000000000000000 RSI: ffffae7e4195bbc0 RDI: 
0000000000000000
[  224.924086] RBP: 0000000000000000 R08: 0000000003c00000 R09: 
0000000002080004
[  224.924087] R10: 0000000000000002 R11: 0000000000000000 R12: 
ffff99392dfa04c8
[  224.924088] R13: ffff99388c5ef258 R14: 0000000000000000 R15: 
ffff99392dfa1c00
[  224.924089] FS:  0000000000000000(0000) GS:ffff993bded00000(0000) 
knlGS:0000000000000000
[  224.924091] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  224.924092] CR2: 0000000000000020 CR3: 0000000190620003 CR4: 
00000000003706f0
[  224.924093] Call Trace:
[  224.924095]  <TASK>
[  224.924097]  ? __die+0x23/0x70
[  224.924101]  ? page_fault_oops+0x171/0x4e0
[  224.924105]  ? exc_page_fault+0x7f/0x180
[  224.924109]  ? asm_exc_page_fault+0x26/0x30
[  224.924112]  ? tb_port_do_update_credits+0x1b/0x130 [thunderbolt 
11ca615e403f4fd9365fcc050909dff1175dc0c5]
[  224.924131]  ? tb_switch_update_link_attributes+0x83/0xd0 
[thunderbolt 11ca615e403f4fd9365fcc050909dff1175dc0c5]
[  224.924150]  tb_switch_add+0x7a2/0xfe0 [thunderbolt 
11ca615e403f4fd9365fcc050909dff1175dc0c5]
[  224.924170]  tb_scan_port+0x236/0x6f0 [thunderbolt 
11ca615e403f4fd9365fcc050909dff1175dc0c5]
[  224.924188]  tb_handle_hotplug+0x6db/0x900 [thunderbolt 
11ca615e403f4fd9365fcc050909dff1175dc0c5]
[  224.924206]  process_one_work+0x171/0x340
[  224.924209]  worker_thread+0x27b/0x3a0
[  224.924211]  ? __pfx_worker_thread+0x10/0x10
[  224.924213]  kthread+0xe5/0x120
[  224.924216]  ? __pfx_kthread+0x10/0x10
[  224.924219]  ret_from_fork+0x31/0x50
[  224.924221]  ? __pfx_kthread+0x10/0x10
[  224.924224]  ret_from_fork_asm+0x1b/0x30
[  224.924227]  </TASK>
[  224.924227] Modules linked in: facetimehd(OE) videobuf2_dma_sg 
videobuf2_memops videobuf2_v4l2 videodev videobuf2_common mc rfcomm 
xt_nat veth vxlan ip6_udp_tunnel udp_tunnel xt_policy iptable_mangle 
xt_mark xt_bpf xt_tcpudp xt_conntrack xt_MASQUERADE nf_conntrack_netlink 
iptable_nat nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 
xt_addrtype iptable_filter br_netfilter bridge stp llc overlay cmac 
algif_hash algif_skcipher af_alg bnep snd_hda_codec_hdmi 
snd_hda_codec_cirrus snd_hda_codec_generic ledtrig_audio intel_rapl_msr 
intel_rapl_common snd_hda_intel x86_pkg_temp_thermal intel_powerclamp 
snd_intel_dspcfg coretemp snd_intel_sdw_acpi brcmfmac_wcc snd_hda_codec 
kvm_intel i915 spi_nor snd_hda_core btusb drm_buddy kvm brcmfmac btrtl 
mtd i2c_algo_bit snd_hwdep btintel brcmutil btbcm spi_intel_platform 
irqbypass ttm btmtk mei_pxp mei_hdcp cfg80211 iTCO_wdt spi_intel snd_pcm 
rapl bluetooth intel_pmc_bxt drm_display_helper snd_timer intel_cstate 
iTCO_vendor_support joydev acpi_als mei_me industrialio_triggered_buffer
[  224.924275]  applesmc mmc_core snd ecdh_generic cec kfifo_buf 
i2c_i801 intel_uncore thunderbolt pcspkr sbs intel_pch_thermal mei 
lpc_ich rfkill soundcore intel_gtt i2c_smbus industrialio bcm5974 sbshc 
video wmi mousedev apple_mfi_fastcharge mac_hid sg crypto_user fuse loop 
nfnetlink ip_tables x_tables uas usb_storage usbhid crct10dif_pclmul 
crc32_pclmul polyval_clmulni polyval_generic gf128mul 
ghash_clmulni_intel sha512_ssse3 sha256_ssse3 sha1_ssse3 applespi 
xhci_pci crc16 spi_pxa2xx_pci xhci_pci_renesas spi_pxa2xx_platform 
dw_dmac hid_apple tg3 libphy vfat fat btrfs blake2b_generic libcrc32c 
crc32c_generic crc32c_intel xor raid6_pq dm_crypt aesni_intel 
crypto_simd cryptd cbc encrypted_keys trusted asn1_encoder tee dm_mod
[  224.924313] CR2: 0000000000000020
[  224.924315] ---[ end trace 0000000000000000 ]---
[  224.924316] RIP: 0010:tb_port_do_update_credits+0x1b/0x130 [thunderbolt]
[  224.924335] Code: 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 0f 1f 
44 00 00 55 53 48 83 ec 18 65 48 8b 04 25 28 00 00 00 48 89 44 24 10 31 
c0 <48> 8b 47 20 c7 44 24 0c 00 00 00 00 80 b8 78 03 00 00 00 0f 85 ec
[  224.924336] RSP: 0018:ffffae7e4195bd70 EFLAGS: 00010246
[  224.924338] RAX: 0000000000000000 RBX: ffff99392dfa1c00 RCX: 
0000000003c00000
[  224.924339] RDX: 0000000000000000 RSI: ffffae7e4195bbc0 RDI: 
0000000000000000
[  224.924340] RBP: 0000000000000000 R08: 0000000003c00000 R09: 
0000000002080004
[  224.924341] R10: 0000000000000002 R11: 0000000000000000 R12: 
ffff99392dfa04c8
[  224.924342] R13: ffff99388c5ef258 R14: 0000000000000000 R15: 
ffff99392dfa1c00
[  224.924343] FS:  0000000000000000(0000) GS:ffff993bded00000(0000) 
knlGS:0000000000000000
[  224.924344] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  224.924346] CR2: 0000000000000020 CR3: 0000000190620003 CR4: 
00000000003706f0
[  224.924347] note: kworker/u8:9[282] exited with irqs disabled


Thanks,

Olliver

