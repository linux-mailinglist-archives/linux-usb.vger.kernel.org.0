Return-Path: <linux-usb+bounces-35462-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cNR9GsAJxGk+vgQAu9opvQ
	(envelope-from <linux-usb+bounces-35462-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 25 Mar 2026 17:13:52 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C2688328C80
	for <lists+linux-usb@lfdr.de>; Wed, 25 Mar 2026 17:13:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9CD0C310FC5F
	for <lists+linux-usb@lfdr.de>; Wed, 25 Mar 2026 15:39:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CC473E123F;
	Wed, 25 Mar 2026 15:39:28 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ot1-f78.google.com (mail-ot1-f78.google.com [209.85.210.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ADA63D5656
	for <linux-usb@vger.kernel.org>; Wed, 25 Mar 2026 15:39:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774453167; cv=none; b=TxSlajQpmxP1PsHxCEI1L5bltOls1XSdxpdkgXj8F12vRspL7r6X4sjE5eb1f6m7QBt4zH7nT2e0ZDwZ/wlB/kuL+Q823v38j1IUkD/41R4pc7wEp2NbtwEBLEF6aC/yimUxSxeiY/ixsJ8en9NEyt8u5dznM9hCRjdUoAwMywM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774453167; c=relaxed/simple;
	bh=MQ2WrRLMmAij9+Yf4SVkVU/H49QSoDRWBjRGhvEAJvg=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=H5e5XA114yIpXXlToFGLmD2SzR2ACk9VwILeD7exZ8J5SYR2rSCkVSVVf/7fqT0eaGIR/yjlW0SabwEjc7K0UKBIvuBGlyXOiYjWY5d0I//QrMn5J73j4QVS3HNhulq7xOADaj/LYywQ1qpGpuawb8Oa6uMPL4YhuL8W7zLnBYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.210.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f78.google.com with SMTP id 46e09a7af769-7d74211ff80so16262035a34.3
        for <linux-usb@vger.kernel.org>; Wed, 25 Mar 2026 08:39:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774453165; x=1775057965;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5Qj4mJDbSRN1H6qT32LOefn9Cq1qEQoaknxUOl97iLU=;
        b=j47Fm9phGVJm6FEfuUHh8uz4aw29RWTfgv/LME7BwgsmW//XIy0iHWA2ZBfTBSwjee
         OBlhVPIARbX2dO+iav4NbtEr9GA8FhbQsTamzUZ+aeTP+F1FvU/ZTkVZ/syvOycGITnk
         mBWtAh11atsdO6qcGUC4Pn8HlQelgBe5Xx83rbnLBzPhM0U/eq5r1MxgjUxxhtb88pl0
         aJJ+NhR6C8bNG9eWW0DH6WpUVoU/Oh0DAlEnzuRTDVzwcurchuqJ6vkTuUoY2kjAG4ck
         G/MjWHCJuqj8ufYmyieZLHPrUXoh4WTv+yjEwtdpG0hUFELQbTd5QW6I589198b0djqc
         TL8w==
X-Forwarded-Encrypted: i=1; AJvYcCXZgkd079sHz2hn+zWe4iq8hLa8r7nBctCTl75EMn/DMLKapVeArWY1LRKjeyJMf050Q3qPkylMFCE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzNaqD2x79zKwVi2t/pF4bnnWYya59NXctxzPb1Cfuv5X/9ulfX
	L+80tl4HCw/lYCSYQrI6JJmVU6Zqb2I9vSnm8xxBM7zbAz4/b5SZrcdkgzZPoRyEW83xNwxZYci
	sJ/p9j5eyJ3X8eE27wPEP/vAV8xXD6TTEjKGpsQIRG36WFLASdLEVn/PcioY=
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:2213:b0:67d:f465:77d7 with SMTP id
 006d021491bc7-67dff5c9dc8mr1930018eaf.69.1774453165194; Wed, 25 Mar 2026
 08:39:25 -0700 (PDT)
Date: Wed, 25 Mar 2026 08:39:25 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <69c401ad.a70a0220.23629d.0000.GAE@google.com>
Subject: [syzbot] [usb?] KASAN: invalid-free in dev_free (3)
From: syzbot <syzbot+25612fe5ab3dcafc3aab@syzkaller.appspotmail.com>
To: andreyknvl@gmail.com, gregkh@linuxfoundation.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-0.36 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	URI_HIDDEN_PATH(1.00)[https://syzkaller.appspot.com/x/.config?x=c584910d0d74158d];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[appspotmail.com : SPF not aligned (relaxed), No valid DKIM,none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35462-lists,linux-usb=lfdr.de,25612fe5ab3dcafc3aab];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,linuxfoundation.org,vger.kernel.org,googlegroups.com];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[googlegroups.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,goo.gl:url,appspotmail.com:email,storage.googleapis.com:url,syzkaller.appspot.com:url];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[syzbot@syzkaller.appspotmail.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_NONE(0.00)[];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	REDIRECTOR_URL(0.00)[goo.gl];
	TAGGED_RCPT(0.00)[linux-usb];
	SUBJECT_HAS_QUESTION(0.00)[]
X-Rspamd-Queue-Id: C2688328C80
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hello,

syzbot found the following issue on:

HEAD commit:    785f0eb2f85d Add linux-next specific files for 20260320
git tree:       linux-next
console output: https://syzkaller.appspot.com/x/log.txt?x=112d01d6580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=c584910d0d74158d
dashboard link: https://syzkaller.appspot.com/bug?extid=25612fe5ab3dcafc3aab
compiler:       Debian clang version 21.1.8 (++20251221033036+2078da43e25a-1~exp1~20251221153213.50), Debian LLD 21.1.8

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/a1f7fd9c1a63/disk-785f0eb2.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/6c138da87c25/vmlinux-785f0eb2.xz
kernel image: https://storage.googleapis.com/syzbot-assets/4d1be64e56db/bzImage-785f0eb2.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+25612fe5ab3dcafc3aab@syzkaller.appspotmail.com

==================================================================
BUG: KASAN: double-free in dev_free+0x424/0x740 drivers/usb/gadget/legacy/raw_gadget.c:226
Free of addr ffff888049a1c7e0 by task syz.8.3380/23768

CPU: 1 UID: 0 PID: 23768 Comm: syz.8.3380 Tainted: G             L      syzkaller #0 PREEMPT(full) 
Tainted: [L]=SOFTLOCKUP
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 02/12/2026
Call Trace:
 <TASK>
 dump_stack_lvl+0xe8/0x150 lib/dump_stack.c:120
 print_address_description+0x55/0x1e0 mm/kasan/report.c:378
 print_report+0x58/0x70 mm/kasan/report.c:482
 kasan_report_invalid_free+0xea/0x110 mm/kasan/report.c:557
 check_slab_allocation mm/kasan/common.c:-1 [inline]
 __kasan_slab_pre_free+0x104/0x120 mm/kasan/common.c:261
 kasan_slab_pre_free include/linux/kasan.h:199 [inline]
 slab_free_hook mm/slub.c:2634 [inline]
 slab_free mm/slub.c:6242 [inline]
 kfree+0x173/0x640 mm/slub.c:6557
 dev_free+0x424/0x740 drivers/usb/gadget/legacy/raw_gadget.c:226
 kref_put include/linux/kref.h:65 [inline]
 raw_release+0x199/0x260 drivers/usb/gadget/legacy/raw_gadget.c:474
 __fput+0x451/0x8c0 fs/file_table.c:500
 task_work_run+0x1d9/0x270 kernel/task_work.c:233
 exit_task_work include/linux/task_work.h:40 [inline]
 do_exit+0x926/0x2490 kernel/exit.c:974
 do_group_exit+0x21b/0x2d0 kernel/exit.c:1116
 get_signal+0x1284/0x1330 kernel/signal.c:3036
 arch_do_signal_or_restart+0xbc/0x830 arch/x86/kernel/signal.c:337
 __exit_to_user_mode_loop kernel/entry/common.c:64 [inline]
 exit_to_user_mode_loop+0x86/0x480 kernel/entry/common.c:98
 __exit_to_user_mode_prepare include/linux/irq-entry-common.h:238 [inline]
 syscall_exit_to_user_mode_prepare include/linux/irq-entry-common.h:269 [inline]
 syscall_exit_to_user_mode include/linux/entry-common.h:325 [inline]
 do_syscall_64+0x32d/0xf80 arch/x86/entry/syscall_64.c:100
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fb1e575cfce
Code: Unable to access opcode bytes at 0x7fb1e575cfa4.
RSP: 002b:00007fb1e65cbf78 EFLAGS: 00000246 ORIG_RAX: 00000000000000e6
RAX: fffffffffffffdfc RBX: 00007fb1e65cc6c0 RCX: 00007fb1e575cfce
RDX: 00007fb1e65cbfd0 RSI: 0000000000000000 RDI: 0000000000000000
RBP: 00007fb1e5832c99 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007fb1e5a16038 R14: 00007fb1e5a15fa0 R15: 00007ffe224b9cb8
 </TASK>

Allocated by task 23773:
 kasan_save_stack mm/kasan/common.c:57 [inline]
 kasan_save_track+0x3e/0x80 mm/kasan/common.c:78
 poison_kmalloc_redzone mm/kasan/common.c:398 [inline]
 __kasan_kmalloc+0x93/0xb0 mm/kasan/common.c:415
 kasan_kmalloc include/linux/kasan.h:263 [inline]
 __do_kmalloc_node mm/slub.c:5292 [inline]
 __kmalloc_node_track_caller_noprof+0x4db/0x7b0 mm/slub.c:5400
 memdup_user+0x2b/0xd0 mm/util.c:221
 raw_ioctl_ep_enable drivers/usb/gadget/legacy/raw_gadget.c:848 [inline]
 raw_ioctl+0xdc5/0x41c0 drivers/usb/gadget/legacy/raw_gadget.c:1319
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:597 [inline]
 __se_sys_ioctl+0xfc/0x170 fs/ioctl.c:583
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0x14d/0xf80 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Freed by task 23768:
 kasan_save_stack mm/kasan/common.c:57 [inline]
 kasan_save_track+0x3e/0x80 mm/kasan/common.c:78
 kasan_save_free_info+0x46/0x50 mm/kasan/generic.c:584
 poison_slab_object mm/kasan/common.c:253 [inline]
 __kasan_slab_free+0x5c/0x80 mm/kasan/common.c:285
 kasan_slab_free include/linux/kasan.h:235 [inline]
 slab_free_hook mm/slub.c:2689 [inline]
 slab_free mm/slub.c:6242 [inline]
 kfree+0x1c5/0x640 mm/slub.c:6557
 dev_free+0x424/0x740 drivers/usb/gadget/legacy/raw_gadget.c:226
 kref_put include/linux/kref.h:65 [inline]
 raw_release+0x199/0x260 drivers/usb/gadget/legacy/raw_gadget.c:474
 __fput+0x451/0x8c0 fs/file_table.c:500
 fput_close_sync+0x11f/0x240 fs/file_table.c:605
 __do_sys_close fs/open.c:1509 [inline]
 __se_sys_close fs/open.c:1494 [inline]
 __x64_sys_close+0x7e/0x110 fs/open.c:1494
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0x14d/0xf80 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

The buggy address belongs to the object at ffff888049a1c7e0
 which belongs to the cache kmalloc-16 of size 16
The buggy address is located 0 bytes inside of
 16-byte region [ffff888049a1c7e0, ffff888049a1c7f0)

The buggy address belongs to the physical page:
page: refcount:0 mapcount:0 mapping:0000000000000000 index:0xffff888049a1cd60 pfn:0x49a1c
flags: 0xfff00000000200(workingset|node=0|zone=1|lastcpupid=0x7ff)
page_type: f5(slab)
raw: 00fff00000000200 ffff88801b041640 ffffea0000c63590 ffffea0000ae3d10
raw: ffff888049a1cd60 000000080080006f 00000000f5000000 0000000000000000
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 0, migratetype Unmovable, gfp_mask 0xd2cc0(GFP_KERNEL|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP|__GFP_NOMEMALLOC), pid 17478, tgid 17477 (syz.2.2109), ts 1143246103783, free_ts 1143039730432
 set_page_owner include/linux/page_owner.h:32 [inline]
 post_alloc_hook+0x231/0x280 mm/page_alloc.c:1859
 prep_new_page mm/page_alloc.c:1867 [inline]
 get_page_from_freelist+0x2418/0x24b0 mm/page_alloc.c:3926
 __alloc_frozen_pages_noprof+0x233/0x3d0 mm/page_alloc.c:5213
 alloc_slab_page mm/slub.c:3278 [inline]
 allocate_slab+0x77/0x660 mm/slub.c:3467
 new_slab mm/slub.c:3525 [inline]
 refill_objects+0x339/0x3d0 mm/slub.c:7247
 refill_sheaf mm/slub.c:2816 [inline]
 __pcs_replace_empty_main+0x321/0x720 mm/slub.c:4651
 alloc_from_pcs mm/slub.c:4749 [inline]
 slab_alloc_node mm/slub.c:4883 [inline]
 __kmalloc_cache_noprof+0x392/0x660 mm/slub.c:5407
 kmalloc_noprof include/linux/slab.h:950 [inline]
 kzalloc_noprof include/linux/slab.h:1188 [inline]
 uapi_add_elm drivers/infiniband/core/uverbs_uapi.c:24 [inline]
 uapi_merge_method drivers/infiniband/core/uverbs_uapi.c:155 [inline]
 uapi_merge_obj_tree drivers/infiniband/core/uverbs_uapi.c:214 [inline]
 uapi_merge_def+0x1225/0x1890 drivers/infiniband/core/uverbs_uapi.c:297
 uapi_merge_def+0x2a7/0x1890 drivers/infiniband/core/uverbs_uapi.c:286
 uverbs_alloc_api+0x1a6/0x1a60 drivers/infiniband/core/uverbs_uapi.c:658
 ib_uverbs_create_uapi drivers/infiniband/core/uverbs_main.c:1138 [inline]
 ib_uverbs_add_one+0x40f/0x700 drivers/infiniband/core/uverbs_main.c:1194
 add_client_context+0x37c/0x7a0 drivers/infiniband/core/device.c:730
 enable_device_and_get+0x19c/0x3e0 drivers/infiniband/core/device.c:1340
 ib_register_device+0x110f/0x13e0 drivers/infiniband/core/device.c:1459
 siw_device_register drivers/infiniband/sw/siw/siw_main.c:71 [inline]
 siw_newlink+0x8fe/0xde0 drivers/infiniband/sw/siw/siw_main.c:430
 nldev_newlink+0x5bc/0x650 drivers/infiniband/core/nldev.c:1812
page last free pid 5921 tgid 5921 stack trace:
 reset_page_owner include/linux/page_owner.h:25 [inline]
 __free_pages_prepare mm/page_alloc.c:1403 [inline]
 __free_frozen_pages+0xbc7/0xd30 mm/page_alloc.c:2944
 vfree+0x1d1/0x2f0 mm/vmalloc.c:3472
 delayed_vfree_work+0x55/0x80 mm/vmalloc.c:3392
 process_one_work+0x9a3/0x1710 kernel/workqueue.c:3288
 process_scheduled_works kernel/workqueue.c:3379 [inline]
 worker_thread+0xba8/0x11e0 kernel/workqueue.c:3465
 kthread+0x388/0x470 kernel/kthread.c:436
 ret_from_fork+0x51e/0xb90 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

Memory state around the buggy address:
 ffff888049a1c680: fa fb fc fc 00 00 fc fc fa fb fc fc 00 00 fc fc
 ffff888049a1c700: fa fb fc fc 00 00 fc fc fa fb fc fc fa fb fc fc
>ffff888049a1c780: 00 00 fc fc 00 07 fc fc 00 00 fc fc fa fb fc fc
                                                       ^
 ffff888049a1c800: 00 00 fc fc 00 06 fc fc 00 00 fc fc 00 00 fc fc
 ffff888049a1c880: 00 00 fc fc 00 00 fc fc fa fb fc fc fa fb fc fc
==================================================================


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

