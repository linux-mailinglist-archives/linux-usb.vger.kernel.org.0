Return-Path: <linux-usb+bounces-28041-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C28E0B55DCC
	for <lists+linux-usb@lfdr.de>; Sat, 13 Sep 2025 03:58:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E4F901C886BE
	for <lists+linux-usb@lfdr.de>; Sat, 13 Sep 2025 01:59:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B10BC1C8FBA;
	Sat, 13 Sep 2025 01:58:35 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-il1-f205.google.com (mail-il1-f205.google.com [209.85.166.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCB2D35958
	for <linux-usb@vger.kernel.org>; Sat, 13 Sep 2025 01:58:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757728715; cv=none; b=MU9RQ7umVTbz9f4SrelZTh8rBNCxPf55DsczfUMEL1hQ9OIu9jeH2OBYkp6rMN/8iNcn+g52Ma/UD8R4cgi0kGjmG1OUnoNNDEQEmdx/N7PDjZ5deJl3YCdxWsWEJulZqrPgXDatyG7KB/6iScK9PmoFZB9kXTaCXPeIG8wY12s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757728715; c=relaxed/simple;
	bh=YfsFrBEM6dQSWXn9QYLu+eLVmzUeXXWYVcNM73GPTvw=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=QXm+lfJrOoKrhS7A45+wJZVVf+ttroyvoHpG9fg9dTD5GRl0O3T3OH6sLiEkF++BB6uZr2JTgNkoSfjEprJ6IBdhrHQ+t2W25ttbPdJqRnkTNOizq/7teESoEpqbrJQQtg6o8ie/bAzSIkY1Dcj995YbZge/LDiPN/Sb2/7JRlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f205.google.com with SMTP id e9e14a558f8ab-40194dd544eso34988115ab.2
        for <linux-usb@vger.kernel.org>; Fri, 12 Sep 2025 18:58:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757728713; x=1758333513;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nu5tpPWI6DOnm2H3qnfDD7LKCnatU/TOIZMkWVfy5Y0=;
        b=ieWXicPrB6JquzxJpI+UZhM3TZkjHjqdqzgW03vrLRhsL2gDdSe5xZ4eEMpHwn/M8k
         0QEx9dKsPrW6ln/Qk+7WroWdttedzP2hLVzkL2Cs4d8prFNG/f2AzQJ6IpqFA+yzvDJD
         ccBxZaNkvK0VJ1i0dStFMAZUG3uM2GRGaW0tBBmURPUpoAFxxk6IiQdeqpqBXuvy0xUE
         lnlHqPOgrZsimCykSsISAU+F0jRgTt+yHSePGaiuxpliYHCD/AR5AW3ovUMeQINvOmJh
         1Zt6h7bvSVhVpCW72MNn9LwL7UCxfJOlNF9hsfLXmg9LkwuSJsB7ULf8H+YtUG3Iyn2C
         n4MA==
X-Forwarded-Encrypted: i=1; AJvYcCV/Q1N7xrNwSGjDKSMnLrPmplmCqUtGll+jHsOzehrzTJ/blKZDwEzzXI08Puin8bN69JT0/8vV2uc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwTSV5Tj9IonT8b9XcHnK+51A100xnvqe6kgM9oecUbIjWJCIfc
	O7O77xXzmy3KrX+Y8NyJ1uIL0MnSWYIJOaFgBUkiwBCTjoQ6spceOOrfKYfHZWK32KRFjj3qo1E
	Amhu4oKUPHCKn7Qu/BMilZJfqixOdLkHbljNtEzv83NlHm15LfHK4d8yAGgI=
X-Google-Smtp-Source: AGHT+IE1AybhJoQ4FgZaQunRkenK/bNt8m0S7FGrdJm4D0+v4GnXK0n/tzHIII1Q/UbRcNB//cot0xl5/SCvcMPM+rFlF9YSOg/f
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:214f:b0:3f2:a7ef:bd88 with SMTP id
 e9e14a558f8ab-4209d40ff4cmr66166605ab.5.1757728713011; Fri, 12 Sep 2025
 18:58:33 -0700 (PDT)
Date: Fri, 12 Sep 2025 18:58:32 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68c4cfc8.050a0220.2ff435.0369.GAE@google.com>
Subject: [syzbot] [usb?] BUG: sleeping function called from invalid context in mon_complete
From: syzbot <syzbot+205ef33a3b636b4181fb@syzkaller.appspotmail.com>
To: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    f777d1112ee5 Merge tag 'vfs-6.17-rc6.fixes' of git://git.k..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=10d23562580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=429771c55b615e85
dashboard link: https://syzkaller.appspot.com/bug?extid=205ef33a3b636b4181fb
compiler:       Debian clang version 20.1.8 (++20250708063551+0c9f909b7976-1~exp1~20250708183702.136), Debian LLD 20.1.8

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/c6eded69cf3a/disk-f777d111.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/9b977d9bf359/vmlinux-f777d111.xz
kernel image: https://storage.googleapis.com/syzbot-assets/0743e13a2027/bzImage-f777d111.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+205ef33a3b636b4181fb@syzkaller.appspotmail.com

usb 38-1: SetAddress Request (5) to port 0
BUG: sleeping function called from invalid context at kernel/locking/spinlock_rt.c:48
in_atomic(): 0, irqs_disabled(): 1, non_block: 0, pid: 45, name: kworker/1:1
preempt_count: 0, expected: 0
RCU nest depth: 0, expected: 0
6 locks held by kworker/1:1/45:
 #0: ffff888021690938 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3211 [inline]
 #0: ffff888021690938 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: process_scheduled_works+0x9b4/0x17b0 kernel/workqueue.c:3319
 #1: ffffc90000b67bc0 ((work_completion)(&hub->events)){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3212 [inline]
 #1: ffffc90000b67bc0 ((work_completion)(&hub->events)){+.+.}-{0:0}, at: process_scheduled_works+0x9ef/0x17b0 kernel/workqueue.c:3319
 #2: ffff888146758188 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:911 [inline]
 #2: ffff888146758188 (&dev->mutex){....}-{4:4}, at: hub_event+0x184/0x4a20 drivers/usb/core/hub.c:5898
 #3: ffff88814675d5b8 (&port_dev->status_lock){+.+.}-{4:4}, at: usb_lock_port drivers/usb/core/hub.c:3251 [inline]
 #3: ffff88814675d5b8 (&port_dev->status_lock){+.+.}-{4:4}, at: hub_port_connect drivers/usb/core/hub.c:5463 [inline]
 #3: ffff88814675d5b8 (&port_dev->status_lock){+.+.}-{4:4}, at: hub_port_connect_change drivers/usb/core/hub.c:5706 [inline]
 #3: ffff88814675d5b8 (&port_dev->status_lock){+.+.}-{4:4}, at: port_event drivers/usb/core/hub.c:5870 [inline]
 #3: ffff88814675d5b8 (&port_dev->status_lock){+.+.}-{4:4}, at: hub_event+0x21b8/0x4a20 drivers/usb/core/hub.c:5952
 #4: ffff8880283ada58 (hcd->address0_mutex){+.+.}-{4:4}, at: hub_port_connect drivers/usb/core/hub.c:5464 [inline]
 #4: ffff8880283ada58 (hcd->address0_mutex){+.+.}-{4:4}, at: hub_port_connect_change drivers/usb/core/hub.c:5706 [inline]
 #4: ffff8880283ada58 (hcd->address0_mutex){+.+.}-{4:4}, at: port_event drivers/usb/core/hub.c:5870 [inline]
 #4: ffff8880283ada58 (hcd->address0_mutex){+.+.}-{4:4}, at: hub_event+0x21e5/0x4a20 drivers/usb/core/hub.c:5952
 #5: ffff8880289ba668 (&mbus->lock#2){+.+.}-{3:3}, at: spin_lock include/linux/spinlock_rt.h:44 [inline]
 #5: ffff8880289ba668 (&mbus->lock#2){+.+.}-{3:3}, at: mon_bus_complete drivers/usb/mon/mon_main.c:134 [inline]
 #5: ffff8880289ba668 (&mbus->lock#2){+.+.}-{3:3}, at: mon_complete+0x5c/0x200 drivers/usb/mon/mon_main.c:147
irq event stamp: 1218766
hardirqs last  enabled at (1218765): [<ffffffff8afa3325>] __raw_spin_unlock_irqrestore include/linux/spinlock_api_smp.h:151 [inline]
hardirqs last  enabled at (1218765): [<ffffffff8afa3325>] _raw_spin_unlock_irqrestore+0x85/0x110 kernel/locking/spinlock.c:194
hardirqs last disabled at (1218766): [<ffffffff8718ba3c>] vhci_urb_enqueue+0xb2c/0xe70 drivers/usb/usbip/vhci_hcd.c:817
softirqs last  enabled at (1211928): [<ffffffff8184cfa4>] __local_bh_enable_ip+0x1a4/0x270 kernel/softirq.c:262
softirqs last disabled at (1211904): [<ffffffff88dfaeaf>] local_bh_disable include/linux/bottom_half.h:20 [inline]
softirqs last disabled at (1211904): [<ffffffff88dfaeaf>] rcu_read_lock_bh include/linux/rcupdate.h:892 [inline]
softirqs last disabled at (1211904): [<ffffffff88dfaeaf>] __dev_queue_xmit+0x26f/0x3b70 net/core/dev.c:4650
CPU: 1 UID: 0 PID: 45 Comm: kworker/1:1 Not tainted syzkaller #0 PREEMPT_{RT,(full)} 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 07/12/2025
Workqueue: usb_hub_wq hub_event
Call Trace:
 <TASK>
 dump_stack_lvl+0x189/0x250 lib/dump_stack.c:120
 __might_resched+0x44b/0x5d0 kernel/sched/core.c:8957
 __rt_spin_lock kernel/locking/spinlock_rt.c:48 [inline]
 rt_spin_lock+0xc7/0x2c0 kernel/locking/spinlock_rt.c:57
 spin_lock include/linux/spinlock_rt.h:44 [inline]
 mon_bus_complete drivers/usb/mon/mon_main.c:134 [inline]
 mon_complete+0x5c/0x200 drivers/usb/mon/mon_main.c:147
 usbmon_urb_complete include/linux/usb/hcd.h:738 [inline]
 __usb_hcd_giveback_urb+0x254/0x5e0 drivers/usb/core/hcd.c:1647
 vhci_urb_enqueue+0xb4f/0xe70 drivers/usb/usbip/vhci_hcd.c:818
 usb_hcd_submit_urb+0x320/0x1a80 drivers/usb/core/hcd.c:1546
 usb_start_wait_urb+0x114/0x4c0 drivers/usb/core/message.c:59
 usb_internal_control_msg drivers/usb/core/message.c:103 [inline]
 usb_control_msg+0x232/0x3e0 drivers/usb/core/message.c:154
 hub_set_address drivers/usb/core/hub.c:4769 [inline]
 hub_port_init+0xe24/0x2800 drivers/usb/core/hub.c:5074
 hub_port_connect drivers/usb/core/hub.c:5495 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5706 [inline]
 port_event drivers/usb/core/hub.c:5870 [inline]
 hub_event+0x2532/0x4a20 drivers/usb/core/hub.c:5952
 process_one_work kernel/workqueue.c:3236 [inline]
 process_scheduled_works+0xade/0x17b0 kernel/workqueue.c:3319
 worker_thread+0x8a0/0xda0 kernel/workqueue.c:3400
 kthread+0x70e/0x8a0 kernel/kthread.c:463
 ret_from_fork+0x3f9/0x770 arch/x86/kernel/process.c:148
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>
usb 38-1: new SuperSpeed USB device number 5 using vhci_hcd
usb 38-1: device descriptor read/8, error -110
usb usb38-port1: unable to enumerate USB device


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

