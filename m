Return-Path: <linux-usb+bounces-31780-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 53D22CDF3CF
	for <lists+linux-usb@lfdr.de>; Sat, 27 Dec 2025 04:45:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7888A300A879
	for <lists+linux-usb@lfdr.de>; Sat, 27 Dec 2025 03:45:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 710C82222A9;
	Sat, 27 Dec 2025 03:45:22 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-oi1-f206.google.com (mail-oi1-f206.google.com [209.85.167.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B15E522068D
	for <linux-usb@vger.kernel.org>; Sat, 27 Dec 2025 03:45:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766807122; cv=none; b=rDZa2VVUOaGzAuu8ddBaLV3UOPITV0i8RVCTFx0d0DEvDZ3rn3Ncti5BVa7w2L/o4IrLiiSW00z0SNMnpEaalIDyO2q7YmpZ/dj+2IajUHh+c+roEdcc/82+d9lpZCaseBYF11Q3mcjjW6X85vXPLFzi0RXYk22kf7JvEzz7ogk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766807122; c=relaxed/simple;
	bh=CcE8X9X5farfGP1eJC+7DhpjE4L3mD2GZc8eNgxEYU8=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=W2DnRTsd1CBJx1yL22DewpUqj/83aYYSyqHkJa5A+fOWAO7HV3Yi6iKZ+Cme9EthZvJfzdG7CtSlJzxGjr4pGqEQ4IjlyTcFzBbPYI5xzB7QhmYzNb3bM3uvN9tOKrvHLfLbAD3QheUDdJMUtuzFJ6mKtw2Q5KgNRIAKKYGLOn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f206.google.com with SMTP id 5614622812f47-4514cb26767so5862728b6e.1
        for <linux-usb@vger.kernel.org>; Fri, 26 Dec 2025 19:45:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766807118; x=1767411918;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bDJ4BsuZzuH120HD5VXuHC0aPobbMDBlV4JfXzSr3gI=;
        b=UKLQJEEGycxiUAYOcyVwCelI23xgYtuumj0zm5zHTY1UzQNbIhXxDN7/C1d8KAu9nS
         IPVBi5YNiKAce5XS8rNTuwapKxpyLKsRIi3Ksb2ULvpvYz8wVBKWNa37vuWpLayPDqDt
         aiOiaDFBrOZmwQ107eck/H72hiHkFor8u5wIqC2XcQbv7kE5L5SIqDY791yP09rdAYtk
         x7wNyPCXWhMI6M2PP4v2oP07eM8t5qHTSGaGgmefNwn2L+k1xa41b9KxiWZNQx8NS9hy
         cvK9waSoSz0ji8QnFcNdSZYy+jDJdOppOjGIGQDEpJZACol2JTUdssN65geQ7WRp+CwY
         jPVA==
X-Forwarded-Encrypted: i=1; AJvYcCWaWFDda0tAhCBY54YTulbyRAmF/7rckNnior6xgHmxLnXz+6MkfZeVGDWdlJvVvS6q8Y6cGkEUksM=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywo3ThU94Y8sLxug4kvXQzCSi0PvKRFowLfAiapCUWB4HVsg4nA
	NJ7bN6+JGMdXLM7E2kTw3TwnjSXvHgycjlXWsdwpwNrPeo9xsEyCopA0YPoGrFJs5Dt5NKZkx1u
	avFlt3wG+fAANQKlQLyupJ08LNsR16YLu1bAh5qndfcgwqs8nNSsjDFjewG8=
X-Google-Smtp-Source: AGHT+IF7ubLT21G4OOPkvtwdE0s2JqXasufb/SSpGyWqgOFJhe/7CU2HGYhnUzz4HMJdI4MTmpoENCVP+thv8x/SKpBQPq8ZE0FB
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:4715:b0:65d:23b:7ea2 with SMTP id
 006d021491bc7-65d0e92289fmr8021952eaf.5.1766807118650; Fri, 26 Dec 2025
 19:45:18 -0800 (PST)
Date: Fri, 26 Dec 2025 19:45:18 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <694f564e.050a0220.35954c.0086.GAE@google.com>
Subject: [syzbot] [usb?] INFO: task hung in hci_register_dev (2)
From: syzbot <syzbot+f201a5d7faf69008864d@syzkaller.appspotmail.com>
To: dakr@kernel.org, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, rafael@kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    ccd1cdca5cd4 Merge tag 'nfsd-6.19-1' of git://git.kernel.o..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=1416709a580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=a11e0f726bfb6765
dashboard link: https://syzkaller.appspot.com/bug?extid=f201a5d7faf69008864d
compiler:       gcc (Debian 12.2.0-14+deb12u1) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=16fc6b92580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/a30893dc5d92/disk-ccd1cdca.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/64a722042ed2/vmlinux-ccd1cdca.xz
kernel image: https://storage.googleapis.com/syzbot-assets/bf3d1ced5d9f/bzImage-ccd1cdca.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+f201a5d7faf69008864d@syzkaller.appspotmail.com

INFO: task syz-executor:6980 blocked for more than 164 seconds.
      Not tainted syzkaller #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:syz-executor    state:D
 stack:28520 pid:6980  tgid:6980  ppid:1      task_flags:0x400040 flags:0x00080000
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5256 [inline]
 __schedule+0x1139/0x6150 kernel/sched/core.c:6863
 __schedule_loop kernel/sched/core.c:6945 [inline]
 schedule+0xe7/0x3a0 kernel/sched/core.c:6960
 schedule_preempt_disabled+0x13/0x30 kernel/sched/core.c:7017
 __mutex_lock_common kernel/locking/mutex.c:692 [inline]
 __mutex_lock+0xc69/0x1ca0 kernel/locking/mutex.c:776
 get_device_parent+0x10a/0x4e0 drivers/base/core.c:3266
 device_add+0xc13/0x1980 drivers/base/core.c:3613
 hci_register_dev+0x328/0xce0 net/bluetooth/hci_core.c:2621
 __vhci_create_device+0x357/0x880 drivers/bluetooth/hci_vhci.c:451
 vhci_create_device drivers/bluetooth/hci_vhci.c:479 [inline]
 vhci_get_user drivers/bluetooth/hci_vhci.c:536 [inline]
 vhci_write+0x2c0/0x480 drivers/bluetooth/hci_vhci.c:616
 new_sync_write fs/read_write.c:593 [inline]
 vfs_write+0x7d3/0x11d0 fs/read_write.c:686
 ksys_write+0x12a/0x250 fs/read_write.c:738
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xcd/0xf80 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fdac098e1c0
RSP: 002b:00007fffa8e51048 EFLAGS: 00000202
 ORIG_RAX: 0000000000000001
RAX: ffffffffffffffda RBX: 0000000000000003 RCX: 00007fdac098e1c0
RDX: 0000000000000002 RSI: 00007fffa8e5105a RDI: 00000000000000ca
RBP: 00007fffa8e51120 R08: 0000000000000000 R09: 00007fdac171d6c0
R10: 0000000000000000 R11: 0000000000000202 R12: 0000000000000002
R13: 00007fffa8e51128 R14: 00007fffa8e513a8 R15: 0000000000000000
 </TASK>
INFO: task syz-executor:6983 blocked for more than 164 seconds.
      Not tainted syzkaller #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:syz-executor    state:D
 stack:27608 pid:6983  tgid:6983  ppid:1      task_flags:0x400040 flags:0x00080000
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5256 [inline]
 __schedule+0x1139/0x6150 kernel/sched/core.c:6863
 __schedule_loop kernel/sched/core.c:6945 [inline]
 schedule+0xe7/0x3a0 kernel/sched/core.c:6960
 schedule_preempt_disabled+0x13/0x30 kernel/sched/core.c:7017
 __mutex_lock_common kernel/locking/mutex.c:692 [inline]
 __mutex_lock+0xc69/0x1ca0 kernel/locking/mutex.c:776
 get_device_parent+0x10a/0x4e0 drivers/base/core.c:3266
 device_add+0xc13/0x1980 drivers/base/core.c:3613
 hci_register_dev+0x328/0xce0 net/bluetooth/hci_core.c:2621
 __vhci_create_device+0x357/0x880 drivers/bluetooth/hci_vhci.c:451
 vhci_create_device drivers/bluetooth/hci_vhci.c:479 [inline]
 vhci_get_user drivers/bluetooth/hci_vhci.c:536 [inline]
 vhci_write+0x2c0/0x480 drivers/bluetooth/hci_vhci.c:616
 new_sync_write fs/read_write.c:593 [inline]
 vfs_write+0x7d3/0x11d0 fs/read_write.c:686
 ksys_write+0x12a/0x250 fs/read_write.c:738
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xcd/0xf80 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f801418e1c0
RSP: 002b:00007fff6963a2f8 EFLAGS: 00000202
 ORIG_RAX: 0000000000000001
RAX: ffffffffffffffda RBX: 0000000000000003 RCX: 00007f801418e1c0
RDX: 0000000000000002 RSI: 00007fff6963a30a RDI: 00000000000000ca
RBP: 00007fff6963a3d0 R08: 0000000000000000 R09: 00007f8014f1d6c0
R10: 0000000000000000 R11: 0000000000000202 R12: 0000000000000002
R13: 00007fff6963a3d8 R14: 00007fff6963a658 R15: 0000000000000000
 </TASK>
INFO: task syz-executor:6984 blocked for more than 165 seconds.
      Not tainted syzkaller #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:syz-executor    state:D
 stack:27608 pid:6984  tgid:6984  ppid:1      task_flags:0x400040 flags:0x00080000
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5256 [inline]
 __schedule+0x1139/0x6150 kernel/sched/core.c:6863
 __schedule_loop kernel/sched/core.c:6945 [inline]
 schedule+0xe7/0x3a0 kernel/sched/core.c:6960
 schedule_preempt_disabled+0x13/0x30 kernel/sched/core.c:7017
 __mutex_lock_common kernel/locking/mutex.c:692 [inline]
 __mutex_lock+0xc69/0x1ca0 kernel/locking/mutex.c:776
 get_device_parent+0x10a/0x4e0 drivers/base/core.c:3266
 device_add+0xc13/0x1980 drivers/base/core.c:3613
 hci_register_dev+0x328/0xce0 net/bluetooth/hci_core.c:2621
 __vhci_create_device+0x357/0x880 drivers/bluetooth/hci_vhci.c:451
 vhci_create_device drivers/bluetooth/hci_vhci.c:479 [inline]
 vhci_get_user drivers/bluetooth/hci_vhci.c:536 [inline]
 vhci_write+0x2c0/0x480 drivers/bluetooth/hci_vhci.c:616
 new_sync_write fs/read_write.c:593 [inline]
 vfs_write+0x7d3/0x11d0 fs/read_write.c:686
 ksys_write+0x12a/0x250 fs/read_write.c:738
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xcd/0xf80 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fe943d8e1c0
RSP: 002b:00007fff1a241958 EFLAGS: 00000202
 ORIG_RAX: 0000000000000001
RAX: ffffffffffffffda RBX: 0000000000000003 RCX: 00007fe943d8e1c0
RDX: 0000000000000002 RSI: 00007fff1a24196a RDI: 00000000000000ca
RBP: 00007fff1a241a30 R08: 0000000000000000 R09: 00007fe944b1d6c0
R10: 0000000000000000 R11: 0000000000000202 R12: 0000000000000002
R13: 00007fff1a241a38 R14: 00007fff1a241cb8 R15: 0000000000000000
 </TASK>
INFO: task syz-executor:6987 blocked for more than 166 seconds.
      Not tainted syzkaller #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:syz-executor    state:D
 stack:28520 pid:6987  tgid:6987  ppid:1      task_flags:0x400040 flags:0x00080000
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5256 [inline]
 __schedule+0x1139/0x6150 kernel/sched/core.c:6863
 __schedule_loop kernel/sched/core.c:6945 [inline]
 schedule+0xe7/0x3a0 kernel/sched/core.c:6960
 schedule_preempt_disabled+0x13/0x30 kernel/sched/core.c:7017
 __mutex_lock_common kernel/locking/mutex.c:692 [inline]
 __mutex_lock+0xc69/0x1ca0 kernel/locking/mutex.c:776
 get_device_parent+0x10a/0x4e0 drivers/base/core.c:3266
 device_add+0xc13/0x1980 drivers/base/core.c:3613
 hci_register_dev+0x328/0xce0 net/bluetooth/hci_core.c:2621
 __vhci_create_device+0x357/0x880 drivers/bluetooth/hci_vhci.c:451
 vhci_create_device drivers/bluetooth/hci_vhci.c:479 [inline]
 vhci_get_user drivers/bluetooth/hci_vhci.c:536 [inline]
 vhci_write+0x2c0/0x480 drivers/bluetooth/hci_vhci.c:616
 new_sync_write fs/read_write.c:593 [inline]
 vfs_write+0x7d3/0x11d0 fs/read_write.c:686
 ksys_write+0x12a/0x250 fs/read_write.c:738
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xcd/0xf80 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fe69918e1c0
RSP: 002b:00007ffec2c3bc38 EFLAGS: 00000202
 ORIG_RAX: 0000000000000001
RAX: ffffffffffffffda RBX: 0000000000000003 RCX: 00007fe69918e1c0
RDX: 0000000000000002 RSI: 00007ffec2c3bc4a RDI: 00000000000000ca
RBP: 00007ffec2c3bd10 R08: 0000000000000000 R09: 00007fe699f1d6c0
R10: 0000000000000000 R11: 0000000000000202 R12: 0000000000000002
R13: 00007ffec2c3bd18 R14: 00007ffec2c3bf98 R15: 0000000000000000
 </TASK>
INFO: task syz-executor:6988 blocked for more than 166 seconds.
      Not tainted syzkaller #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:syz-executor    state:D
 stack:28520 pid:6988  tgid:6988  ppid:1      task_flags:0x400040 flags:0x00080000
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5256 [inline]
 __schedule+0x1139/0x6150 kernel/sched/core.c:6863
 __schedule_loop kernel/sched/core.c:6945 [inline]
 schedule+0xe7/0x3a0 kernel/sched/core.c:6960
 schedule_preempt_disabled+0x13/0x30 kernel/sched/core.c:7017
 __mutex_lock_common kernel/locking/mutex.c:692 [inline]
 __mutex_lock+0xc69/0x1ca0 kernel/locking/mutex.c:776
 get_device_parent+0x10a/0x4e0 drivers/base/core.c:3266
 device_add+0xc13/0x1980 drivers/base/core.c:3613
 hci_register_dev+0x328/0xce0 net/bluetooth/hci_core.c:2621
 __vhci_create_device+0x357/0x880 drivers/bluetooth/hci_vhci.c:451
 vhci_create_device drivers/bluetooth/hci_vhci.c:479 [inline]
 vhci_get_user drivers/bluetooth/hci_vhci.c:536 [inline]
 vhci_write+0x2c0/0x480 drivers/bluetooth/hci_vhci.c:616
 new_sync_write fs/read_write.c:593 [inline]
 vfs_write+0x7d3/0x11d0 fs/read_write.c:686
 ksys_write+0x12a/0x250 fs/read_write.c:738
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xcd/0xf80 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fb7b958e1c0
RSP: 002b:00007fffebdfd2c8 EFLAGS: 00000202
 ORIG_RAX: 0000000000000001
RAX: ffffffffffffffda RBX: 0000000000000003 RCX: 00007fb7b958e1c0
RDX: 0000000000000002 RSI: 00007fffebdfd2da RDI: 00000000000000ca
RBP: 00007fffebdfd3a0 R08: 0000000000000000 R09: 00007fb7ba31d6c0
R10: 0000000000000000 R11: 0000000000000202 R12: 0000000000000002
R13: 00007fffebdfd3a8 R14: 00007fffebdfd628 R15: 0000000000000000
 </TASK>

Showing all locks held in the system:
1 lock held by kworker/R-mm_pe/14:
3 locks held by kworker/1:0/24:
1 lock held by khungtaskd/31:
 #0: 
ffffffff8e3c96a0
 (
rcu_read_lock
){....}-{1:3}
, at: rcu_lock_acquire include/linux/rcupdate.h:331 [inline]
, at: rcu_read_lock include/linux/rcupdate.h:867 [inline]
, at: debug_show_all_locks+0x36/0x1c0 kernel/locking/lockdep.c:6775
5 locks held by kworker/u9:0/52:
 #0: 
ffff88805e7ed948
 (
(wq_completion)hci0
){+.+.}-{0:0}
, at: process_one_work+0x128d/0x1b20 kernel/workqueue.c:3232
 #1: 
ffffc90000bd7c90
 (
(work_completion)(&hdev->cmd_sync_work)
){+.+.}-{0:0}
, at: process_one_work+0x914/0x1b20 kernel/workqueue.c:3233
 #2: 
ffff88805e654ec0
 (
&hdev->req_lock
){+.+.}-{4:4}
, at: hci_cmd_sync_work+0x175/0x470 net/bluetooth/hci_sync.c:331
 #3: 
ffff88805e6540c0
 (
&hdev->lock){+.+.}-{4:4}
, at: hci_abort_conn_sync+0x13f/0xb20 net/bluetooth/hci_sync.c:5702
 #4: 
ffff88801badd988
 (
&root->kernfs_rwsem
){++++}-{4:4}
, at: kernfs_find_and_get_ns+0x2f/0x70 fs/kernfs/dir.c:936
5 locks held by kworker/u8:15/4025:
1 lock held by udevd/5187:
 #0: 
ffff88801badd988
 (&root->kernfs_rwsem
){++++}-{4:4}
, at: kernfs_dop_revalidate+0xa5/0x740 fs/kernfs/dir.c:1183
2 locks held by getty/5575:
 #0: 
ffff88814e3cb0a0
 (
&tty->ldisc_sem
){++++}-{0:0}
, at: tty_ldisc_ref_wait+0x24/0x80 drivers/tty/tty_ldisc.c:243
 #1: 
ffffc9000332b2f0
 (
&ldata->atomic_read_lock
){+.+.}-{4:4}
, at: n_tty_read+0x41b/0x1510 drivers/tty/n_tty.c:2211
5 locks held by kworker/1:2/5835:
5 locks held by kworker/u9:2/5926:
 #0: 
ffff888030e2f148
 (
(wq_completion)hci3
){+.+.}-{0:0}
, at: process_one_work+0x128d/0x1b20 kernel/workqueue.c:3232
 #1: 
ffffc9000423fc90
 (
(work_completion)(&hdev->cmd_sync_work)
){+.+.}-{0:0}
, at: process_one_work+0x914/0x1b20 kernel/workqueue.c:3233
 #2: 
ffff888061610ec0
 (
&hdev->req_lock
){+.+.}-{4:4}
, at: hci_cmd_sync_work+0x175/0x470 net/bluetooth/hci_sync.c:331
 #3: 
ffff8880616100c0
 (
&hdev->lock
){+.+.}-{4:4}
, at: hci_abort_conn_sync+0x13f/0xb20 net/bluetooth/hci_sync.c:5702
 #4: 
ffffffff8e3d4df8
 (
rcu_state.exp_mutex
){+.+.}-{4:4}
, at: exp_funnel_lock+0x1a3/0x3c0 kernel/rcu/tree_exp.h:343
7 locks held by kworker/0:2/5955:
 #0: 
ffff888020af7148
 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: process_one_work+0x128d/0x1b20 kernel/workqueue.c:3232
 #1: ffffc90005307c90 ((work_completion)(&hub->events)){+.+.}-{0:0}, at: process_one_work+0x914/0x1b20 kernel/workqueue.c:3233
 #2: 
ffff888143b35198
 (
&dev->mutex
){....}-{4:4}
, at: device_lock include/linux/device.h:895 [inline]
, at: hub_event+0x1c0/0x52f0 drivers/usb/core/hub.c:5899
 #3: 
ffff88807ba4c198
 (
&dev->mutex
){....}-{4:4}
, at: device_lock include/linux/device.h:895 [inline]
, at: __device_attach+0x7e/0x4e0 drivers/base/dd.c:1006
 #4: 
ffff888031a7b160
 (
&dev->mutex
){....}-{4:4}
, at: device_lock include/linux/device.h:895 [inline]
, at: __device_attach+0x7e/0x4e0 drivers/base/dd.c:1006
 #5: 
ffffffff8f2b6688
 (
gdp_mutex
){+.+.}-{4:4}
, at: get_device_parent+0x10a/0x4e0 drivers/base/core.c:3266
 #6: 
ffff88801badd988
 (
&root->kernfs_rwsem
){++++}-{4:4}
, at: kernfs_activate fs/kernfs/dir.c:1428 [inline]
, at: kernfs_add_one+0x349/0x840 fs/kernfs/dir.c:837
7 locks held by kworker/u9:4/5986:
 #0: 
ffff888075f01148
 (
(wq_completion)hci2
){+.+.}-{0:0}
, at: process_one_work+0x128d/0x1b20 kernel/workqueue.c:3232
 #1: 
ffffc90003e4fc90
 (
(work_completion)(&hdev->cmd_sync_work)){+.+.}-{0:0}, at: process_one_work+0x914/0x1b20 kernel/workqueue.c:3233
 #2: ffff88805e688ec0 (&hdev->req_lock){+.+.}-{4:4}, at: hci_cmd_sync_work+0x175/0x470 net/bluetooth/hci_sync.c:331
 #3: 
ffff88805e6880c0
 (
&hdev->lock
){+.+.}-{4:4}
, at: hci_abort_conn_sync+0x13f/0xb20 net/bluetooth/hci_sync.c:5702
 #4: 
ffffffff903bee08
 (
hci_cb_list_lock
){+.+.}-{4:4}
, at: hci_connect_cfm include/net/bluetooth/hci_core.h:2128 [inline]
, at: hci_conn_failed+0x14f/0x360 net/bluetooth/hci_conn.c:1336
 #5: 
ffff8880587f7338
 (&conn->lock
#2
){+.+.}-{4:4}
, at: l2cap_conn_del+0x80/0x760 net/bluetooth/l2cap_core.c:1763
 #6: 
ffffffff8e3d4df8
 (
rcu_state.exp_mutex
){+.+.}-{4:4}
, at: exp_funnel_lock+0x1a3/0x3c0 kernel/rcu/tree_exp.h:343
5 locks held by kworker/u9:5/5989:
6 locks held by kworker/1:5/6123:
 #0: 
ffff888020af7148 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: process_one_work+0x128d/0x1b20 kernel/workqueue.c:3232
 #1: ffffc900030f7c90 ((work_completion)(&hub->events)){+.+.}-{0:0}, at: process_one_work+0x914/0x1b20 kernel/workqueue.c:3233
 #2: ffff8880298dd198 (&dev->mutex
){....}-{4:4}
, at: device_lock include/linux/device.h:895 [inline]
, at: hub_event+0x1c0/0x52f0 drivers/usb/core/hub.c:5899
 #3: ffff8880298f8518 (&port_dev->status_lock
){+.+.}-{4:4}
, at: usb_lock_port drivers/usb/core/hub.c:3252 [inline]
, at: hub_port_connect drivers/usb/core/hub.c:5464 [inline]
, at: hub_port_connect_change drivers/usb/core/hub.c:5707 [inline]
, at: port_event drivers/usb/core/hub.c:5871 [inline]
, at: hub_event+0x2b87/0x52f0 drivers/usb/core/hub.c:5953
 #4: 
ffff8881437dd168 (hcd->address0_mutex
){+.+.}-{4:4}
, at: hub_port_connect drivers/usb/core/hub.c:5465 [inline]
, at: hub_port_connect_change drivers/usb/core/hub.c:5707 [inline]
, at: port_event drivers/usb/core/hub.c:5871 [inline]
, at: hub_event+0x2bb0/0x52f0 drivers/usb/core/hub.c:5953
 #5: ffffffff8e3c96a0 (rcu_read_lock){....}-{1:3}
, at: raw_spin_rq_lock_nested+0x29/0x130 kernel/sched/core.c:639
2 locks held by kworker/1:8/6135:
4 locks held by kworker/1:13/6324:
 #0: ffff88813ff51948 ((wq_completion)events){+.+.}-{0:0}
, at: process_one_work+0x128d/0x1b20 kernel/workqueue.c:3232
 #1: 
ffffc90003f0fc90
 (
kernfs_notify_work
){+.+.}-{0:0}
, at: process_one_work+0x914/0x1b20 kernel/workqueue.c:3233
 #2: ffff88801baddab8
 (
&root->kernfs_supers_rwsem
){++++}-{4:4}
, at: kernfs_notify_workfn+0xf7/0xb30 fs/kernfs/file.c:932
 #3: ffff88801badd988 (&root->kernfs_rwsem){++++}-{4:4}, at: kernfs_notify_workfn+0xff/0xb30 fs/kernfs/file.c:933
4 locks held by kworker/u9:6/6335:
 #0: ffff888061590148 ((wq_completion)hci1){+.+.}-{0:0}, at: process_one_work+0x128d/0x1b20 kernel/workqueue.c:3232
 #1: ffffc90004977c90 ((work_completion)(&hdev->cmd_sync_work)){+.+.}-{0:0}, at: process_one_work+0x914/0x1b20 kernel/workqueue.c:3233
 #2: ffff88806ac58ec0 (&hdev->req_lock){+.+.}-{4:4}, at: hci_cmd_sync_work+0x175/0x470 net/bluetooth/hci_sync.c:331
 #3: ffff88806ac580c0 (&hdev->lock){+.+.}-{4:4}, at: hci_abort_conn_sync+0x13f/0xb20 net/bluetooth/hci_sync.c:5702
2 locks held by kworker/0:12/6522:
3 locks held by kworker/1:14/6523:
6 locks held by kworker/1:15/6534:
 #0: ffff888020af7148 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: process_one_work+0x128d/0x1b20 kernel/workqueue.c:3232
 #1: ffffc90004df7c90 ((work_completion)(&hub->events)){+.+.}-{0:0}, at: process_one_work+0x914/0x1b20 kernel/workqueue.c:3233
 #2: 
ffff888143b30198 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:895 [inline]
ffff888143b30198 (&dev->mutex){....}-{4:4}, at: hub_event+0x1c0/0x52f0 drivers/usb/core/hub.c:5899
 #3: 
ffff88807b3ab198
 (
&dev->mutex
){....}-{4:4}
, at: device_lock include/linux/device.h:895 [inline]
, at: __device_attach+0x7e/0x4e0 drivers/base/dd.c:1006
 #4: 
ffff8880757f2160
 (
&dev->mutex
){....}-{4:4}
, at: device_lock include/linux/device.h:895 [inline]
, at: __device_attach+0x7e/0x4e0 drivers/base/dd.c:1006
 #5: 
ffff88801badd988
 (
&root->kernfs_rwsem){++++}-{4:4}
, at: kernfs_add_one+0x38/0x840 fs/kernfs/dir.c:794
1 lock held by syz-executor/6643:
1 lock held by syz-executor/6649:
 #0: 
ffffffff8e3d4df8
 (
rcu_state.exp_mutex
){+.+.}-{4:4}
, at: exp_funnel_lock+0x1a3/0x3c0 kernel/rcu/tree_exp.h:343
1 lock held by kworker/R-wg-cr/6684:
 #0: 
ffffffff8e27f128
 (
wq_pool_attach_mutex
){+.+.}-{4:4}
, at: worker_attach_to_pool+0x27/0x420 kernel/workqueue.c:2672
1 lock held by kworker/R-wg-cr/6698:
 #0: 
ffffffff8e27f128
 (
wq_pool_attach_mutex
){+.+.}-{4:4}
, at: worker_attach_to_pool+0x27/0x420 kernel/workqueue.c:2672
1 lock held by kworker/R-wg-cr/6699:
 #0: 
ffffffff8e27f128
 (
wq_pool_attach_mutex
){+.+.}-{4:4}
, at: worker_attach_to_pool+0x27/0x420 kernel/workqueue.c:2672
1 lock held by kworker/R-wg-cr/6700:
 #0: 
ffffffff8e27f128
 (
wq_pool_attach_mutex
){+.+.}-{4:4}
, at: worker_attach_to_pool+0x27/0x420 kernel/workqueue.c:2672
1 lock held by kworker/R-wg-cr/6701:
 #0: 
ffffffff8e27f128
 (
wq_pool_attach_mutex
){+.+.}-{4:4}
, at: worker_attach_to_pool+0x27/0x420 kernel/workqueue.c:2672
1 lock held by kworker/R-wg-cr/6702:
 #0: 
ffffffff8e27f128
 (
wq_pool_attach_mutex
){+.+.}-{4:4}
, at: worker_attach_to_pool+0x27/0x420 kernel/workqueue.c:2672
1 lock held by kworker/R-wg-cr/6707:
1 lock held by kworker/R-wg-cr/6712:
 #0: 
ffffffff8e27f128
 (
wq_pool_attach_mutex
){+.+.}-{4:4}
, at: worker_detach_from_pool kernel/workqueue.c:2730 [inline]
, at: rescuer_thread+0x69f/0xf10 kernel/workqueue.c:3560
1 lock held by kworker/R-wg-cr/6717:
 #0: 
ffffffff8e27f128
 (
wq_pool_attach_mutex
){+.+.}-{4:4}
, at: worker_attach_to_pool+0x27/0x420 kernel/workqueue.c:2672
4 locks held by udevd/6856:
 #0: 
ffff888059f50e80
 (
&p->lock
){+.+.}-{4:4}
, at: seq_read_iter+0xe1/0x12d0 fs/seq_file.c:182
 #1: 
ffff88807cf44488
 (
&of->mutex
#2
){+.+.}-{4:4}
, at: kernfs_seq_start+0x4f/0x2a0 fs/kernfs/file.c:172
 #2: 
ffff888074405878
 (
kn->active
#28
){++++}-{0:0}
, at: kernfs_get_active_of fs/kernfs/file.c:80 [inline]
, at: kernfs_seq_start+0xbc/0x2a0 fs/kernfs/file.c:173
 #3: 
ffff88807ba4c198
 (
&dev->mutex
){....}-{4:4}
, at: device_lock_interruptible include/linux/device.h:900 [inline]
, at: serial_show+0x26/0xa0 drivers/usb/core/sysfs.c:143
3 locks held by kworker/1:17/6915:
 #0: 
ffff88813ff51948
 (
(wq_completion)events
){+.+.}-{0:0}
, at: process_one_work+0x128d/0x1b20 kernel/workqueue.c:3232
 #1: 
ffffc90004ae7c90
 (
(work_completion)(&gadget->work)
){+.+.}-{0:0}
, at: process_one_work+0x914/0x1b20 kernel/workqueue.c:3233
 #2: 
ffff88801badd988
 (
&root->kernfs_rwsem
){++++}-{4:4}
, at: kernfs_find_and_get_ns+0x2f/0x70 fs/kernfs/dir.c:936
1 lock held by syz.2.165/6929:
 #0: 
ffff88801badd988
 (
&root->kernfs_rwsem
){++++}-{4:4}
, at: kernfs_remove fs/kernfs/dir.c:1552 [inline]
, at: kernfs_remove+0x2f/0x50 fs/kernfs/dir.c:1543
1 lock held by syz.0.167/6948:
 #0: 
ffff88801badd988
 (
&root->kernfs_rwsem
){++++}-{4:4}
, at: kernfs_remove_by_name_ns+0x3d/0x100 fs/kernfs/dir.c:1715
4 locks held by udevd/6947:
 #0: 
ffff888076a930a0
 (
&p->lock
){+.+.}-{4:4}
, at: seq_read_iter+0xe1/0x12d0 fs/seq_file.c:182
 #1: 
ffff88805bf9b488
 (&of->mutex#2){+.+.}-{4:4}, at: kernfs_seq_start+0x4f/0x2a0 fs/kernfs/file.c:172
 #2: 
ffff888035ea04b8
 (
kn->active
#23
){++++}-{0:0}
, at: kernfs_get_active_of fs/kernfs/file.c:80 [inline]
, at: kernfs_seq_start+0xbc/0x2a0 fs/kernfs/file.c:173
 #3: 
ffff88807b3ab198
 (
&dev->mutex
){....}-{4:4}
, at: device_lock_interruptible include/linux/device.h:900 [inline]
, at: manufacturer_show+0x26/0xa0 drivers/usb/core/sysfs.c:142
1 lock held by rm/6978:
1 lock held by syz-executor/6980:
2 locks held by syz-executor/6983:
2 locks held by syz-executor/6984:
 #0: 
ffff88805b0f9118
 (
&data->open_mutex
){+.+.}-{4:4}
, at: vhci_create_device drivers/bluetooth/hci_vhci.c:478 [inline]
, at: vhci_get_user drivers/bluetooth/hci_vhci.c:536 [inline]
, at: vhci_write+0x2b4/0x480 drivers/bluetooth/hci_vhci.c:616
 #1: 
ffffffff8f2b6688
 (gdp_mutex){+.+.}-{4:4}, at: get_device_parent+0x10a/0x4e0 drivers/base/core.c:3266
2 locks held by syz-executor/6987:
 #0: ffff88807a2fc918 (&data->open_mutex){+.+.}-{4:4}, at: vhci_create_device drivers/bluetooth/hci_vhci.c:478 [inline]
 #0: ffff88807a2fc918 (&data->open_mutex){+.+.}-{4:4}, at: vhci_get_user drivers/bluetooth/hci_vhci.c:536 [inline]
 #0: ffff88807a2fc918 (&data->open_mutex){+.+.}-{4:4}, at: vhci_write+0x2b4/0x480 drivers/bluetooth/hci_vhci.c:616
 #1: ffffffff8f2b6688
 (
gdp_mutex){+.+.}-{4:4}, at: get_device_parent+0x10a/0x4e0 drivers/base/core.c:3266
2 locks held by syz-executor/6988:
 #0: ffff88807a2fe918 (&data->open_mutex){+.+.}-{4:4}, at: vhci_create_device drivers/bluetooth/hci_vhci.c:478 [inline]
 #0: ffff88807a2fe918 (&data->open_mutex){+.+.}-{4:4}, at: vhci_get_user drivers/bluetooth/hci_vhci.c:536 [inline]
 #0: ffff88807a2fe918 (&data->open_mutex){+.+.}-{4:4}, at: vhci_write+0x2b4/0x480 drivers/bluetooth/hci_vhci.c:616
 #1: 
ffffffff8f2b6688
 (
gdp_mutex
){+.+.}-{4:4}
, at: get_device_parent+0x10a/0x4e0 drivers/base/core.c:3266
2 locks held by syz-executor/6990:
 #0: 
ffff888020ed3118
 (
&data->open_mutex
){+.+.}-{4:4}
, at: vhci_create_device drivers/bluetooth/hci_vhci.c:478 [inline]
, at: vhci_get_user drivers/bluetooth/hci_vhci.c:536 [inline]
, at: vhci_write+0x2b4/0x480 drivers/bluetooth/hci_vhci.c:616
 #1: 
ffffffff8f2b6688
 (
gdp_mutex
){+.+.}-{4:4}
, at: get_device_parent+0x10a/0x4e0 drivers/base/core.c:3266
2 locks held by syz-executor/6993:
 #0: 
ffff888029d64118
 (&data->open_mutex
){+.+.}-{4:4}
, at: vhci_create_device drivers/bluetooth/hci_vhci.c:478 [inline]
, at: vhci_get_user drivers/bluetooth/hci_vhci.c:536 [inline]
, at: vhci_write+0x2b4/0x480 drivers/bluetooth/hci_vhci.c:616
 #1: 
ffffffff8f2b6688
 (gdp_mutex
){+.+.}-{4:4}, at: get_device_parent+0x10a/0x4e0 drivers/base/core.c:3266
2 locks held by syz-executor/6994:
 #0: ffff888030031918 (&data->open_mutex){+.+.}-{4:4}, at: vhci_create_device drivers/bluetooth/hci_vhci.c:478 [inline]
 #0: ffff888030031918 (&data->open_mutex){+.+.}-{4:4}, at: vhci_get_user drivers/bluetooth/hci_vhci.c:536 [inline]
 #0: ffff888030031918 (&data->open_mutex){+.+.}-{4:4}, at: vhci_write+0x2b4/0x480 drivers/bluetooth/hci_vhci.c:616
 #1: ffffffff8f2b6688 (gdp_mutex){+.+.}-{4:4}, at: get_device_parent+0x10a/0x4e0 drivers/base/core.c:3266
2 locks held by syz-executor/6997:
 #0: ffff888028cf6118 (&data->open_mutex){+.+.}-{4:4}, at: vhci_create_device drivers/bluetooth/hci_vhci.c:478 [inline]
 #0: ffff888028cf6118 (&data->open_mutex){+.+.}-{4:4}, at: vhci_get_user drivers/bluetooth/hci_vhci.c:536 [inline]
 #0: ffff888028cf6118 (&data->open_mutex){+.+.}-{4:4}, at: vhci_write+0x2b4/0x480 drivers/bluetooth/hci_vhci.c:616
 #1: ffffffff8f2b6688 (gdp_mutex){+.+.}-{4:4}, at: get_device_parent+0x10a/0x4e0 drivers/base/core.c:3266
2 locks held by syz-executor/6998:
 #0: ffff88805644d918 (&data->open_mutex){+.+.}-{4:4}, at: vhci_create_device drivers/bluetooth/hci_vhci.c:478 [inline]
 #0: ffff88805644d918 (&data->open_mutex){+.+.}-{4:4}, at: vhci_get_user drivers/bluetooth/hci_vhci.c:536 [inline]
 #0: ffff88805644d918 (&data->open_mutex){+.+.}-{4:4}, at: vhci_write+0x2b4/0x480 drivers/bluetooth/hci_vhci.c:616
 #1: ffffffff8f2b6688 (gdp_mutex){+.+.}-{4:4}, at: get_device_parent+0x10a/0x4e0 drivers/base/core.c:3266
2 locks held by syz-executor/7001:
 #0: 
ffff888059c67118
 (
&data->open_mutex
){+.+.}-{4:4}
, at: vhci_create_device drivers/bluetooth/hci_vhci.c:478 [inline]
, at: vhci_get_user drivers/bluetooth/hci_vhci.c:536 [inline]
, at: vhci_write+0x2b4/0x480 drivers/bluetooth/hci_vhci.c:616
 #1: 
ffffffff8f2b6688
 (
gdp_mutex
){+.+.}-{4:4}
, at: get_device_parent+0x10a/0x4e0 drivers/base/core.c:3266
2 locks held by syz-executor/7004:
 #0: 
ffff88805d81b118
 (
&data->open_mutex
){+.+.}-{4:4}
, at: vhci_create_device drivers/bluetooth/hci_vhci.c:478 [inline]
, at: vhci_get_user drivers/bluetooth/hci_vhci.c:536 [inline]
, at: vhci_write+0x2b4/0x480 drivers/bluetooth/hci_vhci.c:616
 #1: 
ffffffff8f2b6688
 (
gdp_mutex
){+.+.}-{4:4}
, at: get_device_parent+0x10a/0x4e0 drivers/base/core.c:3266
2 locks held by syz-executor/7005:
 #0: 
ffff88805d81e918
 (
&data->open_mutex
){+.+.}-{4:4}
, at: vhci_create_device drivers/bluetooth/hci_vhci.c:478 [inline]
, at: vhci_get_user drivers/bluetooth/hci_vhci.c:536 [inline]
, at: vhci_write+0x2b4/0x480 drivers/bluetooth/hci_vhci.c:616
 #1: 
ffffffff8f2b6688
 (
gdp_mutex
){+.+.}-{4:4}
, at: get_device_parent+0x10a/0x4e0 drivers/base/core.c:3266
2 locks held by syz-executor/7008:
 #0: 
ffff88805b7a8118
 (
&data->open_mutex
){+.+.}-{4:4}
, at: vhci_create_device drivers/bluetooth/hci_vhci.c:478 [inline]
, at: vhci_get_user drivers/bluetooth/hci_vhci.c:536 [inline]
, at: vhci_write+0x2b4/0x480 drivers/bluetooth/hci_vhci.c:616
 #1: 
ffffffff8f2b6688
 (
gdp_mutex
){+.+.}-{4:4}
, at: get_device_parent+0x10a/0x4e0 drivers/base/core.c:3266
2 locks held by syz-executor/7009:
 #0: 
ffff888077a0f918
 (
&data->open_mutex
){+.+.}-{4:4}
, at: vhci_create_device drivers/bluetooth/hci_vhci.c:478 [inline]
, at: vhci_get_user drivers/bluetooth/hci_vhci.c:536 [inline]
, at: vhci_write+0x2b4/0x480 drivers/bluetooth/hci_vhci.c:616
 #1: 
ffffffff8f2b6688
 (
gdp_mutex
){+.+.}-{4:4}
, at: get_device_parent+0x10a/0x4e0 drivers/base/core.c:3266
2 locks held by syz-executor/7012:
 #0: 
ffff8880325ce918


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

