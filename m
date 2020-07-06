Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A4BFC215A9C
	for <lists+linux-usb@lfdr.de>; Mon,  6 Jul 2020 17:23:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729428AbgGFPW3 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 6 Jul 2020 11:22:29 -0400
Received: from mail-il1-f197.google.com ([209.85.166.197]:49909 "EHLO
        mail-il1-f197.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729414AbgGFPW2 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 6 Jul 2020 11:22:28 -0400
Received: by mail-il1-f197.google.com with SMTP id w10so19860172ilm.16
        for <linux-usb@vger.kernel.org>; Mon, 06 Jul 2020 08:22:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=uDibpWdhqTVEbNtilRXwxDMaVVrvfgzuQmq/49HcmOg=;
        b=i7xRKBjE0L40XBceaUvUDaSGT7vGGNsyka7JW7DqO6IdXZTjC/H4l0XhFkxKiT+ugE
         O/Ky0McS1R9RS4CqH31jpn/QyHKX0FnT5Iwnd3vxpZwsZNzH4JwAHsh0ryj7yLLpwr01
         ys6u1KQgqxgO6VaNW95oLdWEGhsXNzUKs49ZsgZPR0ZlwwAn9oWmi++LyNfeBqvSB4Xe
         OWNwDcSC08AygmLAVDeNGfiK18UPv53Cv11QHVO+9gxJ5LVNTjnklcl+2MfQvaHzF9eW
         3/80B7Kr2/UqOzIzPKCGNL4DCjXUNV6FR4gn/49so8cURgCHhZsY9W039VT0tGYMn8m0
         yL3w==
X-Gm-Message-State: AOAM5318YbTKkzacZxKily0lUJvY3cPQ8dg0FKlxgAa32wairRWJiJ16
        sNvw3gzc3dTpk1RdlmJJGjqKXzxTB+vA9KjPXt9hWW7I6nLP
X-Google-Smtp-Source: ABdhPJxSuJKhyYP5eLNTZ/4dOIyhJcy0Bs6A6b5k4f/WOh0Y6dlO5m5C+YtwryaNYSILM6OK2bvIMb0JZ/X+WwS9wDf53hAon9y1
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:13cd:: with SMTP id v13mr28530238ilj.15.1594048946944;
 Mon, 06 Jul 2020 08:22:26 -0700 (PDT)
Date:   Mon, 06 Jul 2020 08:22:26 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000003cc03505a9c771ed@google.com>
Subject: INFO: task hung in sisusb_open
From:   syzbot <syzbot+fd9d03311cdce9a9ec36@syzkaller.appspotmail.com>
To:     andreyknvl@google.com, gregkh@linuxfoundation.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        syzkaller-bugs@googlegroups.com, thomas@winischhofer.net
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,

syzbot found the following crash on:

HEAD commit:    768a0741 usb: dwc2: gadget: Remove assigned but never used..
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
console output: https://syzkaller.appspot.com/x/log.txt?x=146beb3d100000
kernel config:  https://syzkaller.appspot.com/x/.config?x=999be4eb2478ffa5
dashboard link: https://syzkaller.appspot.com/bug?extid=fd9d03311cdce9a9ec36
compiler:       gcc (GCC) 10.1.0-syz 20200507

Unfortunately, I don't have any reproducer for this crash yet.

IMPORTANT: if you fix the bug, please add the following tag to the commit:
Reported-by: syzbot+fd9d03311cdce9a9ec36@syzkaller.appspotmail.com

INFO: task syz-executor.2:9041 blocked for more than 143 seconds.
      Not tainted 5.8.0-rc3-syzkaller #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
syz-executor.2  D28808  9041    350 0x00000004
Call Trace:
 context_switch kernel/sched/core.c:3453 [inline]
 __schedule+0x88a/0x1cb0 kernel/sched/core.c:4178
 schedule+0xcd/0x2b0 kernel/sched/core.c:4253
 schedule_preempt_disabled+0xc/0x20 kernel/sched/core.c:4312
 __mutex_lock_common kernel/locking/mutex.c:1033 [inline]
 __mutex_lock+0x3e2/0x10a0 kernel/locking/mutex.c:1103
 sisusb_open+0xb2/0x4d0 drivers/usb/misc/sisusbvga/sisusb.c:2396
 usb_open+0x1df/0x270 drivers/usb/core/file.c:48
 chrdev_open+0x266/0x770 fs/char_dev.c:414
 do_dentry_open+0x4ff/0x1170 fs/open.c:828
 do_open fs/namei.c:3243 [inline]
 path_openat+0x192c/0x26b0 fs/namei.c:3360
 do_filp_open+0x17e/0x3c0 fs/namei.c:3387
 do_sys_openat2+0x16f/0x3b0 fs/open.c:1179
 do_sys_open fs/open.c:1195 [inline]
 ksys_open include/linux/syscalls.h:1388 [inline]
 __do_sys_open fs/open.c:1201 [inline]
 __se_sys_open fs/open.c:1199 [inline]
 __x64_sys_open+0x119/0x1c0 fs/open.c:1199
 do_syscall_64+0x50/0x90 arch/x86/entry/common.c:359
 entry_SYSCALL_64_after_hwframe+0x44/0xa9
RIP: 0033:0x416921
Code: Bad RIP value.
RSP: 002b:00007f59455b77a0 EFLAGS: 00000293 ORIG_RAX: 0000000000000002
RAX: ffffffffffffffda RBX: 000000000050a760 RCX: 0000000000416921
RDX: 0000000000000000 RSI: 0000000000000002 RDI: 00007f59455b77d0
RBP: 000000000078bf00 R08: 0000000000000000 R09: 000000000000000f
R10: 0000000000000064 R11: 0000000000000293 R12: 00000000ffffffff
R13: 0000000000000c43 R14: 00000000004ce974 R15: 00007f59455b86d4
INFO: task syz-executor.4:9085 blocked for more than 143 seconds.
      Not tainted 5.8.0-rc3-syzkaller #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
syz-executor.4  D28808  9085    356 0x00000004
Call Trace:
 context_switch kernel/sched/core.c:3453 [inline]
 __schedule+0x88a/0x1cb0 kernel/sched/core.c:4178
 schedule+0xcd/0x2b0 kernel/sched/core.c:4253
 schedule_preempt_disabled+0xc/0x20 kernel/sched/core.c:4312
 __mutex_lock_common kernel/locking/mutex.c:1033 [inline]
 __mutex_lock+0x3e2/0x10a0 kernel/locking/mutex.c:1103
 sisusb_open+0xb2/0x4d0 drivers/usb/misc/sisusbvga/sisusb.c:2396
 usb_open+0x1df/0x270 drivers/usb/core/file.c:48
 chrdev_open+0x266/0x770 fs/char_dev.c:414
 do_dentry_open+0x4ff/0x1170 fs/open.c:828
 do_open fs/namei.c:3243 [inline]
 path_openat+0x192c/0x26b0 fs/namei.c:3360
 do_filp_open+0x17e/0x3c0 fs/namei.c:3387
 do_sys_openat2+0x16f/0x3b0 fs/open.c:1179
 do_sys_open fs/open.c:1195 [inline]
 ksys_open include/linux/syscalls.h:1388 [inline]
 __do_sys_open fs/open.c:1201 [inline]
 __se_sys_open fs/open.c:1199 [inline]
 __x64_sys_open+0x119/0x1c0 fs/open.c:1199
 do_syscall_64+0x50/0x90 arch/x86/entry/common.c:359
 entry_SYSCALL_64_after_hwframe+0x44/0xa9
RIP: 0033:0x416921
Code: Bad RIP value.
RSP: 002b:00007f1be57797a0 EFLAGS: 00000293 ORIG_RAX: 0000000000000002
RAX: ffffffffffffffda RBX: 000000000050a760 RCX: 0000000000416921
RDX: 0000000000000000 RSI: 0000000000000002 RDI: 00007f1be57797d0
RBP: 000000000078bfa0 R08: 0000000000000000 R09: 000000000000000f
R10: 0000000000000064 R11: 0000000000000293 R12: 00000000ffffffff
R13: 0000000000000c43 R14: 00000000004ce974 R15: 00007f1be577a6d4

Showing all locks held in the system:
1 lock held by khungtaskd/23:
 #0: ffffffff873124a0 (rcu_read_lock){....}-{1:2}, at: debug_show_all_locks+0x53/0x264 kernel/locking/lockdep.c:5779
6 locks held by kworker/0:2/67:
 #0: ffff8881d880ed38 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: arch_atomic64_set arch/x86/include/asm/atomic64_64.h:34 [inline]
 #0: ffff8881d880ed38 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: atomic64_set include/asm-generic/atomic-instrumented.h:856 [inline]
 #0: ffff8881d880ed38 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: atomic_long_set include/asm-generic/atomic-long.h:41 [inline]
 #0: ffff8881d880ed38 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: set_work_data kernel/workqueue.c:616 [inline]
 #0: ffff8881d880ed38 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: set_work_pool_and_clear_pending kernel/workqueue.c:643 [inline]
 #0: ffff8881d880ed38 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: process_one_work+0x82b/0x15f0 kernel/workqueue.c:2240
 #1: ffff8881d584fda8 ((work_completion)(&hub->events)){+.+.}-{0:0}, at: process_one_work+0x85f/0x15f0 kernel/workqueue.c:2244
 #2: ffff8881d44b3218 (&dev->mutex){....}-{3:3}, at: device_lock include/linux/device.h:768 [inline]
 #2: ffff8881d44b3218 (&dev->mutex){....}-{3:3}, at: hub_event+0x1c5/0x4390 drivers/usb/core/hub.c:5522
 #3: ffff8881ca88f218 (&dev->mutex){....}-{3:3}, at: device_lock include/linux/device.h:768 [inline]
 #3: ffff8881ca88f218 (&dev->mutex){....}-{3:3}, at: usb_disconnect.cold+0x43/0x780 drivers/usb/core/hub.c:2208
 #4: ffff8881d94371a8 (&dev->mutex){....}-{3:3}, at: device_lock include/linux/device.h:768 [inline]
 #4: ffff8881d94371a8 (&dev->mutex){....}-{3:3}, at: __device_driver_lock drivers/base/dd.c:936 [inline]
 #4: ffff8881d94371a8 (&dev->mutex){....}-{3:3}, at: device_release_driver_internal drivers/base/dd.c:1141 [inline]
 #4: ffff8881d94371a8 (&dev->mutex){....}-{3:3}, at: device_release_driver+0x1c/0x40 drivers/base/dd.c:1167
 #5: ffffffff878ac990 (minor_rwsem){++++}-{3:3}, at: usb_deregister_dev+0xaa/0x300 drivers/usb/core/file.c:239
1 lock held by in:imklog/248:
 #0: ffff8881d58874f0 (&f->f_pos_lock){+.+.}-{3:3}, at: __fdget_pos+0xe9/0x100 fs/file.c:826
2 locks held by agetty/274:
 #0: ffff8881ce8d2098 (&tty->ldisc_sem){++++}-{0:0}, at: tty_ldisc_ref_wait+0x22/0x80 drivers/tty/tty_ldisc.c:267
 #1: ffffc90000a222e8 (&ldata->atomic_read_lock){+.+.}-{3:3}, at: n_tty_read+0x223/0x1a30 drivers/tty/n_tty.c:2156
6 locks held by kworker/0:8/3410:
 #0: ffff8881d880ed38 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: arch_atomic64_set arch/x86/include/asm/atomic64_64.h:34 [inline]
 #0: ffff8881d880ed38 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: atomic64_set include/asm-generic/atomic-instrumented.h:856 [inline]
 #0: ffff8881d880ed38 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: atomic_long_set include/asm-generic/atomic-long.h:41 [inline]
 #0: ffff8881d880ed38 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: set_work_data kernel/workqueue.c:616 [inline]
 #0: ffff8881d880ed38 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: set_work_pool_and_clear_pending kernel/workqueue.c:643 [inline]
 #0: ffff8881d880ed38 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: process_one_work+0x82b/0x15f0 kernel/workqueue.c:2240
 #1: ffff8881d55cfda8 ((work_completion)(&hub->events)){+.+.}-{0:0}, at: process_one_work+0x85f/0x15f0 kernel/workqueue.c:2244
 #2: ffff8881d4413218 (&dev->mutex){....}-{3:3}, at: device_lock include/linux/device.h:768 [inline]
 #2: ffff8881d4413218 (&dev->mutex){....}-{3:3}, at: hub_event+0x1c5/0x4390 drivers/usb/core/hub.c:5522
 #3: ffff8881cbe72218 (&dev->mutex){....}-{3:3}, at: device_lock include/linux/device.h:768 [inline]
 #3: ffff8881cbe72218 (&dev->mutex){....}-{3:3}, at: usb_disconnect.cold+0x43/0x780 drivers/usb/core/hub.c:2208
 #4: ffff8881c75b41a8 (&dev->mutex){....}-{3:3}, at: device_lock include/linux/device.h:768 [inline]
 #4: ffff8881c75b41a8 (&dev->mutex){....}-{3:3}, at: __device_driver_lock drivers/base/dd.c:936 [inline]
 #4: ffff8881c75b41a8 (&dev->mutex){....}-{3:3}, at: device_release_driver_internal drivers/base/dd.c:1141 [inline]
 #4: ffff8881c75b41a8 (&dev->mutex){....}-{3:3}, at: device_release_driver+0x1c/0x40 drivers/base/dd.c:1167
 #5: ffffffff878ac990 (minor_rwsem){++++}-{3:3}, at: usb_deregister_dev+0xaa/0x300 drivers/usb/core/file.c:239
2 locks held by agetty/5507:
 #0: ffff8881c6234098 (&tty->ldisc_sem){++++}-{0:0}, at: tty_ldisc_ref_wait+0x22/0x80 drivers/tty/tty_ldisc.c:267
 #1: ffffc9000e49d2e8 (&ldata->atomic_read_lock){+.+.}-{3:3}, at: n_tty_read+0x223/0x1a30 drivers/tty/n_tty.c:2156
2 locks held by syz-executor.2/9041:
 #0: ffffffff878ac990 (minor_rwsem){++++}-{3:3}, at: usb_open+0x23/0x270 drivers/usb/core/file.c:39
 #1: ffff8881cd53b0d0 (&(sisusb->lock)){+.+.}-{3:3}, at: sisusb_open+0xb2/0x4d0 drivers/usb/misc/sisusbvga/sisusb.c:2396
2 locks held by syz-executor.4/9081:
 #0: ffffffff878ac990 (minor_rwsem){++++}-{3:3}, at: usb_open+0x23/0x270 drivers/usb/core/file.c:39
 #1: ffff8881cd53b0d0 (&(sisusb->lock)){+.+.}-{3:3}, at: sisusb_open+0xb2/0x4d0 drivers/usb/misc/sisusbvga/sisusb.c:2396
2 locks held by syz-executor.4/9085:
 #0: ffffffff878ac990 (minor_rwsem){++++}-{3:3}, at: usb_open+0x23/0x270 drivers/usb/core/file.c:39
 #1: ffff8881cd53b0d0 (&(sisusb->lock)){+.+.}-{3:3}, at: sisusb_open+0xb2/0x4d0 drivers/usb/misc/sisusbvga/sisusb.c:2396

=============================================

NMI backtrace for cpu 1
CPU: 1 PID: 23 Comm: khungtaskd Not tainted 5.8.0-rc3-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
Call Trace:
 __dump_stack lib/dump_stack.c:77 [inline]
 dump_stack+0xf6/0x16e lib/dump_stack.c:118
 nmi_cpu_backtrace.cold+0x74/0xb6 lib/nmi_backtrace.c:101
 nmi_trigger_cpumask_backtrace+0x1da/0x1f4 lib/nmi_backtrace.c:62
 trigger_all_cpu_backtrace include/linux/nmi.h:146 [inline]
 check_hung_uninterruptible_tasks kernel/hung_task.c:209 [inline]
 watchdog+0xd6a/0xfd0 kernel/hung_task.c:295
 kthread+0x392/0x470 kernel/kthread.c:291
 ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:293
Sending NMI from CPU 1 to CPUs 0:
NMI backtrace for cpu 0 skipped: idling at native_safe_halt arch/x86/include/asm/irqflags.h:60 [inline]
NMI backtrace for cpu 0 skipped: idling at arch_safe_halt arch/x86/include/asm/irqflags.h:103 [inline]
NMI backtrace for cpu 0 skipped: idling at acpi_safe_halt+0x72/0x90 drivers/acpi/processor_idle.c:111


---
This bug is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this bug report. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
