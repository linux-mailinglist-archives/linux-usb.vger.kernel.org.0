Return-Path: <linux-usb+bounces-17215-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D5C89BE5DD
	for <lists+linux-usb@lfdr.de>; Wed,  6 Nov 2024 12:47:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4A84E1C227FA
	for <lists+linux-usb@lfdr.de>; Wed,  6 Nov 2024 11:47:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23D6B1DEFC5;
	Wed,  6 Nov 2024 11:47:26 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com [209.85.166.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06E611D2784
	for <linux-usb@vger.kernel.org>; Wed,  6 Nov 2024 11:47:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730893645; cv=none; b=Y/cl64L7PGeP/FHD5rbIizyKXJNcMt1Z2vUqQ3lwnj/e7fHc4X1gwX7vJIAxr46Pej8okw7LR1taVI+dB6VPBPVpPBEX2BPpw/ESmk9f+cDc6WFQnwYc5Z1YX2WweibqzX83RS+8QMBtBpXsFswE8lx62mytOActAT1r9ghAekc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730893645; c=relaxed/simple;
	bh=zQtGfJPfnHLhLns5XEJVmtRKlE2e2lMWDmWoVS0hBgQ=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=lrydP/JnVvgsL+0hEhISfgae1VLOZ4BN4pr6BEoWJdV4JlT68/ZFKuFnXf4RaT0o+Ma0CN9PjFQXsfoZgW5uwK8KGJ+YyG/V5pfKAaRoBaw3eCeuFide8CoHJN8sZzx71khSP0MbZN5Kn72KVWhlOztc0erexGHVs5cdMOe6Jts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f199.google.com with SMTP id e9e14a558f8ab-3a6bd5be0faso58736125ab.3
        for <linux-usb@vger.kernel.org>; Wed, 06 Nov 2024 03:47:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730893643; x=1731498443;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2Eg6NJKxWidr3qsyHkfEDGdOgJ+UqEwrnRl6ZxsC00w=;
        b=F23Pd3lS/ywu3Lr78H0UH0dXEDtU5+vnpksqWvQwo2ibTCx3TuV8bEp6f59xzqicQF
         m0ePsJHSuQMaaYFBiQmwhG/DH0Q0FFABHrks43uw8bKKHfArTwbcsf0H3j9D89Oq+e7Y
         zHGPICeNPIS7UEyRLy6jJ1OmZlRFIefdRdrn/Dy3iTaSzhPA1V+o9Yg6ILGWxOA0OajR
         QZFG8MRyRHhMo208KMRoHrwvYZJW5MDC17K2BpGG8KpwC1R4QazhNoi/PA0zX9RVUr7b
         EHG0G2J8FWXQ8ob/lotE/rWMlB52fsxnrDwkbAZrMrAL3ZbPgi34lXI/iju0DUqvAI80
         8Wiw==
X-Forwarded-Encrypted: i=1; AJvYcCXeC/3JEfj48ZuP85wBu24B/4c5e3+2eF1ynGLUDMLyzgjsSNSFZIXH6sX5hTtAZGdEgGEDJodVggQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1JUJZddK93NNiiC6YnW6/NNc9PJtIiFEC1gUVeIXTUfT7fVv6
	QpB4W3JSJ/1ZcKK/ZK4YDIQcVFhD3oXfeixXFMAx9GdzDCyc+LwwotTxPnPqfMQqAU2uDvg3toM
	i1imUIso9S8oGZmEq0I++JGHNDkU1gJdySb9+ilIjD+82HsurWnr36kQ=
X-Google-Smtp-Source: AGHT+IF4S0FaMFI5ZlCJSh+hl2qFn9Sj5TQnOv0vG3mKXxXJJF9UudQxl1pAHqV3jmPxRcqMCRAtceTalsW7giLiJblum3d1MdUu
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1d81:b0:3a6:cb15:42d2 with SMTP id
 e9e14a558f8ab-3a6cb154862mr111725605ab.6.1730893643165; Wed, 06 Nov 2024
 03:47:23 -0800 (PST)
Date: Wed, 06 Nov 2024 03:47:23 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <672b574b.050a0220.2edce.1523.GAE@google.com>
Subject: [syzbot] [scsi?] [usb?] KASAN: slab-use-after-free Read in sg_release
From: syzbot <syzbot+7efb5850a17ba6ce098b@syzkaller.appspotmail.com>
To: James.Bottomley@HansenPartnership.com, dgilbert@interlog.com, 
	linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org, 
	linux-usb@vger.kernel.org, martin.petersen@oracle.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    11066801dd4b Merge tag 'linux_kselftest-fixes-6.12-rc6' of..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=16146aa7980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=672325e7ab17fdf7
dashboard link: https://syzkaller.appspot.com/bug?extid=7efb5850a17ba6ce098b
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=14e8755f980000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/d5100fe708c2/disk-11066801.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/581317b0fef2/vmlinux-11066801.xz
kernel image: https://storage.googleapis.com/syzbot-assets/c7571fdba64f/bzImage-11066801.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+7efb5850a17ba6ce098b@syzkaller.appspotmail.com

==================================================================
BUG: KASAN: slab-use-after-free in lock_release+0x151/0xa30 kernel/locking/lockdep.c:5838
Read of size 8 at addr ffff8880312a38c0 by task syz.2.335/8457

CPU: 1 UID: 0 PID: 8457 Comm: syz.2.335 Not tainted 6.12.0-rc5-syzkaller-00299-g11066801dd4b #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 09/13/2024
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x241/0x360 lib/dump_stack.c:120
 print_address_description mm/kasan/report.c:377 [inline]
 print_report+0x169/0x550 mm/kasan/report.c:488
 kasan_report+0x143/0x180 mm/kasan/report.c:601
 lock_release+0x151/0xa30 kernel/locking/lockdep.c:5838
 __mutex_unlock_slowpath+0xe2/0x750 kernel/locking/mutex.c:912
 sg_release+0x1f4/0x2e0 drivers/scsi/sg.c:407
 __fput+0x23f/0x880 fs/file_table.c:431
 task_work_run+0x24f/0x310 kernel/task_work.c:239
 resume_user_mode_work include/linux/resume_user_mode.h:50 [inline]
 exit_to_user_mode_loop kernel/entry/common.c:114 [inline]
 exit_to_user_mode_prepare include/linux/entry-common.h:328 [inline]
 __syscall_exit_to_user_mode_work kernel/entry/common.c:207 [inline]
 syscall_exit_to_user_mode+0x168/0x370 kernel/entry/common.c:218
 do_syscall_64+0x100/0x230 arch/x86/entry/common.c:89
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f312af7e719
Code: ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 a8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007ffdb5d17628 EFLAGS: 00000246 ORIG_RAX: 00000000000001b4
RAX: 0000000000000000 RBX: 00007f312b137a80 RCX: 00007f312af7e719
RDX: 0000000000000000 RSI: 000000000000001e RDI: 0000000000000003
RBP: 00007f312b137a80 R08: 0000000000000000 R09: 00007ffdb5d1791f
R10: 000000000003fdc8 R11: 0000000000000246 R12: 000000000005f4a4
R13: 00007ffdb5d17730 R14: 0000000000000032 R15: ffffffffffffffff
 </TASK>

Allocated by task 7133:
 kasan_save_stack mm/kasan/common.c:47 [inline]
 kasan_save_track+0x3f/0x80 mm/kasan/common.c:68
 poison_kmalloc_redzone mm/kasan/common.c:377 [inline]
 __kasan_kmalloc+0x98/0xb0 mm/kasan/common.c:394
 kasan_kmalloc include/linux/kasan.h:257 [inline]
 __kmalloc_cache_noprof+0x19c/0x2c0 mm/slub.c:4295
 kmalloc_noprof include/linux/slab.h:878 [inline]
 kzalloc_noprof include/linux/slab.h:1014 [inline]
 sg_alloc drivers/scsi/sg.c:1444 [inline]
 sg_add_device+0x139/0xb10 drivers/scsi/sg.c:1518
 device_add+0xa1f/0xbf0 drivers/base/core.c:3698
 scsi_sysfs_add_sdev+0x306/0x5a0 drivers/scsi/scsi_sysfs.c:1435
 scsi_sysfs_add_devices drivers/scsi/scsi_scan.c:1896 [inline]
 scsi_finish_async_scan drivers/scsi/scsi_scan.c:1981 [inline]
 do_scan_async+0x42a/0x7a0 drivers/scsi/scsi_scan.c:2024
 async_run_entry_fn+0xa8/0x420 kernel/async.c:129
 process_one_work kernel/workqueue.c:3229 [inline]
 process_scheduled_works+0xa63/0x1850 kernel/workqueue.c:3310
 worker_thread+0x870/0xd30 kernel/workqueue.c:3391
 kthread+0x2f0/0x390 kernel/kthread.c:389
 ret_from_fork+0x4b/0x80 arch/x86/kernel/process.c:147
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:244

Freed by task 6000:
 kasan_save_stack mm/kasan/common.c:47 [inline]
 kasan_save_track+0x3f/0x80 mm/kasan/common.c:68
 kasan_save_free_info+0x40/0x50 mm/kasan/generic.c:579
 poison_slab_object mm/kasan/common.c:247 [inline]
 __kasan_slab_free+0x59/0x70 mm/kasan/common.c:264
 kasan_slab_free include/linux/kasan.h:230 [inline]
 slab_free_hook mm/slub.c:2342 [inline]
 slab_free mm/slub.c:4579 [inline]
 kfree+0x1a0/0x440 mm/slub.c:4727
 kref_put include/linux/kref.h:65 [inline]
 sg_remove_sfp_usercontext+0x331/0x4d0 drivers/scsi/sg.c:2238
 process_one_work kernel/workqueue.c:3229 [inline]
 process_scheduled_works+0xa63/0x1850 kernel/workqueue.c:3310
 worker_thread+0x870/0xd30 kernel/workqueue.c:3391
 kthread+0x2f0/0x390 kernel/kthread.c:389
 ret_from_fork+0x4b/0x80 arch/x86/kernel/process.c:147
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:244

The buggy address belongs to the object at ffff8880312a3800
 which belongs to the cache kmalloc-512 of size 512
The buggy address is located 192 bytes inside of
 freed 512-byte region [ffff8880312a3800, ffff8880312a3a00)

The buggy address belongs to the physical page:
page: refcount:1 mapcount:0 mapping:0000000000000000 index:0xffff8880312a2000 pfn:0x312a0
head: order:2 mapcount:0 entire_mapcount:0 nr_pages_mapped:0 pincount:0
flags: 0xfff00000000240(workingset|head|node=0|zone=1|lastcpupid=0x7ff)
page_type: f5(slab)
raw: 00fff00000000240 ffff88801ac41c80 ffffea00010c8910 ffffea0001fcb310
raw: ffff8880312a2000 000000000010000d 00000001f5000000 0000000000000000
head: 00fff00000000240 ffff88801ac41c80 ffffea00010c8910 ffffea0001fcb310
head: ffff8880312a2000 000000000010000d 00000001f5000000 0000000000000000
head: 00fff00000000002 ffffea0000c4a801 ffffffffffffffff 0000000000000000
head: ffff888000000004 0000000000000000 00000000ffffffff 0000000000000000
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 2, migratetype Unmovable, gfp_mask 0xd20c0(__GFP_IO|__GFP_FS|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP|__GFP_NOMEMALLOC), pid 5224, tgid 5224 (udevd), ts 31207973672, free_ts 31004401902
 set_page_owner include/linux/page_owner.h:32 [inline]
 post_alloc_hook+0x1f3/0x230 mm/page_alloc.c:1537
 prep_new_page mm/page_alloc.c:1545 [inline]
 get_page_from_freelist+0x303f/0x3190 mm/page_alloc.c:3457
 __alloc_pages_noprof+0x292/0x710 mm/page_alloc.c:4733
 alloc_pages_mpol_noprof+0x3e8/0x680 mm/mempolicy.c:2265
 alloc_slab_page+0x6a/0x120 mm/slub.c:2412
 allocate_slab+0x5a/0x2f0 mm/slub.c:2578
 new_slab mm/slub.c:2631 [inline]
 ___slab_alloc+0xcd1/0x14b0 mm/slub.c:3818
 __slab_alloc+0x58/0xa0 mm/slub.c:3908
 __slab_alloc_node mm/slub.c:3961 [inline]
 slab_alloc_node mm/slub.c:4122 [inline]
 __kmalloc_cache_noprof+0x1d5/0x2c0 mm/slub.c:4290
 kmalloc_noprof include/linux/slab.h:878 [inline]
 kzalloc_noprof include/linux/slab.h:1014 [inline]
 kernfs_fop_open+0x3e0/0xd10 fs/kernfs/file.c:623
 do_dentry_open+0x978/0x1460 fs/open.c:958
 vfs_open+0x3e/0x330 fs/open.c:1088
 do_open fs/namei.c:3774 [inline]
 path_openat+0x2c84/0x3590 fs/namei.c:3933
 do_filp_open+0x235/0x490 fs/namei.c:3960
 do_sys_openat2+0x13e/0x1d0 fs/open.c:1415
 do_sys_open fs/open.c:1430 [inline]
 __do_sys_openat fs/open.c:1446 [inline]
 __se_sys_openat fs/open.c:1441 [inline]
 __x64_sys_openat+0x247/0x2a0 fs/open.c:1441
page last free pid 16 tgid 16 stack trace:
 reset_page_owner include/linux/page_owner.h:25 [inline]
 free_pages_prepare mm/page_alloc.c:1108 [inline]
 free_unref_page+0xcfb/0xf20 mm/page_alloc.c:2638
 rcu_do_batch kernel/rcu/tree.c:2567 [inline]
 rcu_core+0xaaa/0x17a0 kernel/rcu/tree.c:2823
 handle_softirqs+0x2c5/0x980 kernel/softirq.c:554
 run_ksoftirqd+0xca/0x130 kernel/softirq.c:927
 smpboot_thread_fn+0x544/0xa30 kernel/smpboot.c:164
 kthread+0x2f0/0x390 kernel/kthread.c:389
 ret_from_fork+0x4b/0x80 arch/x86/kernel/process.c:147
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:244

Memory state around the buggy address:
 ffff8880312a3780: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
 ffff8880312a3800: fa fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>ffff8880312a3880: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                                           ^
 ffff8880312a3900: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff8880312a3980: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
==================================================================


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

If the report is already addressed, let syzbot know by replying with:
#syz fix: exact-commit-title

If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.

If you want to overwrite report's subsystems, reply with:
#syz set subsystems: new-subsystem
(See the list of subsystem names on the web dashboard)

If the report is a duplicate of another one, reply with:
#syz dup: exact-subject-of-another-report

If you want to undo deduplication, reply with:
#syz undup

