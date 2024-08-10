Return-Path: <linux-usb+bounces-13307-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D64094DF32
	for <lists+linux-usb@lfdr.de>; Sun, 11 Aug 2024 00:45:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 735681C20EFB
	for <lists+linux-usb@lfdr.de>; Sat, 10 Aug 2024 22:45:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AAAEA142621;
	Sat, 10 Aug 2024 22:45:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mff.cuni.cz header.i=@mff.cuni.cz header.b="FjV2fLhG"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp1.ms.mff.cuni.cz (smtp-in1.ms.mff.cuni.cz [195.113.20.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E6B1C8D1
	for <linux-usb@vger.kernel.org>; Sat, 10 Aug 2024 22:45:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.113.20.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723329924; cv=none; b=YjTdXN8LX8S7KknTqmOve2hNKiJiSfTXSHsSa/ujFW+STBXBIjjrb0p/UVMfNdw9YqXqopevqfw3FlqiuYdvFWelkYE5pMLarzXXEQuRm7gf26BpY5AhNg2xqS/gJxP3/ctkktSVGS4UbpSur9vpQHVQ7VyCekJt2bWkol4i3aQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723329924; c=relaxed/simple;
	bh=iU+rzHZrdO5Doy9cVJB8BpHbf4erBZ7rzgkaQLpJQ58=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:To:From; b=nXCz8B9aO4YLoE2Bk4tq66GJGGvWBfriRkozju8c902vwzTPR1a2ossZwkMYfiHu2hvSdLNP8fWJUi9f/n0wnXho98aXRI8ZGXmZt0A0v6DQFEvwnqhx+jIKZKkxQDSK8Y0o8rNwSEUS+Zth5OFzzYS115ElRaLYI6M9r2itPFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=matfyz.cz; spf=pass smtp.mailfrom=matfyz.cz; dkim=pass (2048-bit key) header.d=mff.cuni.cz header.i=@mff.cuni.cz header.b=FjV2fLhG; arc=none smtp.client-ip=195.113.20.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=matfyz.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=matfyz.cz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mff.cuni.cz;
	s=submission; t=1723327863; x=1724627863;
	bh=kYIPPD64zYUiDVPW3sghh1le8D1aO/u0H9mzzvM16ho=; h=From;
	b=FjV2fLhG8aHbbEd0c7Ev6idpl8UD284N4yYy0HYdp0XOAK/GPOFxBhVzoLwtHhr35
	 KY9zX6DAzHOeCKJGlF2pcr4gIDIU7J5rd7FihXa11jynTVlbRPtfWH5cZfQAg2IkaH
	 eYMl8Vvqzr/6GC2xg9EghJEKG+ht7+yPuaYEn6x1MeE/SrDXaW6WnZ9ZExbFIlZY+f
	 cQ+aRIbUVMfTPPCfzZEZd377mENpXvv/EOtt0F5heolrWSesMKOz3/RGNFTjTzokWD
	 LadZF0m9hiuJ7yp0w2dDF0UZL4Wf91nU4uJskWm+TpaP0HWzFxRDgZSoVbuDIF9ly2
	 XT1/YlI+6Mmhg==
Received: from localhost (internet5.mraknet.com [185.200.108.250])
	(authenticated)
	by smtp1.ms.mff.cuni.cz (8.16.1/8.16.1) with ESMTPS id 47AMB1MX018993
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK)
	for <linux-usb@vger.kernel.org>; Sun, 11 Aug 2024 00:11:03 +0200 (CEST)
	(envelope-from balejk@matfyz.cz)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 11 Aug 2024 00:11:01 +0200
Message-Id: <D3CKQQAETH47.1MUO22RTCH2O3@matfyz.cz>
Subject: [BUG] USB xHCI driver NULL pointer dereference
To: <linux-usb@vger.kernel.org>
From: "Karel Balej" <balejk@matfyz.cz>

Hello,

my machine crashed twice in the past week, the second time I have been
able to recover the log output (including the stack trace run through
scripts/decode_stacktrace.sh) which seems to suggest a bug in the xHCI
driver:

	[44193.556677] usb 2-1-port5: disabled by hub (EMI?), re-enabling...
	[44193.556692] usb 2-1.5: USB disconnect, device number 6
	[44193.558532] cdc_ncm 2-1.5:1.0 enp0s29u1u5: unregister 'cdc_ncm' usb-000=
0:00:1d.0-1.5, CDC NCM (NO ZLP)
	[44193.739545] usb 2-1.5: new high-speed USB device number 7 using ehci-pc=
i
	[44193.819628] usb 2-1.5: New USB device found, idVendor=3D18d1, idProduct=
=3Dd001, bcdDevice=3D 6.10
	[44193.819637] usb 2-1.5: New USB device strings: Mfr=3D1, Product=3D2, Se=
rialNumber=3D3
	[44193.819641] usb 2-1.5: Product: Samsung Galaxy Core Prime VE LTE
	[44193.819644] usb 2-1.5: Manufacturer: Samsung
	[44193.819646] usb 2-1.5: SerialNumber: postmarketOS
	[44193.842472] cdc_ncm 2-1.5:1.0: MAC-Address: [...]
	[44193.842770] cdc_ncm 2-1.5:1.0 usb0: register 'cdc_ncm' at usb-0000:00:1=
d.0-1.5, CDC NCM (NO ZLP), [...]
	[44193.845829] cdc_ncm 2-1.5:1.0 enp0s29u1u5: renamed from usb0
	[46253.017991] perf: interrupt took too long (2506 > 2500), lowering kerne=
l.perf_event_max_sample_rate to 79000
	[46709.344533] usb 3-1: new full-speed USB device number 3 using xhci_hcd
	[46709.458560] usb 3-1: device descriptor read/64, error -71
	[46709.679562] usb 3-1: device descriptor read/64, error -71
	[46709.895544] usb 3-1: new full-speed USB device number 4 using xhci_hcd
	[46710.009563] usb 3-1: device descriptor read/64, error -71
	[46710.231579] usb 3-1: device descriptor read/64, error -71
	[46710.333629] usb usb3-port1: attempt power cycle
	[46710.713538] usb 3-1: new full-speed USB device number 5 using xhci_hcd
	[46710.713699] usb 3-1: Device not responding to setup address.
	[46710.917684] usb 3-1: Device not responding to setup address.
	[46711.125536] usb 3-1: device not accepting address 5, error -71
	[46711.125594] BUG: kernel NULL pointer dereference, address: 000000000000=
0008
	[46711.125600] #PF: supervisor read access in kernel mode
	[46711.125603] #PF: error_code(0x0000) - not-present page
	[46711.125606] PGD 0 P4D 0
	[46711.125610] Oops: Oops: 0000 [#1] PREEMPT SMP PTI
	[46711.125615] CPU: 1 PID: 25760 Comm: kworker/1:2 Not tainted 6.10.3_2 #1
	[46711.125620] Hardware name: Gigabyte Technology Co., Ltd. To be filled b=
y O.E.M./Z77-D3H, BIOS F18 08/21/2012
	[46711.125623] Workqueue: usb_hub_wq hub_event [usbcore]
	[46711.125668] RIP: 0010:xhci_reserve_bandwidth (drivers/usb/host/xhci.c:2=
392 drivers/usb/host/xhci.c:2758) xhci_hcd
	[46711.125701] Code: 24 30 b8 47 06 00 00 0f 45 c2 48 c7 c2 08 67 45 c0 89=
 44 24 08 0f 94 c0 0f b6 c0 8d 44 40 01 89 44 24 10 48 8b 85 90 11 00 00 <8=
b> 48 08 83 c1 01 48 83 bd a0 11 00 00 00 0f 84 4e 03 00 00 e8 3b
	All code
	=3D=3D=3D=3D=3D=3D=3D=3D
	   0:	24 30                	and    $0x30,%al
	   2:	b8 47 06 00 00       	mov    $0x647,%eax
	   7:	0f 45 c2             	cmovne %edx,%eax
	   a:	48 c7 c2 08 67 45 c0 	mov    $0xffffffffc0456708,%rdx
	  11:	89 44 24 08          	mov    %eax,0x8(%rsp)
	  15:	0f 94 c0             	sete   %al
	  18:	0f b6 c0             	movzbl %al,%eax
	  1b:	8d 44 40 01          	lea    0x1(%rax,%rax,2),%eax
	  1f:	89 44 24 10          	mov    %eax,0x10(%rsp)
	  23:	48 8b 85 90 11 00 00 	mov    0x1190(%rbp),%rax
	  2a:*	8b 48 08             	mov    0x8(%rax),%ecx		<-- trapping instructi=
on
	  2d:	83 c1 01             	add    $0x1,%ecx
	  30:	48 83 bd a0 11 00 00 	cmpq   $0x0,0x11a0(%rbp)
	  37:	00=20
	  38:	0f 84 4e 03 00 00    	je     0x38c
	  3e:	e8                   	.byte 0xe8
	  3f:	3b                   	.byte 0x3b
=09
	Code starting with the faulting instruction
	=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
	   0:	8b 48 08             	mov    0x8(%rax),%ecx
	   3:	83 c1 01             	add    $0x1,%ecx
	   6:	48 83 bd a0 11 00 00 	cmpq   $0x0,0x11a0(%rbp)
	   d:	00=20
	   e:	0f 84 4e 03 00 00    	je     0x362
	  14:	e8                   	.byte 0xe8
	  15:	3b                   	.byte 0x3b
	[46711.125705] RSP: 0018:ffffbb3d88c4f938 EFLAGS: 00010097
	[46711.125709] RAX: 0000000000000000 RBX: ffffbb3d80187000 RCX: 0000000000=
00001f
	[46711.125712] RDX: ffffffffc0456708 RSI: ffffffffc040c810 RDI: ffff96b181=
3f3250
	[46711.125715] RBP: ffff96b23c08a000 R08: ffff96b23c08a020 R09: 0000000000=
000000
	[46711.125718] R10: ffff96b08884c5c0 R11: 0000000000000001 R12: ffffbb3d88=
c4f970
	[46711.125720] R13: ffff96b1813f3250 R14: 0000000000000000 R15: 0000000000=
00001f
	[46711.125723] FS:  0000000000000000(0000) GS:ffff96b296c80000(0000) knlGS=
:0000000000000000
	[46711.125727] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
	[46711.125730] CR2: 0000000000000008 CR3: 0000000030c20002 CR4: 0000000000=
1706f0
	[46711.125733] Call Trace:
	[46711.125736]  <TASK>
	[46711.125739] ? __die (arch/x86/kernel/dumpstack.c:421 arch/x86/kernel/du=
mpstack.c:434)=20
	[46711.125747] ? page_fault_oops (arch/x86/mm/fault.c:715 (discriminator 1=
))=20
	[46711.125754] ? xhci_reserve_bandwidth (drivers/usb/host/xhci.c:2392 driv=
ers/usb/host/xhci.c:2758) xhci_hcd
	[46711.125781] ? search_bpf_extables (kernel/bpf/core.c:799)=20
	[46711.125790] ? exc_page_fault (./arch/x86/include/asm/paravirt.h:693 arc=
h/x86/mm/fault.c:1489 arch/x86/mm/fault.c:1539)=20
	[46711.125796] ? asm_exc_page_fault (./arch/x86/include/asm/idtentry.h:623=
)=20
	[46711.125803] ? __pfx_trace_xhci_dbg_quirks (drivers/usb/host/xhci-trace.=
h:48) xhci_hcd
	[46711.125830] ? xhci_reserve_bandwidth (drivers/usb/host/xhci.c:2392 driv=
ers/usb/host/xhci.c:2758) xhci_hcd
	[46711.125857] ? xhci_reserve_bandwidth (drivers/usb/host/xhci.c:2750) xhc=
i_hcd
	[46711.125885] ? update_load_avg (kernel/sched/fair.c:4410 kernel/sched/fa=
ir.c:4747)=20
	[46711.125891] ? local_clock (./arch/x86/include/asm/preempt.h:94 (discrim=
inator 1) kernel/sched/clock.c:316 (discriminator 1))=20
	[46711.125897] ? metadata_update_state (mm/kfence/core.c:298 (discriminato=
r 1))=20
	[46711.125911] xhci_configure_endpoint (drivers/usb/host/xhci.c:2840 (disc=
riminator 1)) xhci_hcd
	[46711.125940] xhci_endpoint_reset (drivers/usb/host/xhci.c:1525 drivers/u=
sb/host/xhci.c:3144) xhci_hcd
	[46711.125969] ? hub_port_init (drivers/usb/core/hub.c:5182) usbcore
	[46711.126004] ? preempt_count_add (./include/linux/ftrace.h:975 kernel/sc=
hed/core.c:5850 kernel/sched/core.c:5847 kernel/sched/core.c:5875)=20
	[46711.126011] usb_enable_endpoint (drivers/usb/core/message.c:1461) usbco=
re
	[46711.126052] hub_event (drivers/usb/core/hub.c:5548 drivers/usb/core/hub=
.c:5661 drivers/usb/core/hub.c:5821 drivers/usb/core/hub.c:5903) usbcore
	[46711.126090] ? __mod_timer (kernel/time/timer.c:1189)=20
	[46711.126096] process_one_work (kernel/workqueue.c:3257)=20
	[46711.126104] worker_thread (kernel/workqueue.c:3327 (discriminator 2) ke=
rnel/workqueue.c:3413 (discriminator 2))=20
	[46711.126110] ? _raw_spin_lock_irqsave (./arch/x86/include/asm/atomic.h:1=
07 (discriminator 4) ./include/linux/atomic/atomic-arch-fallback.h:2170 (di=
scriminator 4) ./include/linux/atomic/atomic-instrumented.h:1302 (discrimin=
ator 4) ./include/asm-generic/qspinlock.h:111 (discriminator 4) ./include/l=
inux/spinlock.h:187 (discriminator 4) ./include/linux/spinlock_api_smp.h:11=
1 (discriminator 4) kernel/locking/spinlock.c:162 (discriminator 4))=20
	[46711.126115] ? __pfx_worker_thread (kernel/workqueue.c:3360)=20
	[46711.126121] kthread (kernel/kthread.c:389)=20
	[46711.126126] ? __pfx_kthread (kernel/kthread.c:342)=20
	[46711.126130] ret_from_fork (arch/x86/kernel/process.c:153)=20
	[46711.126135] ? __pfx_kthread (kernel/kthread.c:342)=20
	[46711.126139] ret_from_fork_asm (arch/x86/entry/entry_64.S:257)=20
	[46711.126146]  </TASK>
	[46711.126148] Modules linked in: cdc_mbim cdc_wdm cdc_ncm cdc_ether usbne=
t tls cfg80211 8021q garp mrp stp llc ip6table_filter ip6_tables xt_tcpudp =
xt_conntrack nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 iptable_filter ip_t=
ables x_tables nls_iso8859_1 nls_cp437 vfat fat raid1 intel_rapl_msr mei_hd=
cp mei_pxp intel_rapl_common md_mod x86_pkg_temp_thermal intel_powerclamp a=
t24 snd_hda_codec_via iTCO_wdt intel_pmc_bxt coretemp snd_hda_codec_generic=
 iTCO_vendor_support snd_hda_codec_hdmi rapl intel_cstate snd_hda_intel int=
el_uncore snd_intel_dspcfg psmouse snd_intel_sdw_acpi pcspkr snd_hda_codec =
mei_me joydev i2c_i801 evdev mei input_leds snd_hda_core i2c_smbus mac_hid =
snd_hwdep alx i2c_mux snd_pcm lpc_ich mdio thermal fan tiny_power_button bu=
tton sg snd_seq snd_seq_device snd_timer snd soundcore vhost_vsock vmw_vsoc=
k_virtio_transport_common vsock vhost_net vhost vhost_iotlb tap hci_vhci bl=
uetooth rfkill vfio_iommu_type1 vfio iommufd uhid uinput userio ppp_generic=
 slhc tun loop nvram btrfs blake2b_generic xor ...
	[46711.126249]  libcrc32c cuse fuse ext4 crc32c_generic crc16 mbcache jbd2=
 dm_crypt encrypted_keys trusted asn1_encoder tee tpm rng_core libaescfb ec=
dh_generic dm_mod ecc amdgpu amdxcp drm_exec gpu_sched drm_buddy radeon drm=
_ttm_helper ttm agpgart hid_generic i2c_algo_bit sr_mod sd_mod drm_suballoc=
_helper cdrom drm_display_helper ata_generic usbhid pata_acpi crct10dif_pcl=
mul uas crc32_pclmul hid usb_storage crc32c_intel drm_kms_helper polyval_cl=
mulni xhci_pci polyval_generic gf128mul ghash_clmulni_intel ata_piix xhci_p=
ci_renesas drm libata sha512_ssse3 sha256_ssse3 xhci_hcd ehci_pci sha1_ssse=
3 aesni_intel ehci_hcd crypto_simd cryptd scsi_mod serio_raw usbcore scsi_c=
ommon usb_common video wmi
	[46711.126321] CR2: 0000000000000008
	[46711.126325] ---[ end trace 0000000000000000 ]---
	[46711.126328] RIP: 0010:xhci_reserve_bandwidth (drivers/usb/host/xhci.c:2=
392 drivers/usb/host/xhci.c:2758) xhci_hcd
	[46711.126357] Code: 24 30 b8 47 06 00 00 0f 45 c2 48 c7 c2 08 67 45 c0 89=
 44 24 08 0f 94 c0 0f b6 c0 8d 44 40 01 89 44 24 10 48 8b 85 90 11 00 00 <8=
b> 48 08 83 c1 01 48 83 bd a0 11 00 00 00 0f 84 4e 03 00 00 e8 3b
	All code
	=3D=3D=3D=3D=3D=3D=3D=3D
	   0:	24 30                	and    $0x30,%al
	   2:	b8 47 06 00 00       	mov    $0x647,%eax
	   7:	0f 45 c2             	cmovne %edx,%eax
	   a:	48 c7 c2 08 67 45 c0 	mov    $0xffffffffc0456708,%rdx
	  11:	89 44 24 08          	mov    %eax,0x8(%rsp)
	  15:	0f 94 c0             	sete   %al
	  18:	0f b6 c0             	movzbl %al,%eax
	  1b:	8d 44 40 01          	lea    0x1(%rax,%rax,2),%eax
	  1f:	89 44 24 10          	mov    %eax,0x10(%rsp)
	  23:	48 8b 85 90 11 00 00 	mov    0x1190(%rbp),%rax
	  2a:*	8b 48 08             	mov    0x8(%rax),%ecx		<-- trapping instructi=
on
	  2d:	83 c1 01             	add    $0x1,%ecx
	  30:	48 83 bd a0 11 00 00 	cmpq   $0x0,0x11a0(%rbp)
	  37:	00=20
	  38:	0f 84 4e 03 00 00    	je     0x38c
	  3e:	e8                   	.byte 0xe8
	  3f:	3b                   	.byte 0x3b
=09
	Code starting with the faulting instruction
	=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
	   0:	8b 48 08             	mov    0x8(%rax),%ecx
	   3:	83 c1 01             	add    $0x1,%ecx
	   6:	48 83 bd a0 11 00 00 	cmpq   $0x0,0x11a0(%rbp)
	   d:	00=20
	   e:	0f 84 4e 03 00 00    	je     0x362
	  14:	e8                   	.byte 0xe8
	  15:	3b                   	.byte 0x3b
	[46711.126360] RSP: 0018:ffffbb3d88c4f938 EFLAGS: 00010097
	[46711.126364] RAX: 0000000000000000 RBX: ffffbb3d80187000 RCX: 0000000000=
00001f
	[46711.126367] RDX: ffffffffc0456708 RSI: ffffffffc040c810 RDI: ffff96b181=
3f3250
	[46711.126369] RBP: ffff96b23c08a000 R08: ffff96b23c08a020 R09: 0000000000=
000000
	[46711.126372] R10: ffff96b08884c5c0 R11: 0000000000000001 R12: ffffbb3d88=
c4f970
	[46711.126374] R13: ffff96b1813f3250 R14: 0000000000000000 R15: 0000000000=
00001f
	[46711.126377] FS:  0000000000000000(0000) GS:ffff96b296c80000(0000) knlGS=
:0000000000000000
	[46711.126380] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
	[46711.126383] CR2: 0000000000000008 CR3: 0000000030c20002 CR4: 0000000000=
1706f0
	[46711.126386] note: kworker/1:2[25760] exited with irqs disabled
	[46711.126388] note: kworker/1:2[25760] exited with preempt_count 1

This second crash ocurred upon plugging in an USB stick into one of the
front ports of my machine. While doing so, I also had my phone connected
to the computer (apart from the usual peripherals such as the keyboard),
the phone uses the NCM gadget for a interfacing the computer, as can be
seen from the above. There seems to have been some error with the port
getting disabled some time prior to the crash, causing disconnection of
the phone, I don't know if this is related and relevant. Immediately
preceeding the crash (with the stick already attached) however there are
some device descriptor read errors.

I am running Linux 6.10.3 (stable) as packaged by my distribution Void
Linux. The build configuration can thus be found here [1].

I have not been able to reproduce the bug at will, hence I have not
attempted to narrow down in which version of the kernel the problem
might have been introduced, I have however never encountered it before.
I hope the report will be at least of some use though, please let me
know if I should provide some additional information.

[1] https://raw.githubusercontent.com/void-linux/void-packages/e0334d3395b2=
/srcpkgs/linux6.10/files/x86_64-dotconfig

Kind regards,
K. B.

