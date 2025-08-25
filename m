Return-Path: <linux-usb+bounces-27237-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B559B339E8
	for <lists+linux-usb@lfdr.de>; Mon, 25 Aug 2025 10:51:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 54EAA16BE82
	for <lists+linux-usb@lfdr.de>; Mon, 25 Aug 2025 08:51:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4F9E2BD5AE;
	Mon, 25 Aug 2025 08:51:32 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-io1-f77.google.com (mail-io1-f77.google.com [209.85.166.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D073C28C039
	for <linux-usb@vger.kernel.org>; Mon, 25 Aug 2025 08:51:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756111892; cv=none; b=FarwPXCtGWqUajQNZ/XBWx5eO9HQx0o+zZSDyYFxLV1Z7XQOIyORbQnISvnVvAUvWq42wo77qq8swX1jjjxIgzL78AibumpQdYgBCiF8rhYSJgTTruI735stiXZaJF1ZPJ9WlL3s2bOXgLcpQfk5GeEDMZQ1FgERz3N85LbZYCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756111892; c=relaxed/simple;
	bh=2G0JsDgI+Wq3V0feon2KQDSXSCpdjVZVJXKHJ8zaJ18=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=U1+vl5jI/wWRPJXrHJpHrD17+VdKlvstszJdx9XDUaHib7zYmmlb7ajbeF4d32eEtGk4XXfOswe5yCDuSwZaxOT23UHm8bXxpHUnwjC/Lgt6vb868FBtVfYr87BJoxGOGdoD64Pm+uTkjaOTQpUO9WU814i4rhjzxHXZ5jHr8Mc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f77.google.com with SMTP id ca18e2360f4ac-886e2a4735aso28306039f.3
        for <linux-usb@vger.kernel.org>; Mon, 25 Aug 2025 01:51:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756111890; x=1756716690;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Cz23suFe+AJG+yjUENL7xEpjOJTJmjoJ0r2drDzUscU=;
        b=Y/wP97C58eGW9Emk8NKAnj6JKk0zTWWgJfs3bLf7FaUgPQrdmq6YTItdl+0Su9O0Pf
         kNfSg0JbwWYuSGCPVt/yWC+n9tHlJhnrxU7c9wVhHmYJDjgm1UYIbE/ajVrSUIv921pr
         bS2VI+0nbtWnTrImNVpX7QvUMf1sG7mx/TyMkeObIuQ2Z5/5b1Lk6ME3DlbN0FIRQDcj
         ed0jM649sMSDqTow9RGf5D7g+QU0bZsmvWFIWBAtPjen9UbQ0GnoP/wLXIDd6eaE8udf
         rgEXaFM1pm6H33BjlQ40whjDS0FdH4Z+2155uJuU1CHMvSURZhDuBo4WG5EUAOQ89soM
         4nHg==
X-Forwarded-Encrypted: i=1; AJvYcCUEyb35AXM0Q6WMMjUWhx4qOUFUNlcGPjWiFv2C+jh+O3Czxez1MEp3rUYGcGXzLg3nMs88YJbSuvo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+iGLt4k5uSZg567Vkgks+JjP23xwUSsVaDHV0AJxtzc48sE53
	vTG0HMpoS6oFT2Xds9mwbvA5NIx4kLgzWO5XZxkkGIYIkzV1IbKC6y+o4xGagOHjjmwPcfOD52n
	S4ddT+V/t6aYunlEEuMtBP9oQYjNYZl0yJsxGh4ubiXPAfikyycwCtrvBxGA=
X-Google-Smtp-Source: AGHT+IGeRLcb75zkt/DbskhWS2WfYK9d9qwVjyXTlWGonE1tRBFM3mvjNHTUeonLiwn/1LheNY1xk3Iymz91M5LI3Gh5yYvJ7K1n
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:2591:b0:3e2:9ab4:3ebf with SMTP id
 e9e14a558f8ab-3e921e3b277mr184135545ab.19.1756111889821; Mon, 25 Aug 2025
 01:51:29 -0700 (PDT)
Date: Mon, 25 Aug 2025 01:51:29 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68ac2411.050a0220.37038e.0087.GAE@google.com>
Subject: [syzbot] [usb?] BUG: sleeping function called from invalid context in dummy_dequeue
From: syzbot <syzbot+8baacc4139f12fa77909@syzkaller.appspotmail.com>
To: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    8d245acc1e88 Merge tag 'char-misc-6.17-rc3' of git://git.k..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=11e42062580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=e1e1566c7726877e
dashboard link: https://syzkaller.appspot.com/bug?extid=8baacc4139f12fa77909
compiler:       Debian clang version 20.1.7 (++20250616065708+6146a88f6049-1~exp1~20250616065826.132), Debian LLD 20.1.7
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=13317062580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=14d5ea34580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/096739d8f0ec/disk-8d245acc.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/83a21aa9b978/vmlinux-8d245acc.xz
kernel image: https://storage.googleapis.com/syzbot-assets/7e7f165a3b29/bzImage-8d245acc.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+8baacc4139f12fa77909@syzkaller.appspotmail.com

BUG: sleeping function called from invalid context at kernel/locking/spinlock_rt.c:48
in_atomic(): 0, irqs_disabled(): 1, non_block: 0, pid: 6118, name: syz.0.17
preempt_count: 0, expected: 0
RCU nest depth: 0, expected: 0
1 lock held by syz.0.17/6118:
 #0: ffff888144724058 (&dum_hcd->dum->lock){+.+.}-{3:3}, at: spin_lock include/linux/spinlock_rt.h:44 [inline]
 #0: ffff888144724058 (&dum_hcd->dum->lock){+.+.}-{3:3}, at: dummy_dequeue+0x164/0x480 drivers/usb/gadget/udc/dummy_hcd.c:769
irq event stamp: 5054
hardirqs last  enabled at (5053): [<ffffffff8af9b343>] __raw_spin_unlock_irq include/linux/spinlock_api_smp.h:159 [inline]
hardirqs last  enabled at (5053): [<ffffffff8af9b343>] _raw_spin_unlock_irq+0x23/0x50 kernel/locking/spinlock.c:202
hardirqs last disabled at (5054): [<ffffffff86fc2471>] dummy_dequeue+0x151/0x480 drivers/usb/gadget/udc/dummy_hcd.c:768
softirqs last  enabled at (0): [<ffffffff81828ba9>] rcu_lock_acquire include/linux/rcupdate.h:331 [inline]
softirqs last  enabled at (0): [<ffffffff81828ba9>] rcu_read_lock include/linux/rcupdate.h:841 [inline]
softirqs last  enabled at (0): [<ffffffff81828ba9>] copy_process+0x979/0x3ae0 kernel/fork.c:2043
softirqs last disabled at (0): [<0000000000000000>] 0x0
CPU: 0 UID: 0 PID: 6118 Comm: syz.0.17 Not tainted syzkaller #0 PREEMPT_{RT,(full)} 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 07/12/2025
Call Trace:
 <TASK>
 dump_stack_lvl+0x189/0x250 lib/dump_stack.c:120
 __might_resched+0x44b/0x5d0 kernel/sched/core.c:8957
 __rt_spin_lock kernel/locking/spinlock_rt.c:48 [inline]
 rt_spin_lock+0xc7/0x2c0 kernel/locking/spinlock_rt.c:57
 spin_lock include/linux/spinlock_rt.h:44 [inline]
 dummy_dequeue+0x164/0x480 drivers/usb/gadget/udc/dummy_hcd.c:769
 usb_ep_dequeue+0x66/0x250 drivers/usb/gadget/udc/core.c:330
 raw_process_ep_io+0x5a3/0xaf0 drivers/usb/gadget/legacy/raw_gadget.c:1124
 raw_ioctl_ep_write drivers/usb/gadget/legacy/raw_gadget.c:1152 [inline]
 raw_ioctl+0x22dc/0x3ba0 drivers/usb/gadget/legacy/raw_gadget.c:1324
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:598 [inline]
 __se_sys_ioctl+0xfc/0x170 fs/ioctl.c:584
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xfa/0x3b0 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f1608d4e7eb
Code: 00 48 89 44 24 18 31 c0 48 8d 44 24 60 c7 04 24 10 00 00 00 48 89 44 24 08 48 8d 44 24 20 48 89 44 24 10 b8 10 00 00 00 0f 05 <89> c2 3d 00 f0 ff ff 77 1c 48 8b 44 24 18 64 48 2b 04 25 28 00 00
RSP: 002b:00007ffdcd9fcf80 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 0000000000000044 RCX: 00007f1608d4e7eb
RDX: 00007ffdcd9fd000 RSI: 0000000040085507 RDI: 0000000000000003
RBP: 0000000000000003 R08: 00007f16090a0320 R09: 0000000000000000
R10: 0000000000000003 R11: 0000000000000246 R12: 0000200000000080
R13: 000000000000000a R14: 00007f1608f75fa0 R15: 0000000000000004
 </TASK>


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

