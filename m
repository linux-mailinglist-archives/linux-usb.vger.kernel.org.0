Return-Path: <linux-usb+bounces-37741-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WIvfMq7jDGrIpgUAu9opvQ
	(envelope-from <linux-usb+bounces-37741-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 20 May 2026 00:26:54 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3088558597F
	for <lists+linux-usb@lfdr.de>; Wed, 20 May 2026 00:26:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 92DCF301CCE5
	for <lists+linux-usb@lfdr.de>; Tue, 19 May 2026 22:26:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 010263EDAA5;
	Tue, 19 May 2026 22:26:39 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-oi1-f205.google.com (mail-oi1-f205.google.com [209.85.167.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF7FA3BA23A
	for <linux-usb@vger.kernel.org>; Tue, 19 May 2026 22:26:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779229598; cv=none; b=OGJueElOh71kFGEEXlszv/cH3+qi8t1EylVHFnQDJ0uR7MHmZPfLcc+kZM4Wj2cJBFib+7YOdUsBJV9ZEAEB2MWonev5rOEij+vEQBOi0cbrPV7TT99YzbHi73UD4fTeENOtxyqvMj1qZeA3BIGm2BV1ayBunOhExYRKXLFTmMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779229598; c=relaxed/simple;
	bh=0ni/x0+9FC290wwk6TKMSGU8PLN/QioGh36vrd5ny7g=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=VdnQ5jLQT6qkZIheKGrxGZnIBfzx+WyNkWkx2+Qy+wFC/EU/7uzbSGP+wVqLhTFofXiC+AeGj7juUhSFFXlcfBjuk988oFx3BihdhwBtCcOiejq/1iCkdq2/HyngiyjNFRhAWBPVde4RAYY8jbsR1mS3pvWULyPzmsohjKzUB/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f205.google.com with SMTP id 5614622812f47-482769a1363so4101697b6e.2
        for <linux-usb@vger.kernel.org>; Tue, 19 May 2026 15:26:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779229595; x=1779834395;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rvx1brME/KKtX7R+VVOra7diLOh081jjuh9pgn+wYtM=;
        b=SILZM96smJYFz8ml1blIAcdvXTMqfiJijZhzfBygT4yuIKEGvo11aMbHi2jt2SUUu7
         L/ajulxQC+x+hkAeSR+07H8miiPmQrB4zcfwC75CUj2TijQQ6M7/+L6abipjsRTf/Lmv
         A1HCos2xm2y53UAXDAtiGpWJx8doU7W9WLdLEvICcIWB70jct3Y63sKv0SwPj8H8dxER
         I0Trrq7iQUKuWJlj8qxl5zfMtztiZVSsKR7eBGUxoSgGzW4BXAubjPhL32qWAhyR3045
         jsnpkd1zo1L2FftBB8lOOE4c2PeDcklhmaPUeLALXGfSRTeaZWz46kKkzDo6dMM8IiPI
         zlzw==
X-Forwarded-Encrypted: i=1; AFNElJ9A8NyVvpLSmj9VQIAnBXXdzH4Gcmf0izQ74cE7JGbvdy/A2yiqG/HGPcqPHHBmOBH6WqYTeOL/Nx8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzREXunkkTg8ZBpNagyzhxxZLtuNwDF214MzMf6N/ecHX7Cp9Di
	7IlWtANqAezboOAgamioT5K85arrDOqxsrbH15o/79hbZ17ER5DS1HpX6sjfH2FU/UuvfzYJ0kx
	72IDornJPy2IisR+Mwg2baSSe3MJvHOCRvuh0h6MuIvn1vpwgsZ2um6RPRiY=
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:200d:b0:696:7d51:79dd with SMTP id
 006d021491bc7-69c9bfd4bd2mr13258680eaf.28.1779229595484; Tue, 19 May 2026
 15:26:35 -0700 (PDT)
Date: Tue, 19 May 2026 15:26:35 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a0ce39b.170a0220.39a13.0007.GAE@google.com>
Subject: [syzbot] [usb?] KASAN: slab-use-after-free Write in
 iowarrior_write_callback (2)
From: syzbot <syzbot+ad2aac2febc3bedf0962@syzkaller.appspotmail.com>
To: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-0.36 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	URI_HIDDEN_PATH(1.00)[https://syzkaller.appspot.com/x/.config?x=59da38148f3a3d24];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[appspotmail.com : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-37741-lists,linux-usb=lfdr.de,ad2aac2febc3bedf0962];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	SUBJECT_HAS_QUESTION(0.00)[];
	REDIRECTOR_URL(0.00)[goo.gl];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[syzbot@syzkaller.appspotmail.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_NONE(0.00)[];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,goo.gl:url,storage.googleapis.com:url,googlegroups.com:email,appspotmail.com:email,syzkaller.appspot.com:url]
X-Rspamd-Queue-Id: 3088558597F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hello,

syzbot found the following issue on:

HEAD commit:    fcee7d82f27d Merge tag 'net-7.1-rc3' of git://git.kernel.o..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=15792ad2580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=59da38148f3a3d24
dashboard link: https://syzkaller.appspot.com/bug?extid=ad2aac2febc3bedf0962
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/d900f083ada3/non_bootable_disk-fcee7d82.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/a5dee9aef2ac/vmlinux-fcee7d82.xz
kernel image: https://storage.googleapis.com/syzbot-assets/7b1a8dd09a15/bzImage-fcee7d82.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+ad2aac2febc3bedf0962@syzkaller.appspotmail.com

iowarrior 10-1:0.186: iowarrior_callback - usb_submit_urb failed with result -1
==================================================================
BUG: KASAN: slab-use-after-free in instrument_atomic_read_write include/linux/instrumented.h:112 [inline]
BUG: KASAN: slab-use-after-free in atomic_dec include/linux/atomic/atomic-instrumented.h:592 [inline]
BUG: KASAN: slab-use-after-free in iowarrior_write_callback+0xdc/0x190 drivers/usb/misc/iowarrior.c:236
Write of size 4 at addr ffff888050f49168 by task kworker/u32:13/17990

CPU: 0 UID: 0 PID: 17990 Comm: kworker/u32:13 Tainted: G             L      syzkaller #0 PREEMPT(full) 
Tainted: [L]=SOFTLOCKUP
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
Workqueue: bat_events batadv_iv_send_outstanding_bat_ogm_packet
Call Trace:
 <IRQ>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x100/0x190 lib/dump_stack.c:120
 print_address_description mm/kasan/report.c:378 [inline]
 print_report+0x13d/0x4b0 mm/kasan/report.c:482
 kasan_report+0xdf/0x1d0 mm/kasan/report.c:595
 check_region_inline mm/kasan/generic.c:186 [inline]
 kasan_check_range+0x10f/0x1e0 mm/kasan/generic.c:200
 instrument_atomic_read_write include/linux/instrumented.h:112 [inline]
 atomic_dec include/linux/atomic/atomic-instrumented.h:592 [inline]
 iowarrior_write_callback+0xdc/0x190 drivers/usb/misc/iowarrior.c:236
 __usb_hcd_giveback_urb+0x38d/0x610 drivers/usb/core/hcd.c:1657
 usb_hcd_giveback_urb+0x3ca/0x4a0 drivers/usb/core/hcd.c:1741
 dummy_timer+0xda1/0x36c0 drivers/usb/gadget/udc/dummy_hcd.c:2005
 __run_hrtimer kernel/time/hrtimer.c:1930 [inline]
 __hrtimer_run_queues+0x470/0xa00 kernel/time/hrtimer.c:1994
 hrtimer_run_softirq+0x17d/0x2c0 kernel/time/hrtimer.c:2011
 handle_softirqs+0x1ea/0xa00 kernel/softirq.c:622
 __do_softirq kernel/softirq.c:656 [inline]
 invoke_softirq kernel/softirq.c:496 [inline]
 __irq_exit_rcu+0x162/0x210 kernel/softirq.c:735
 irq_exit_rcu+0x9/0x30 kernel/softirq.c:752
 instr_sysvec_apic_timer_interrupt arch/x86/kernel/apic/apic.c:1061 [inline]
 sysvec_apic_timer_interrupt+0xa3/0xc0 arch/x86/kernel/apic/apic.c:1061
 </IRQ>
 <TASK>
 asm_sysvec_apic_timer_interrupt+0x1a/0x20 arch/x86/include/asm/idtentry.h:697
RIP: 0010:stackdepot_memcmp lib/stackdepot.c:585 [inline]
RIP: 0010:find_stack lib/stackdepot.c:618 [inline]
RIP: 0010:stack_depot_save_flags+0x1b5/0x9d0 lib/stackdepot.c:676
Code: 00 45 39 4e 10 75 ee 45 3b 6e 14 75 e8 31 c0 66 66 2e 0f 1f 84 00 00 00 00 00 66 66 2e 0f 1f 84 00 00 00 00 00 49 8b 7c c6 20 <49> 39 3c c4 75 c5 48 83 c0 01 48 39 c2 75 ec f6 c3 02 74 26 41 8b
RSP: 0018:ffffc90006dc7870 EFLAGS: 00000202
RAX: 0000000000000004 RBX: 0000000000000001 RCX: 000000007b9bc970
RDX: 000000000000000b RSI: 00000000b68975a0 RDI: ffffffff895a9470
RBP: 0000000000000820 R08: 0000000000d001a0 R09: 00000000decd001a
R10: 0000000000000200 R11: 000000000000756b R12: ffffc90006dc78c8
R13: 000000000000000b R14: ffff88802bfe14c0 R15: ffff88816d7001a0
 kasan_save_stack+0x3f/0x50 mm/kasan/common.c:58
 kasan_save_track+0x14/0x30 mm/kasan/common.c:78
 unpoison_slab_object mm/kasan/common.c:340 [inline]
 __kasan_slab_alloc+0x89/0x90 mm/kasan/common.c:366
 kasan_slab_alloc include/linux/kasan.h:253 [inline]
 slab_post_alloc_hook mm/slub.c:4569 [inline]
 slab_alloc_node mm/slub.c:4898 [inline]
 kmem_cache_alloc_noprof+0x241/0x6e0 mm/slub.c:4905
 skb_clone+0x190/0x400 net/core/skbuff.c:2107
 batadv_iv_ogm_send_to_if net/batman-adv/bat_iv_ogm.c:386 [inline]
 batadv_iv_ogm_emit net/batman-adv/bat_iv_ogm.c:419 [inline]
 batadv_iv_send_outstanding_bat_ogm_packet+0x5e5/0x860 net/batman-adv/bat_iv_ogm.c:1700
 process_one_work+0xa0e/0x1980 kernel/workqueue.c:3302
 process_scheduled_works kernel/workqueue.c:3385 [inline]
 worker_thread+0x5ef/0xe50 kernel/workqueue.c:3466
 kthread+0x370/0x450 kernel/kthread.c:436
 ret_from_fork+0x72b/0xd50 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>

Allocated by task 5926:
 kasan_save_stack+0x30/0x50 mm/kasan/common.c:57
 kasan_save_track+0x14/0x30 mm/kasan/common.c:78
 poison_kmalloc_redzone mm/kasan/common.c:398 [inline]
 __kasan_kmalloc+0xaa/0xb0 mm/kasan/common.c:415
 kmalloc_noprof include/linux/slab.h:950 [inline]
 kzalloc_noprof include/linux/slab.h:1188 [inline]
 iowarrior_probe+0x85/0x1220 drivers/usb/misc/iowarrior.c:766
 usb_probe_interface+0x303/0x8f0 drivers/usb/core/driver.c:396
 call_driver_probe drivers/base/dd.c:631 [inline]
 really_probe+0x241/0xa60 drivers/base/dd.c:709
 __driver_probe_device+0x22e/0x480 drivers/base/dd.c:871
 driver_probe_device+0x4c/0x1b0 drivers/base/dd.c:901
 __device_attach_driver+0x1df/0x340 drivers/base/dd.c:1029
 bus_for_each_drv+0x159/0x1e0 drivers/base/bus.c:500
 __device_attach+0x1e4/0x4d0 drivers/base/dd.c:1101
 device_initial_probe+0xaf/0xd0 drivers/base/dd.c:1156
 bus_probe_device+0x64/0x160 drivers/base/bus.c:613
 device_add+0x1210/0x1950 drivers/base/core.c:3706
 usb_set_configuration+0xd97/0x1c60 drivers/usb/core/message.c:2268
 usb_generic_driver_probe+0xa1/0xe0 drivers/usb/core/generic.c:250
 usb_probe_device+0xef/0x400 drivers/usb/core/driver.c:291
 call_driver_probe drivers/base/dd.c:631 [inline]
 really_probe+0x241/0xa60 drivers/base/dd.c:709
 __driver_probe_device+0x22e/0x480 drivers/base/dd.c:871
 driver_probe_device+0x4c/0x1b0 drivers/base/dd.c:901
 __device_attach_driver+0x1df/0x340 drivers/base/dd.c:1029
 bus_for_each_drv+0x159/0x1e0 drivers/base/bus.c:500
 __device_attach+0x1e4/0x4d0 drivers/base/dd.c:1101
 device_initial_probe+0xaf/0xd0 drivers/base/dd.c:1156
 bus_probe_device+0x64/0x160 drivers/base/bus.c:613
 device_add+0x1210/0x1950 drivers/base/core.c:3706
 usb_new_device.cold+0x685/0x115c drivers/usb/core/hub.c:2695
 hub_port_connect drivers/usb/core/hub.c:5567 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5707 [inline]
 port_event drivers/usb/core/hub.c:5871 [inline]
 hub_event+0x314d/0x4af0 drivers/usb/core/hub.c:5953
 process_one_work+0xa0e/0x1980 kernel/workqueue.c:3302
 process_scheduled_works kernel/workqueue.c:3385 [inline]
 worker_thread+0x5ef/0xe50 kernel/workqueue.c:3466
 kthread+0x370/0x450 kernel/kthread.c:436
 ret_from_fork+0x72b/0xd50 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

Freed by task 39:
 kasan_save_stack+0x30/0x50 mm/kasan/common.c:57
 kasan_save_track+0x14/0x30 mm/kasan/common.c:78
 kasan_save_free_info+0x3b/0x70 mm/kasan/generic.c:584
 poison_slab_object mm/kasan/common.c:253 [inline]
 __kasan_slab_free+0x5f/0x80 mm/kasan/common.c:285
 kasan_slab_free include/linux/kasan.h:235 [inline]
 slab_free_hook mm/slub.c:2689 [inline]
 slab_free mm/slub.c:6250 [inline]
 kfree+0x223/0x6c0 mm/slub.c:6565
 iowarrior_delete drivers/usb/misc/iowarrior.c:249 [inline]
 iowarrior_disconnect+0x212/0x270 drivers/usb/misc/iowarrior.c:921
 usb_unbind_interface+0x1dd/0x9e0 drivers/usb/core/driver.c:458
 device_remove drivers/base/dd.c:621 [inline]
 device_remove+0x12a/0x180 drivers/base/dd.c:613
 __device_release_driver drivers/base/dd.c:1352 [inline]
 device_release_driver_internal+0x44e/0x620 drivers/base/dd.c:1375
 bus_remove_device+0x2bc/0x560 drivers/base/bus.c:657
 device_del+0x376/0x9b0 drivers/base/core.c:3895
 usb_disable_device+0x367/0x810 drivers/usb/core/message.c:1478
 usb_disconnect+0x2e2/0x9a0 drivers/usb/core/hub.c:2345
 hub_port_connect drivers/usb/core/hub.c:5407 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5707 [inline]
 port_event drivers/usb/core/hub.c:5871 [inline]
 hub_event+0x1d0c/0x4af0 drivers/usb/core/hub.c:5953
 process_one_work+0xa0e/0x1980 kernel/workqueue.c:3302
 process_scheduled_works kernel/workqueue.c:3385 [inline]
 worker_thread+0x5ef/0xe50 kernel/workqueue.c:3466
 kthread+0x370/0x450 kernel/kthread.c:436
 ret_from_fork+0x72b/0xd50 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

The buggy address belongs to the object at ffff888050f49000
 which belongs to the cache kmalloc-1k of size 1024
The buggy address is located 360 bytes inside of
 freed 1024-byte region [ffff888050f49000, ffff888050f49400)

The buggy address belongs to the physical page:
page: refcount:0 mapcount:0 mapping:0000000000000000 index:0xffff888050f4a800 pfn:0x50f48
head: order:3 mapcount:0 entire_mapcount:0 nr_pages_mapped:0 pincount:0
flags: 0xfff00000000240(workingset|head|node=0|zone=1|lastcpupid=0x7ff)
page_type: f5(slab)
raw: 00fff00000000240 ffff88801b842dc0 ffffea00015f2410 ffffea0000d13c10
raw: ffff888050f4a800 000000080010000d 00000000f5000000 0000000000000000
head: 00fff00000000240 ffff88801b842dc0 ffffea00015f2410 ffffea0000d13c10
head: ffff888050f4a800 000000080010000d 00000000f5000000 0000000000000000
head: 00fff00000000003 fffffffffffffe01 00000000ffffffff 00000000ffffffff
head: ffffffffffffffff 0000000000000000 00000000ffffffff 0000000000000008
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 3, migratetype Unmovable, gfp_mask 0xd20c0(__GFP_IO|__GFP_FS|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP|__GFP_NOMEMALLOC), pid 5753, tgid 5753 (udevd), ts 316157882281, free_ts 314951708929
 set_page_owner include/linux/page_owner.h:32 [inline]
 post_alloc_hook+0x153/0x170 mm/page_alloc.c:1858
 prep_new_page mm/page_alloc.c:1866 [inline]
 get_page_from_freelist+0x11a6/0x33b0 mm/page_alloc.c:3946
 __alloc_frozen_pages_noprof+0x27c/0x2bc0 mm/page_alloc.c:5226
 alloc_slab_page mm/slub.c:3278 [inline]
 allocate_slab mm/slub.c:3467 [inline]
 new_slab+0xa6/0x6c0 mm/slub.c:3525
 refill_objects+0x277/0x420 mm/slub.c:7255
 refill_sheaf mm/slub.c:2816 [inline]
 __pcs_replace_empty_main+0x375/0x650 mm/slub.c:4651
 alloc_from_pcs mm/slub.c:4749 [inline]
 slab_alloc_node mm/slub.c:4883 [inline]
 __do_kmalloc_node mm/slub.c:5294 [inline]
 __kvmalloc_node_noprof+0x7da/0xa00 mm/slub.c:6832
 bucket_table_alloc.isra.0+0x88/0x460 lib/rhashtable.c:186
 rhashtable_init_noprof+0x43b/0x890 lib/rhashtable.c:1100
 simple_xattrs_init fs/xattr.c:1618 [inline]
 simple_xattrs_alloc+0x5c/0xd0 fs/xattr.c:1641
 class_simple_xattrs_constructor include/linux/xattr.h:165 [inline]
 shmem_initxattrs+0x7d/0x6c0 mm/shmem.c:4237
 security_inode_init_security+0x242/0x370 security/security.c:1370
 shmem_mknod+0x2ce/0x480 mm/shmem.c:3868
 lookup_open.isra.0+0xc47/0x11b0 fs/namei.c:4511
 open_last_lookups fs/namei.c:4611 [inline]
 path_openat+0x2291/0x31a0 fs/namei.c:4855
 do_file_open+0x20e/0x430 fs/namei.c:4887
page last free pid 8872 tgid 8872 stack trace:
 reset_page_owner include/linux/page_owner.h:25 [inline]
 __free_pages_prepare mm/page_alloc.c:1402 [inline]
 __free_frozen_pages+0x747/0x1040 mm/page_alloc.c:2943
 qlink_free mm/kasan/quarantine.c:163 [inline]
 qlist_free_all+0x47/0xf0 mm/kasan/quarantine.c:179
 kasan_quarantine_reduce+0x1a0/0x1f0 mm/kasan/quarantine.c:286
 __kasan_slab_alloc+0x69/0x90 mm/kasan/common.c:350
 kasan_slab_alloc include/linux/kasan.h:253 [inline]
 slab_post_alloc_hook mm/slub.c:4569 [inline]
 slab_alloc_node mm/slub.c:4898 [inline]
 kmem_cache_alloc_noprof+0x241/0x6e0 mm/slub.c:4905
 locks_alloc_lock fs/locks.c:285 [inline]
 flock_lock_inode+0xcdc/0x11c0 fs/locks.c:1150
 flock_lock_inode_wait fs/locks.c:2163 [inline]
 locks_lock_inode_wait+0x119/0x490 fs/locks.c:2190
 locks_lock_file_wait include/linux/filelock.h:455 [inline]
 __do_sys_flock+0x462/0x4d0 fs/locks.c:2258
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0x10b/0xf80 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Memory state around the buggy address:
 ffff888050f49000: fa fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff888050f49080: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>ffff888050f49100: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                                                          ^
 ffff888050f49180: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff888050f49200: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
==================================================================
----------------
Code disassembly (best guess):
   0:	00 45 39             	add    %al,0x39(%rbp)
   3:	4e 10 75 ee          	rex.WRX adc %r14b,-0x12(%rbp)
   7:	45 3b 6e 14          	cmp    0x14(%r14),%r13d
   b:	75 e8                	jne    0xfffffff5
   d:	31 c0                	xor    %eax,%eax
   f:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
  16:	00 00 00 00
  1a:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
  21:	00 00 00 00
  25:	49 8b 7c c6 20       	mov    0x20(%r14,%rax,8),%rdi
* 2a:	49 39 3c c4          	cmp    %rdi,(%r12,%rax,8) <-- trapping instruction
  2e:	75 c5                	jne    0xfffffff5
  30:	48 83 c0 01          	add    $0x1,%rax
  34:	48 39 c2             	cmp    %rax,%rdx
  37:	75 ec                	jne    0x25
  39:	f6 c3 02             	test   $0x2,%bl
  3c:	74 26                	je     0x64
  3e:	41                   	rex.B
  3f:	8b                   	.byte 0x8b


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

If the report is already addressed, let syzbot know by replying with:
#syz fix: exact-commit-title

If you want to overwrite report's subsystems, reply with:
#syz set subsystems: new-subsystem
(See the list of subsystem names on the web dashboard)

If the report is a duplicate of another one, reply with:
#syz dup: exact-subject-of-another-report

If you want to undo deduplication, reply with:
#syz undup

