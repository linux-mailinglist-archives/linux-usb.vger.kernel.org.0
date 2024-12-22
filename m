Return-Path: <linux-usb+bounces-18728-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 29E1E9FA820
	for <lists+linux-usb@lfdr.de>; Sun, 22 Dec 2024 21:18:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3C8AA164272
	for <lists+linux-usb@lfdr.de>; Sun, 22 Dec 2024 20:18:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAF32193086;
	Sun, 22 Dec 2024 20:16:23 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-il1-f208.google.com (mail-il1-f208.google.com [209.85.166.208])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F03632B2CF
	for <linux-usb@vger.kernel.org>; Sun, 22 Dec 2024 20:16:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.208
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734898583; cv=none; b=q+lTvG9eMB6xwJGkqezkLkTPuEvaYxdIDJNniAhBr9sfmw2kQLWhJ9MtST6AQbhdAQ/7IN0MGQMN+YZG/D2y3yJWgKngTcaUxr9O9dIVyGEXibAkni+YFIMPn/iG1yrCCleU+c8285e+tdYPx9WqsXihiYAzhC9m6U0qHs9i/+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734898583; c=relaxed/simple;
	bh=fg1nqG1EOldwmIHRkqiNeiKk5nAVIQdxmbx/1wq1TZ8=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=vAEbJscdtnAVCFV9/k1PI7wwFiLs8wwLtc8UW16+YZlrcXePpvBV/swTBl5ke+/MRRn2PbUa7bJiEESDNN0OAoYxeKNhCgPJXZ58elDTtwI6g/pfF9e6BnSOypSrG2X8y6eF9rGutSvdxgBjSL2kDGH2MYHuno33PwYyZ3hPYHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.208
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f208.google.com with SMTP id e9e14a558f8ab-3ab68717b73so33730635ab.2
        for <linux-usb@vger.kernel.org>; Sun, 22 Dec 2024 12:16:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734898581; x=1735503381;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IPeHI6xlIFlwWhfLfiLUIhhEy76EInZEc6EijFSPJcQ=;
        b=bOSh/5xAKktAs5FJRLKChgQQdXZjlUWpR05CRpaW+PEAAnZiCYzOAAR6esIoxFVbsP
         3Qe+RF+QSbGzuBqYx6Ey934bhOxwF5pY0rfSbf48N31KdE3VLTloAXMIAZdnKyp9mYGA
         DYEZUXzpY5f8TacU3p379QmNRaA5d06Es05/eHCZ/+shxvIcLHQTRVNjF6EBe4e88Ye/
         +s/m2NgT7vFqBliPdXN0a5VWlYbvM8GvoJZmdwlWfVF5NNIPix266KMKHlbrsQzVNkKp
         BSRRiE9KallsfFU9dzJzck6o6C/QQIQMcZnYmUzQ2QHsH/LKd4s0qCqBH/DJmZFqffs8
         el3A==
X-Forwarded-Encrypted: i=1; AJvYcCW8Dij8myKi9Xnzjn6vH76B6O9dxAveBh5m0WJMScH85tGcw7Eq0aBg8tZ0zXfEfbBpwsykpEuWgPg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxfZzaa5+gIm3xKceiLZ4uYnC9BCGm+g93jR66ahocnltzPL4YI
	abjLSatNXLC0aKm5KBrsE9KTtZ/jSEILgCHy3VdtXxRZ/GPycQhSfD2MojueoYPzCpc4H9Q+K9p
	ROhrmRSZKNoHBbiXxod95IPnu35GZiXpfstcxKZyfN2WUPUpUOf8JyLE=
X-Google-Smtp-Source: AGHT+IEq2FyYuQCQcEbazrKgrzQEIsxdL+KmN7iPKsQ8jfBeDH78VVVxcRB2urkSGYd07FSdvgAz3kSNUZpqRWDB2iGKlPcGV/er
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:3683:b0:3a7:8720:9de5 with SMTP id
 e9e14a558f8ab-3c2d1aa27e8mr95007165ab.1.1734898581177; Sun, 22 Dec 2024
 12:16:21 -0800 (PST)
Date: Sun, 22 Dec 2024 12:16:21 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67687395.050a0220.2f3838.000a.GAE@google.com>
Subject: [syzbot] [usb?] INFO: task hung in do_syscall_64 (3)
From: syzbot <syzbot+64d45c23acffac0fb82d@syzkaller.appspotmail.com>
To: anna-maria@linutronix.de, frederic@kernel.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com, tglx@linutronix.de
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    499551201b5f Merge tag 'arm64-fixes' of git://git.kernel.o..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=16287e0f980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=6a2b862bf4a5409f
dashboard link: https://syzkaller.appspot.com/bug?extid=64d45c23acffac0fb82d
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=14506f30580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/7e67f36abfb2/disk-49955120.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/cbd5df554814/vmlinux-49955120.xz
kernel image: https://storage.googleapis.com/syzbot-assets/26aa1e962905/bzImage-49955120.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+64d45c23acffac0fb82d@syzkaller.appspotmail.com

INFO: task udevd:6008 blocked for more than 185 seconds.
      Not tainted 6.13.0-rc3-syzkaller-00209-g499551201b5f #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:udevd           state:R  running task     stack:25048 pid:6008  tgid:6008  ppid:5205   flags:0x00000002
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5369 [inline]
 __schedule+0x1850/0x4c30 kernel/sched/core.c:6756
 __schedule_loop kernel/sched/core.c:6833 [inline]
 schedule+0x14b/0x320 kernel/sched/core.c:6848
 schedule_hrtimeout_range_clock+0x223/0x320 kernel/time/sleep_timeout.c:207
 ep_poll fs/eventpoll.c:2099 [inline]
 do_epoll_wait+0x1db4/0x21c0 fs/eventpoll.c:2484
 __do_sys_epoll_wait fs/eventpoll.c:2492 [inline]
 __se_sys_epoll_wait fs/eventpoll.c:2487 [inline]
 __x64_sys_epoll_wait+0x257/0x2a0 fs/eventpoll.c:2487
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xf3/0x230 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f8692523457
RSP: 002b:00007ffe04d8b468 EFLAGS: 00000246 ORIG_RAX: 00000000000000e8
RAX: ffffffffffffffda RBX: 0000000000000000 RCX: 00007f8692523457
RDX: 0000000000000004 RSI: 00007ffe04d8b4a8 RDI: 0000000000000004
RBP: 0000558d225ede80 R08: 0000000000000007 R09: 6bcd4ee305e41824
R10: 00000000ffffffff R11: 0000000000000246 R12: 0000558d225f34c0
R13: 00007ffe04d8b4a8 R14: 00000000ffffffff R15: 0000558d225cd910
 </TASK>
INFO: task kworker/0:7:6050 blocked for more than 146 seconds.
      Not tainted 6.13.0-rc3-syzkaller-00209-g499551201b5f #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:kworker/0:7     state:D stack:20696 pid:6050  tgid:6050  ppid:2      flags:0x00004000
Workqueue: usb_hub_wq hub_event

Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5369 [inline]
 __schedule+0x1850/0x4c30 kernel/sched/core.c:6756
 __schedule_loop kernel/sched/core.c:6833 [inline]
 schedule+0x14b/0x320 kernel/sched/core.c:6848
 schedule_preempt_disabled+0x13/0x30 kernel/sched/core.c:6905
 __mutex_lock_common kernel/locking/mutex.c:665 [inline]
 __mutex_lock+0x7e7/0xee0 kernel/locking/mutex.c:735
 __input_unregister_device+0x2f3/0x620 drivers/input/input.c:2277
 input_unregister_device+0xa3/0x100 drivers/input/input.c:2516
 imon_init_intf0 drivers/media/rc/imon.c:2289 [inline]
 imon_probe+0x264e/0x31b0 drivers/media/rc/imon.c:2434
 usb_probe_interface+0x641/0xbb0 drivers/usb/core/driver.c:396
 really_probe+0x2b8/0xad0 drivers/base/dd.c:658
 __driver_probe_device+0x1a2/0x390 drivers/base/dd.c:800
 driver_probe_device+0x50/0x430 drivers/base/dd.c:830
 __device_attach_driver+0x2d6/0x530 drivers/base/dd.c:958
 bus_for_each_drv+0x24e/0x2e0 drivers/base/bus.c:459
 __device_attach+0x333/0x520 drivers/base/dd.c:1030
 bus_probe_device+0x189/0x260 drivers/base/bus.c:534
 device_add+0x856/0xbf0 drivers/base/core.c:3665
 usb_set_configuration+0x1976/0x1fb0 drivers/usb/core/message.c:2210
 usb_generic_driver_probe+0x88/0x140 drivers/usb/core/generic.c:254
 usb_probe_device+0x1b8/0x380 drivers/usb/core/driver.c:291
 really_probe+0x2b8/0xad0 drivers/base/dd.c:658
 __driver_probe_device+0x1a2/0x390 drivers/base/dd.c:800
 driver_probe_device+0x50/0x430 drivers/base/dd.c:830
 __device_attach_driver+0x2d6/0x530 drivers/base/dd.c:958
 bus_for_each_drv+0x24e/0x2e0 drivers/base/bus.c:459
 __device_attach+0x333/0x520 drivers/base/dd.c:1030
 bus_probe_device+0x189/0x260 drivers/base/bus.c:534
 device_add+0x856/0xbf0 drivers/base/core.c:3665
 usb_new_device+0x104a/0x19a0 drivers/usb/core/hub.c:2651
 hub_port_connect drivers/usb/core/hub.c:5521 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5661 [inline]
 port_event drivers/usb/core/hub.c:5821 [inline]
 hub_event+0x2d6d/0x5150 drivers/usb/core/hub.c:5903
 process_one_work kernel/workqueue.c:3229 [inline]
 process_scheduled_works+0xa66/0x1840 kernel/workqueue.c:3310


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

