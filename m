Return-Path: <linux-usb+bounces-13980-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B78D95D07E
	for <lists+linux-usb@lfdr.de>; Fri, 23 Aug 2024 16:59:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 568B3B237D1
	for <lists+linux-usb@lfdr.de>; Fri, 23 Aug 2024 14:58:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A81A188A15;
	Fri, 23 Aug 2024 14:58:23 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com [209.85.166.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95A591885B8
	for <linux-usb@vger.kernel.org>; Fri, 23 Aug 2024 14:58:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724425103; cv=none; b=kISPlqzcnI3aaqUmmfS7VAMP075mzo8iZG6KO606ubxJZFRzIihMHOULxptliS6T+BK8fKoONAjQc/QPtQPljnOGckgl+NTlNlFAAR7yqL/Bm/CxFpnY0MLHhBTEArfWWzhW5ihxnzvYTq472g+xzKLAcIpLuwePtfAWoMKAkgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724425103; c=relaxed/simple;
	bh=PBYiwrieWuPQf2ZOOL3gVk3SA+VB3sfEoq5rpMTrjok=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=G+xgkxntkzupQI+G0g3wn1tCbruAE+xMlwmprheCNGYHTsfr3VBCX9TgEH42RYh6TQyy2CR9EIVIkqw1CgslP75GHaY4pAJhbcXoftGRnnkL9VnCyAKE2LXSxQ0k1/Rckq2On6MM6fG4ZSRIVdErR5vpFS8NHqk7t0LHeX2uIqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f197.google.com with SMTP id e9e14a558f8ab-39d5537a659so21787585ab.1
        for <linux-usb@vger.kernel.org>; Fri, 23 Aug 2024 07:58:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724425100; x=1725029900;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0xOiR3drQ5YeZ+G6K4t5gNIPBK6dr94FxT/Xp/o740s=;
        b=sQjEACgQMuT0Jds64+RqUNyApulN8NBuHMB+KvUG/VzT5IIxubA9wMJCp286MfWJHN
         kpPZTYw6gfUEh4/IlmSC0JHnTV1eX6sLvPd3BTbpjig0LMZZTEIKZKYJIXAAgfkY2sTc
         uYMUGnkB+reuqVDef0uKM2Kz5dQvcI2YRMI2XPfNWONfZuMzynLTgjDPEEy8sZbrpuUz
         xXFe0hRSBklxsSD7ksZR4tQxSJKovNU6G/EDuixolnQypNOh0ieeZ2qJkxZNHZylP1bC
         geG4X3LCAUThB3TqcsZaRnSS9+n6isSqiCmZPmiLdDJCPsIfGFCPYGiuY/SYfzwlXw+5
         M/jQ==
X-Forwarded-Encrypted: i=1; AJvYcCXCzKN/CZepZKBJLqYFO8+FBrnHpUwRFTpsC6TfaSFx8cY5+6IrEmUiZqn72eNzzrw+tt2v7hKuqnM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxydfnC+mbVsMTvYlFnj6QFYSUPwpwGHSx77AY7d3ZPbeH+VdGY
	bm5pKNhHCYhnZOTJSS+835vnx4+bsEpwVHOnsmEKP91VQ5ivF4ckFS0MnIBT1U1aTLEn/bB9e+J
	3EMUR3M1RcImNvY2DBnK2VgS9YHIBg5S3Kjc2YaGXGijpys6Inopj18k=
X-Google-Smtp-Source: AGHT+IE9j7K3XbWSRk13r8vW6Yw1F11nuHHQiZPsEdvWNTaF0I41tDkX/HtqT5aq10CdaDO2Tm4R5sxE2c2WONubZ4nBCtc5NEAR
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:216a:b0:39a:ea7d:2a9a with SMTP id
 e9e14a558f8ab-39e3ca0d1c2mr1579345ab.6.1724425100690; Fri, 23 Aug 2024
 07:58:20 -0700 (PDT)
Date: Fri, 23 Aug 2024 07:58:20 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000091994406205b01fe@google.com>
Subject: [syzbot] [usb?] KASAN: slab-use-after-free Read in raw_queue_event
From: syzbot <syzbot+62ff4e5cf4fec6052ff2@syzkaller.appspotmail.com>
To: andreyknvl@gmail.com, gregkh@linuxfoundation.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    c6653f49e4fd Merge tag 'powerpc-6.10-4' of git://git.kerne..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=108a17c1980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=1ace69f521989b1f
dashboard link: https://syzkaller.appspot.com/bug?extid=62ff4e5cf4fec6052ff2
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/a56f9eb616fa/disk-c6653f49.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/2f09515c2f1b/vmlinux-c6653f49.xz
kernel image: https://storage.googleapis.com/syzbot-assets/fdc471b5cbac/bzImage-c6653f49.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+62ff4e5cf4fec6052ff2@syzkaller.appspotmail.com

==================================================================
BUG: KASAN: slab-use-after-free in raw_event_queue_add drivers/usb/gadget/legacy/raw_gadget.c:81 [inline]
BUG: KASAN: slab-use-after-free in raw_queue_event+0x299/0x2e0 drivers/usb/gadget/legacy/raw_gadget.c:239
Read of size 4 at addr ffff888066f5c978 by task kworker/1:6/5145

CPU: 1 PID: 5145 Comm: kworker/1:6 Not tainted 6.10.0-rc6-syzkaller-00223-gc6653f49e4fd #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 06/07/2024
Workqueue: usb_hub_wq hub_event
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:88 [inline]
 dump_stack_lvl+0x241/0x360 lib/dump_stack.c:114
 print_address_description mm/kasan/report.c:377 [inline]
 print_report+0x169/0x550 mm/kasan/report.c:488
 kasan_report+0x143/0x180 mm/kasan/report.c:601
 raw_event_queue_add drivers/usb/gadget/legacy/raw_gadget.c:81 [inline]
 raw_queue_event+0x299/0x2e0 drivers/usb/gadget/legacy/raw_gadget.c:239
 gadget_disconnect+0x50/0xb0 drivers/usb/gadget/legacy/raw_gadget.c:387
 set_link_state+0xc81/0x1200
 dummy_hub_control+0xb86/0x1b10
 rh_call_control drivers/usb/core/hcd.c:656 [inline]
 rh_urb_enqueue drivers/usb/core/hcd.c:821 [inline]
 usb_hcd_submit_urb+0xffc/0x1e80 drivers/usb/core/hcd.c:1529
 usb_start_wait_urb+0x113/0x520 drivers/usb/core/message.c:59
 usb_internal_control_msg drivers/usb/core/message.c:103 [inline]
 usb_control_msg+0x2b1/0x4c0 drivers/usb/core/message.c:154
 usb_clear_port_feature drivers/usb/core/hub.c:453 [inline]
 usb_hub_set_port_power drivers/usb/core/hub.c:891 [inline]
 hub_port_connect drivers/usb/core/hub.c:5561 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5661 [inline]
 port_event drivers/usb/core/hub.c:5821 [inline]
 hub_event+0x30f2/0x5150 drivers/usb/core/hub.c:5903
 process_one_work kernel/workqueue.c:3248 [inline]
 process_scheduled_works+0xa2c/0x1830 kernel/workqueue.c:3329
 worker_thread+0x86d/0xd50 kernel/workqueue.c:3409
 kthread+0x2f0/0x390 kernel/kthread.c:389
 ret_from_fork+0x4b/0x80 arch/x86/kernel/process.c:147
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:244
 </TASK>

Allocated by task 10173:
 kasan_save_stack mm/kasan/common.c:47 [inline]
 kasan_save_track+0x3f/0x80 mm/kasan/common.c:68
 poison_kmalloc_redzone mm/kasan/common.c:370 [inline]
 __kasan_kmalloc+0x98/0xb0 mm/kasan/common.c:387
 kasan_kmalloc include/linux/kasan.h:211 [inline]
 kmalloc_trace_noprof+0x19c/0x2c0 mm/slub.c:4154
 kmalloc_noprof include/linux/slab.h:660 [inline]
 kzalloc_noprof include/linux/slab.h:778 [inline]
 dev_new drivers/usb/gadget/legacy/raw_gadget.c:192 [inline]
 raw_open+0x8c/0x4d0 drivers/usb/gadget/legacy/raw_gadget.c:434
 misc_open+0x313/0x390 drivers/char/misc.c:165
 chrdev_open+0x5b0/0x630 fs/char_dev.c:414
 do_dentry_open+0x970/0x1450 fs/open.c:955
 vfs_open+0x3e/0x330 fs/open.c:1086
 do_open fs/namei.c:3654 [inline]
 path_openat+0x2c01/0x35f0 fs/namei.c:3813
 do_filp_open+0x235/0x490 fs/namei.c:3840
 do_sys_openat2+0x13e/0x1d0 fs/open.c:1413
 do_sys_open fs/open.c:1428 [inline]
 __do_sys_openat fs/open.c:1444 [inline]
 __se_sys_openat fs/open.c:1439 [inline]
 __x64_sys_openat+0x247/0x2a0 fs/open.c:1439
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xf3/0x230 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Freed by task 10139:
 kasan_save_stack mm/kasan/common.c:47 [inline]
 kasan_save_track+0x3f/0x80 mm/kasan/common.c:68
 kasan_save_free_info+0x40/0x50 mm/kasan/generic.c:579
 poison_slab_object+0xe0/0x150 mm/kasan/common.c:240
 __kasan_slab_free+0x37/0x60 mm/kasan/common.c:256
 kasan_slab_free include/linux/kasan.h:184 [inline]
 slab_free_hook mm/slub.c:2196 [inline]
 slab_free mm/slub.c:4438 [inline]
 kfree+0x149/0x360 mm/slub.c:4559
 raw_release+0x138/0x1e0 drivers/usb/gadget/legacy/raw_gadget.c:473
 __fput+0x24a/0x8a0 fs/file_table.c:422
 task_work_run+0x24f/0x310 kernel/task_work.c:180
 exit_task_work include/linux/task_work.h:38 [inline]
 do_exit+0xa27/0x27e0 kernel/exit.c:876
 do_group_exit+0x207/0x2c0 kernel/exit.c:1025
 get_signal+0x16a1/0x1740 kernel/signal.c:2909
 arch_do_signal_or_restart+0x96/0x860 arch/x86/kernel/signal.c:310
 exit_to_user_mode_loop kernel/entry/common.c:111 [inline]
 exit_to_user_mode_prepare include/linux/entry-common.h:328 [inline]
 __syscall_exit_to_user_mode_work kernel/entry/common.c:207 [inline]
 syscall_exit_to_user_mode+0xc9/0x360 kernel/entry/common.c:218
 do_syscall_64+0x100/0x230 arch/x86/entry/common.c:89
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

The buggy address belongs to the object at ffff888066f5c000
 which belongs to the cache kmalloc-4k of size 4096
The buggy address is located 2424 bytes inside of
 freed 4096-byte region [ffff888066f5c000, ffff888066f5d000)

The buggy address belongs to the physical page:
page: refcount:1 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x66f58
head: order:3 mapcount:0 entire_mapcount:0 nr_pages_mapped:0 pincount:0
flags: 0xfff00000000040(head|node=0|zone=1|lastcpupid=0x7ff)
page_type: 0xffffefff(slab)
raw: 00fff00000000040 ffff888015042140 ffffea0000bf8000 dead000000000002
raw: 0000000000000000 0000000000040004 00000001ffffefff 0000000000000000
head: 00fff00000000040 ffff888015042140 ffffea0000bf8000 dead000000000002
head: 0000000000000000 0000000000040004 00000001ffffefff 0000000000000000
head: 00fff00000000003 ffffea00019bd601 ffffffffffffffff 0000000000000000
head: 0000000000000008 0000000000000000 00000000ffffffff 0000000000000000
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 3, migratetype Unmovable, gfp_mask 0x1d2040(__GFP_IO|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP|__GFP_NOMEMALLOC|__GFP_HARDWALL), pid 5177, tgid 5174 (syz.0.1), ts 69708451232, free_ts 15196910197
 set_page_owner include/linux/page_owner.h:32 [inline]
 post_alloc_hook+0x1f3/0x230 mm/page_alloc.c:1473
 prep_new_page mm/page_alloc.c:1481 [inline]
 get_page_from_freelist+0x2e4c/0x2f10 mm/page_alloc.c:3425
 __alloc_pages_noprof+0x256/0x6c0 mm/page_alloc.c:4683
 __alloc_pages_node_noprof include/linux/gfp.h:269 [inline]
 alloc_pages_node_noprof include/linux/gfp.h:296 [inline]
 alloc_slab_page+0x5f/0x120 mm/slub.c:2265
 allocate_slab+0x5a/0x2f0 mm/slub.c:2428
 new_slab mm/slub.c:2481 [inline]
 ___slab_alloc+0xcd1/0x14b0 mm/slub.c:3667
 __slab_alloc+0x58/0xa0 mm/slub.c:3757
 __slab_alloc_node mm/slub.c:3810 [inline]
 slab_alloc_node mm/slub.c:3990 [inline]
 __do_kmalloc_node mm/slub.c:4122 [inline]
 __kmalloc_noprof+0x257/0x400 mm/slub.c:4136
 kmalloc_noprof include/linux/slab.h:664 [inline]
 tomoyo_realpath_from_path+0xcf/0x5e0 security/tomoyo/realpath.c:251
 tomoyo_get_realpath security/tomoyo/file.c:151 [inline]
 tomoyo_path_number_perm+0x23a/0x880 security/tomoyo/file.c:723
 security_file_ioctl+0x75/0xb0 security/security.c:2765
 __do_sys_ioctl fs/ioctl.c:901 [inline]
 __se_sys_ioctl+0x47/0x170 fs/ioctl.c:893
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xf3/0x230 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
page last free pid 1 tgid 1 stack trace:
 reset_page_owner include/linux/page_owner.h:25 [inline]
 free_pages_prepare mm/page_alloc.c:1093 [inline]
 free_unref_page+0xd19/0xea0 mm/page_alloc.c:2588
 free_contig_range+0x9e/0x160 mm/page_alloc.c:6642
 destroy_args+0x8a/0x890 mm/debug_vm_pgtable.c:1017
 debug_vm_pgtable+0x4be/0x550 mm/debug_vm_pgtable.c:1397
 do_one_initcall+0x248/0x880 init/main.c:1267
 do_initcall_level+0x157/0x210 init/main.c:1329
 do_initcalls+0x3f/0x80 init/main.c:1345
 kernel_init_freeable+0x435/0x5d0 init/main.c:1578
 kernel_init+0x1d/0x2b0 init/main.c:1467
 ret_from_fork+0x4b/0x80 arch/x86/kernel/process.c:147
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:244

Memory state around the buggy address:
 ffff888066f5c800: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff888066f5c880: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>ffff888066f5c900: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                                                                ^
 ffff888066f5c980: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff888066f5ca00: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
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

