Return-Path: <linux-usb+bounces-26319-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C73CB18635
	for <lists+linux-usb@lfdr.de>; Fri,  1 Aug 2025 19:06:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C76AF3B22D1
	for <lists+linux-usb@lfdr.de>; Fri,  1 Aug 2025 17:05:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AFFE1E2858;
	Fri,  1 Aug 2025 17:05:40 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-io1-f77.google.com (mail-io1-f77.google.com [209.85.166.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 510681DE3C8
	for <linux-usb@vger.kernel.org>; Fri,  1 Aug 2025 17:05:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754067940; cv=none; b=dFoLT4GOziPQYdrr6J70seTzRNIyqwthwiI5JZJPqInHiNZEUpBM9x3VQ+O847OS7Ag+HSOp4ktxrVEK+pzENLILFObq57yZ+EAfEsz5H+wGrjlZUMLLrtT6Fvz2KpOq/sKpkzHr4ulWBSsZ2+2RWAHcliG/iU/6aj63HAIeVT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754067940; c=relaxed/simple;
	bh=P/EWMU55Bbw22j9djSvCpDxyIpppaJ8q75soyuqUxP0=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=Da8zT51eRvEI2OIjl9HjJIdV8SYnw9WGqvbtQ0vHrh6k2F6GZDGf9Le9nKvfP985AkItbM7nw9CFHMwOpACTdOM7CfQ9xDIcY0a4PGX/UKwJRpishwi1uj5YdSIUGH2FSxaUDbPxCoEs7jESyAfudjq63x9rla3zsqhxa9K7Rlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f77.google.com with SMTP id ca18e2360f4ac-8812640a640so124379339f.0
        for <linux-usb@vger.kernel.org>; Fri, 01 Aug 2025 10:05:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754067936; x=1754672736;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XKh/YQKlGzOI37lKmU7d8abAM5JFeACMI2cvGMEujOM=;
        b=NzMtL1s0JmpPc+PCqQCK7OvIj+IHNnvi7pXVsFJYKlv+gS+f+cBQFvemhigxjIP1SC
         WnbKBp0aBpXpgTCACEPposrtKgEdO3H6BLpY3v3axHqKOCedsTTjDk6QqWCniMWQrBN3
         FDPuKJ9/Y5OfOSV4HUX6poptLBJVmaY1UX8tIy4c7Kr5BoxaVFXa7rBhv9dh/ve2HHwV
         1dQt614locVUgbeGtJ65iepS53nai8FFg+vy4bmHJgHqwkYMrooKTozRBrtHolU677Bd
         j/JmZ1x5nf+iEilgS4jKTOFeNVKOUk/dNr4OBIGHbBL///ffUlzq9D01TOYwo3z6G7wQ
         unvA==
X-Forwarded-Encrypted: i=1; AJvYcCX9r5e6/UQrBhmfblPjPGfQXxeZZXo0VO28q7p08ZGbDxv8X5ZXYtiI6BNEpyHuL+E2CuoyNZ+JvK8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxK5PckaDG4jMLMSa85QB6kpTqhIyog+uClN1ePZbAr/IEWhSpL
	fMohGlQGkOpqdXdIvksH/l9BzTUS8icymfs2Ddh5Am8ewTI5HTj2Bd0HPeWHjNVtLgLtZ/IUMxF
	3HFyoLlPAfF5ZtKMlJefktRGMQyKdmVzEwWryWdWHcn3vBwNQXWxJiiJEPJk=
X-Google-Smtp-Source: AGHT+IGFxU2go7qrm/g+T40B6IlNKxMC8MHoIdK5CXWem1W0UsFB6XeS8sCDoJsztarB2VEgrjLYn/T/zW4Os8ztImRXKZuZufWc
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6602:1:b0:876:19b9:1aaa with SMTP id
 ca18e2360f4ac-881683c9f9dmr29312639f.9.1754067936350; Fri, 01 Aug 2025
 10:05:36 -0700 (PDT)
Date: Fri, 01 Aug 2025 10:05:36 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <688cf3e0.a00a0220.26d0e1.0074.GAE@google.com>
Subject: [syzbot] [usb?] upstream test error: BUG: sleeping function called
 from invalid context in kcov_remote_start
From: syzbot <syzbot+95069c82577357ff89d8@syzkaller.appspotmail.com>
To: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, llvm@lists.linux.dev, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    89748acdf226 Merge tag 'drm-next-2025-08-01' of https://gi..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=164a9cf0580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=caba3b7d5edc3bd1
dashboard link: https://syzkaller.appspot.com/bug?extid=95069c82577357ff89d8
compiler:       Debian clang version 20.1.7 (++20250616065708+6146a88f6049-1~exp1~20250616065826.132), Debian LLD 20.1.7

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/7d6418d10fb8/disk-89748acd.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/4608f748b818/vmlinux-89748acd.xz
kernel image: https://storage.googleapis.com/syzbot-assets/92e2adcd74de/bzImage-89748acd.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+95069c82577357ff89d8@syzkaller.appspotmail.com

BUG: sleeping function called from invalid context at kernel/locking/spinlock_rt.c:48
in_atomic(): 0, irqs_disabled(): 1, non_block: 0, pid: 30, name: ksoftirqd/1
preempt_count: 0, expected: 0
RCU nest depth: 2, expected: 2
7 locks held by ksoftirqd/1/30:
 #0: ffffffff8d64a6a0 (local_bh){.+.+}-{1:3}, at: __local_bh_disable_ip+0xa1/0x400 kernel/softirq.c:163
 #1: ffff8880b8923d90 ((softirq_ctrl.lock)){+.+.}-{3:3}, at: spin_lock include/linux/spinlock_rt.h:44 [inline]
 #1: ffff8880b8923d90 ((softirq_ctrl.lock)){+.+.}-{3:3}, at: __local_bh_disable_ip+0x264/0x400 kernel/softirq.c:168
 #2: ffffffff8d7a8b00 (rcu_read_lock){....}-{1:3}, at: rcu_lock_acquire include/linux/rcupdate.h:331 [inline]
 #2: ffffffff8d7a8b00 (rcu_read_lock){....}-{1:3}, at: rcu_read_lock include/linux/rcupdate.h:841 [inline]
 #2: ffffffff8d7a8b00 (rcu_read_lock){....}-{1:3}, at: __rt_spin_lock kernel/locking/spinlock_rt.c:50 [inline]
 #2: ffffffff8d7a8b00 (rcu_read_lock){....}-{1:3}, at: rt_spin_lock+0x1bb/0x2c0 kernel/locking/spinlock_rt.c:57
 #3: ffffffff8d7a8b00 (rcu_read_lock){....}-{1:3}, at: __local_bh_disable_ip+0xa1/0x400 kernel/softirq.c:163
 #4: ffff88801989a138 ((wq_completion)events_bh){+...}-{0:0}, at: process_one_work kernel/workqueue.c:3211 [inline]
 #4: ffff88801989a138 ((wq_completion)events_bh){+...}-{0:0}, at: process_scheduled_works+0x9b4/0x17b0 kernel/workqueue.c:3319
 #5: ffffc90000a4fa00 ((work_completion)(&bh->bh)){+...}-{0:0}, at: process_one_work kernel/workqueue.c:3212 [inline]
 #5: ffffc90000a4fa00 ((work_completion)(&bh->bh)){+...}-{0:0}, at: process_scheduled_works+0x9ef/0x17b0 kernel/workqueue.c:3319
 #6: ffff8880b8928b50 ((lock)#3){+.+.}-{3:3}, at: spin_lock include/linux/spinlock_rt.h:44 [inline]
 #6: ffff8880b8928b50 ((lock)#3){+.+.}-{3:3}, at: kcov_remote_start+0x92/0x460 kernel/kcov.c:865
irq event stamp: 58091
hardirqs last  enabled at (58090): [<ffffffff8af459c5>] __raw_spin_unlock_irqrestore include/linux/spinlock_api_smp.h:151 [inline]
hardirqs last  enabled at (58090): [<ffffffff8af459c5>] _raw_spin_unlock_irqrestore+0x85/0x110 kernel/locking/spinlock.c:194
hardirqs last disabled at (58091): [<ffffffff86a72b95>] kcov_remote_start_usb_softirq include/linux/kcov.h:88 [inline]
hardirqs last disabled at (58091): [<ffffffff86a72b95>] __usb_hcd_giveback_urb+0x3f5/0x710 drivers/usb/core/hcd.c:1662
softirqs last  enabled at (58074): [<ffffffff8184ff9e>] ksoftirqd_run_end kernel/softirq.c:282 [inline]
softirqs last  enabled at (58074): [<ffffffff8184ff9e>] run_ksoftirqd+0xce/0x210 kernel/softirq.c:969
softirqs last disabled at (58082): [<ffffffff818e7aff>] smpboot_thread_fn+0x53f/0xa60 kernel/smpboot.c:160
CPU: 1 UID: 0 PID: 30 Comm: ksoftirqd/1 Tainted: G        W           6.16.0-syzkaller-10499-g89748acdf226 #0 PREEMPT_{RT,(full)} 
Tainted: [W]=WARN
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 07/12/2025
Call Trace:
 <TASK>
 dump_stack_lvl+0x189/0x250 lib/dump_stack.c:120
 __might_resched+0x44b/0x5d0 kernel/sched/core.c:8957
 __rt_spin_lock kernel/locking/spinlock_rt.c:48 [inline]
 rt_spin_lock+0xc7/0x2c0 kernel/locking/spinlock_rt.c:57
 spin_lock include/linux/spinlock_rt.h:44 [inline]
 kcov_remote_start+0x92/0x460 kernel/kcov.c:865
 kcov_remote_start_usb include/linux/kcov.h:55 [inline]
 kcov_remote_start_usb_softirq include/linux/kcov.h:89 [inline]
 __usb_hcd_giveback_urb+0x427/0x710 drivers/usb/core/hcd.c:1662
 usb_giveback_urb_bh+0x296/0x420 drivers/usb/core/hcd.c:1697
 process_one_work kernel/workqueue.c:3236 [inline]
 process_scheduled_works+0xade/0x17b0 kernel/workqueue.c:3319
 bh_worker+0x2b1/0x600 kernel/workqueue.c:3579
 tasklet_action+0xc/0x70 kernel/softirq.c:854
 handle_softirqs+0x22f/0x710 kernel/softirq.c:579
 run_ksoftirqd+0xac/0x210 kernel/softirq.c:968
 smpboot_thread_fn+0x53f/0xa60 kernel/smpboot.c:160
 kthread+0x70e/0x8a0 kernel/kthread.c:464
 ret_from_fork+0x3f9/0x770 arch/x86/kernel/process.c:148
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>


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

