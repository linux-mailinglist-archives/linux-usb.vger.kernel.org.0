Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EAE0C2E8352
	for <lists+linux-usb@lfdr.de>; Fri,  1 Jan 2021 09:31:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726525AbhAAIaA convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Fri, 1 Jan 2021 03:30:00 -0500
Received: from mail.kernel.org ([198.145.29.99]:49988 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726314AbhAAIaA (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 1 Jan 2021 03:30:00 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id BFC4821D95
        for <linux-usb@vger.kernel.org>; Fri,  1 Jan 2021 08:29:18 +0000 (UTC)
Received: by pdx-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id A6E41816ED; Fri,  1 Jan 2021 08:29:18 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 209407] skb_over_panic in cdc_mbim_tx_fixup
Date:   Fri, 01 Jan 2021 08:29:18 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: jks@iki.fi
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-209407-208809-dKf6p0i16S@https.bugzilla.kernel.org/>
In-Reply-To: <bug-209407-208809@https.bugzilla.kernel.org/>
References: <bug-209407-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=209407

--- Comment #5 from Jouni Seppänen (jks@iki.fi) ---
I compiled with KASAN and UBSAN and ran my test case:

[  712.401555]
==================================================================
[  712.409173] BUG: KASAN: slab-out-of-bounds in
cdc_ncm_fill_tx_frame+0x2776/0x3b10 [cdc_ncm]
[  712.418199] Write of size 4294967294 at addr ffff888109964002 by task
ksoftirqd/2/21
 --- 8< ---
[  758.368348] RIP: 0010:__memset+0x24/0x30
 --- 8< ---
[  758.457314] Call Trace:
[  758.460029]  cdc_ncm_fill_tx_frame+0x2776/0x3b10 [cdc_ncm]
[  758.466067]  cdc_mbim_tx_fixup+0x576/0x730 [cdc_mbim]
[  758.471549]  ? skb_mac_gso_segment+0x1e7/0x3d0
[  758.476427]  ? cdc_mbim_rx_kill_vid+0x50/0x50 [cdc_mbim]
[  758.482075]  ? skb_network_protocol+0x510/0x510
[  758.487046]  usbnet_start_xmit+0x13b/0x2650 [usbnet]
[  758.492510]  ? do_raw_spin_lock+0x126/0x2a0
[  758.497068]  dev_hard_start_xmit+0x15d/0x500
[  758.501604]  sch_direct_xmit+0x222/0xa60
[  758.505842]  ? dev_reset_queue.constprop.21+0x100/0x100
[  758.511509]  ? do_raw_spin_lock+0x126/0x2a0
[  758.516012]  ? rwlock_bug.part.1+0x90/0x90
[  758.520418]  __dev_queue_xmit+0x130f/0x1f80
[  758.524977]  ? netdev_core_pick_tx+0x2e0/0x2e0
[  758.529854]  ? __nft_trace_packet+0x1c0/0x1c0 [nf_tables]
[  758.535689]  ? rt_cache_valid+0xec/0x160
[  758.539967]  ? memset+0x2d/0x70
[  758.543298]  ? __xfrm_decode_session+0x179/0x2db0
[  758.548359]  ip_finish_output2+0x975/0x1b90
[  758.552884]  ? __ip_flush_pending_frames.isra.11+0x2f0/0x2f0
[  758.558967]  ? 0xffffffffc0e68000
[  758.562599]  __ip_finish_output+0x380/0x870
[  758.567141]  ? __nft_set_pktinfo_ipv6_validate+0x4b0/0x4b0 [nf_tables]
[  758.574261]  ? ip_fragment.constprop.20+0x220/0x220
[  758.579588]  ? nf_confirm+0x2b1/0x390 [nf_conntrack]
[  758.585081]  ? nf_hook_slow+0xc5/0x190
[  758.589048]  ip_output+0x1a4/0x300
[  758.592663]  ? ip_mc_output+0x7d0/0x7d0
[  758.596844]  ? __ip_finish_output+0x870/0x870
[  758.601647]  ? nf_hook_slow+0xc5/0x190
[  758.605643]  ip_forward+0xf92/0x1b90
[  758.609417]  ? nf_nat_ipv4_in+0xc7/0x200 [nf_nat]
[  758.614452]  ? ip_forward_finish+0x260/0x260
[  758.619129]  ? ip_route_input_noref+0x74/0xb0
[  758.623809]  ? ip_route_input_rcu+0xbf0/0xbf0
[  758.628500]  ? ip4_key_hashfn+0x200/0x200
[  758.632860]  ip_sublist_rcv_finish+0x112/0x1d0
[  758.637636]  ip_sublist_rcv+0x3f6/0x650
[  758.641858]  ? ip_rcv_core+0xcc0/0xcc0
[  758.645942]  ? tpacket_rcv+0x35f0/0x35f0
[  758.650260]  ? ip_rcv_finish_core.isra.3+0x1640/0x1640
[  758.655752]  ? ip_rcv_core+0x5c2/0xcc0
[  758.659704]  ? do_xdp_generic+0x20/0x20
[  758.663941]  ip_list_rcv+0x2a5/0x3e0
[  758.667888]  ? ip_rcv+0x1e0/0x1e0
[  758.671443]  __netif_receive_skb_list_core+0x660/0x8f0
[  758.677050]  ? napi_gro_receive+0x23f/0x2b0
[  758.681553]  ? process_backlog+0x640/0x640
[  758.685930]  ? kasan_save_stack+0x19/0x40
[  758.690269]  ? kasan_set_track+0x1c/0x30
[  758.694500]  ? kasan_set_free_info+0x1b/0x30
[  758.699230]  ? __kasan_slab_free+0x106/0x150
[  758.703808]  ? kmem_cache_free+0xde/0x450
[  758.708064]  ? napi_gro_receive+0x23f/0x2b0
[  758.712624]  ? igb_poll+0x114e/0x5000 [igb]
[  758.717116]  ? __do_softirq+0x1a6/0x605
[  758.721188]  ? run_ksoftirqd+0x1a/0x30
[  758.725326]  ? smpboot_thread_fn+0x28b/0x660
[  758.729862]  ? kthread+0x313/0x410
[  758.733511]  ? ret_from_fork+0x22/0x30
[  758.737461]  netif_receive_skb_list_internal+0x5d5/0xc00
[  758.743055]  ? stack_trace_save+0xb0/0xb0
[  758.747345]  ? __netif_receive_skb_list_core+0x8f0/0x8f0
[  758.753066]  ? inet_gro_receive+0x1a9/0x1270
[  758.757615]  ? gro_normal_one+0x65/0x250
[  758.761870]  ? napi_gro_complete.constprop.84+0x124/0x2e0
[  758.767709]  ? napi_gro_flush+0x253/0x3e0
[  758.772037]  napi_complete_done+0x18c/0x600
[  758.776556]  igb_poll+0x1a5d/0x5000 [igb]
[  758.780804]  ? update_rq_clock+0xc3/0x520
[  758.785111]  ? newidle_balance+0x893/0xdb0
[  758.789683]  ? igb_alloc_rx_buffers+0x870/0x870 [igb]
[  758.795041]  net_rx_action+0x333/0xcf0
[  758.799088]  ? napi_busy_loop+0x580/0x580
[  758.803372]  ? rcu_note_context_switch+0x1e0/0x1e0
[  758.808615]  ? do_raw_spin_unlock+0x54/0x270
[  758.813247]  ? _raw_spin_unlock_irqrestore+0x10/0x20
[  758.818540]  __do_softirq+0x1a6/0x605
[  758.822468]  ? perf_trace_irq_handler_entry+0x500/0x500
[  758.828099]  run_ksoftirqd+0x1a/0x30
[  758.831984]  smpboot_thread_fn+0x28b/0x660
[  758.836458]  ? smpboot_register_percpu_thread+0x1a0/0x1a0
[  758.842286]  ? do_raw_spin_unlock+0x54/0x270
[  758.846811]  ? smpboot_register_percpu_thread+0x1a0/0x1a0
[  758.852590]  kthread+0x313/0x410
[  758.856170]  ? kthread_bind+0x70/0x70
[  758.860063]  ret_from_fork+0x22/0x30
[  758.863959] Modules linked in: xt_nat xt_tcpudp nft_compat veth nft_counter
xt_conntrack bridge nf_conntrack_netlink xfrm_user xfrm_algo overlay cdc_mbim
cdc_wdm cdc_ncm 8021q garp stp mrp llc cdc_ether usbnet option usb_wwan mii
usbserial amd64_edac_mod edac_mce_amd kvm_amd kvm irqbypass crc32_pclmul
ghash_clmulni_intel aesni_intel glue_helper libaes crypto_simd cryptd sg pcspkr
k10temp fam15h_power sp5100_tco ccp watchdog evdev rng_core button acpi_cpufreq
nft_reject_inet nf_reject_ipv4 nf_reject_ipv6 nft_reject nft_ct sch_fq_codel
nft_masq nft_chain_nat nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4
nf_tables nfnetlink ip_tables x_tables autofs4 ext4 crc16 mbcache jbd2 dm_mod
raid10 raid456 async_raid6_recov async_memcpy async_pq async_xor async_tx xor
raid6_pq libcrc32c crc32c_generic raid1 raid0 multipath linear md_mod sd_mod
t10_pi crc_t10dif uas crct10dif_generic usb_storage sdhci_pci crct10dif_pclmul
crct10dif_common crc32c_intel cqhci ahci xhci_pci libahci sdhci libata ehci_pci
[  758.865135]  xhci_hcd ehci_hcd mmc_core igb i2c_piix4 scsi_mod usbcore ptp
pps_core i2c_algo_bit dca gpio_keys
[  758.969517] CR2: ffff888104c9a000

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
