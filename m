Return-Path: <linux-usb+bounces-13575-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 594EB955C0C
	for <lists+linux-usb@lfdr.de>; Sun, 18 Aug 2024 11:24:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D33921F214D7
	for <lists+linux-usb@lfdr.de>; Sun, 18 Aug 2024 09:24:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C1ED17BA3;
	Sun, 18 Aug 2024 09:24:30 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com [209.85.166.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2F9B17BBE
	for <linux-usb@vger.kernel.org>; Sun, 18 Aug 2024 09:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723973070; cv=none; b=e0OfOAQW9GFFpOkHcDMNasey2sw+lnD5ie8HTB2iDy3crZCqXRxJXYkoK5vgHHGnrENsllEtIx1TmpkDqYresY6BdqoZ3VLRd5PvJ4n1Vykbjx0KhUEh7en7pjtI3Rqby37Ey4rr0mks0rcg3h8E8HfF5Lgmi1okAEZOL0EUH6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723973070; c=relaxed/simple;
	bh=eBb0Jf+qZ1njuXuk4+uWhszzv4Cwh2U0Tj2z87eo69I=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=nHRqhIKvDwCpZoYUeLXKvuFPqscQHZinbu62rmMRZprPmD7RYpzggsteDTu77WAjTXfgBvhBsnVxZFAsv56DTf9Bc+MWKNv/UsYDLQRzdyRVHIRnw2SOs1HXZbyf8mE0a4h10t2ehMl8Hq/A/CxEj7kvPLfDmu6zzgBAf44KhC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f197.google.com with SMTP id e9e14a558f8ab-39d465cd64bso6691375ab.0
        for <linux-usb@vger.kernel.org>; Sun, 18 Aug 2024 02:24:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723973068; x=1724577868;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jXn6X6OIlj+84K6mXihqwzjOjoaeDpvmPXJT9VyhkvM=;
        b=sVr/4PPrR3pPDzLmYjfxXyjAvbGib35nNwKGeKlRFU0vjeNOmKeDg90lcBTSVkplhI
         z/X8b67+DjHBKdaVHQRhHZPztXQPi1pJGA4Qz35dW9Q95BUezfenlBwvx+wTqHX5QKCG
         nk7ypXjjgB0skaFAqN68EpWcwRn2n7G48drbPindFOfDygBE2qOhkSUhZY+EI7vZMQO8
         YslaubtBkPwgGdIqdrqfB6A/LPx+q1xCPqCQs0gXWXqsxocunG2MtPh4iJcNF0J7zn3Q
         jO+JZZFWUErGvtHl9GzzvUpg5S7v7rkhAqEbeL9uU+9ntP6Z1xW/3vXQuvVazaYaDtuj
         BBkQ==
X-Forwarded-Encrypted: i=1; AJvYcCUj9nQs8bqIzkVHdcMhtKvIx9zN6w0BGLmq8BpHDgMb9/iiN7k8xrf2tUzar7eeQCNLl7ifboXTqNZUtHKaeC3uvK3IHS2bU92X
X-Gm-Message-State: AOJu0Yxk72RvFmNgMeg5t9R9JDaDsttbiucrNhfVPbUO/dZk6wRCnsMI
	2VvNJRz0376wFCLmZ2xMv8UHDZIR+Wu9a3xWz/0kY2tIhyH2zV0xRcwSdb8I8eGgnC9cS70CFGr
	UDYNSyEbqZpzGBOmTkCz8zGVlxyGDTRaAB5mmJQsgMmWmoY162w0XSDI=
X-Google-Smtp-Source: AGHT+IGn74sJpu8+9FB7W2aSF6T62VVMQai4fvMJqyqw10GrAMogVGkefixaOqreyFqgjvet/xmN1BEzAumwZpPnIOGld4fCyCnl
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1989:b0:39b:2133:8ee5 with SMTP id
 e9e14a558f8ab-39d26ce2d21mr7510835ab.1.1723973067901; Sun, 18 Aug 2024
 02:24:27 -0700 (PDT)
Date: Sun, 18 Aug 2024 02:24:27 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000509ee8061ff1c2cc@google.com>
Subject: [syzbot] [input?] [usb?] possible deadlock in hid_hw_open
From: syzbot <syzbot+2313ca2498b9554beeba@syzkaller.appspotmail.com>
To: bentiss@kernel.org, jikos@kernel.org, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    82313624b2ae usb: gadget: f_uac1: Change volume name and r..
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
console output: https://syzkaller.appspot.com/x/log.txt?x=13983409980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=ab70c480460dbde
dashboard link: https://syzkaller.appspot.com/bug?extid=2313ca2498b9554beeba
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/cb6687ee6ff4/disk-82313624.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/8453a8c86e39/vmlinux-82313624.xz
kernel image: https://storage.googleapis.com/syzbot-assets/e57cfd8ca75c/bzImage-82313624.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+2313ca2498b9554beeba@syzkaller.appspotmail.com

======================================================
WARNING: possible circular locking dependency detected
6.11.0-rc3-syzkaller-00046-g82313624b2ae #0 Not tainted
------------------------------------------------------
acpid/2530 is trying to acquire lock:
ffff88811905de20 (&hdev->ll_open_lock){+.+.}-{3:3}, at: hid_hw_open+0x25/0x170 drivers/hid/hid-core.c:2361

but task is already holding lock:
ffff88810bb362c0
 (&dev->mutex#2){+.+.}-{3:3}, at: input_open_device+0x4f/0x320 drivers/input/input.c:597

which lock already depends on the new lock.


the existing dependency chain (in reverse order) is:

-> #1 (&dev->mutex#2){+.+.}-{3:3}:
       __mutex_lock_common kernel/locking/mutex.c:608 [inline]
       __mutex_lock+0x175/0x9c0 kernel/locking/mutex.c:752
       input_disconnect_device drivers/input/input.c:724 [inline]
       __input_unregister_device+0x24/0x450 drivers/input/input.c:2273
       input_unregister_device+0xb9/0x100 drivers/input/input.c:2514
       steam_input_unregister+0x10c/0x2c0 drivers/hid/hid-steam.c:917
       steam_client_ll_open+0xc9/0x100 drivers/hid/hid-steam.c:1121
       hid_hw_open+0xe2/0x170 drivers/hid/hid-core.c:2366
       hidraw_open+0x274/0x7e0 drivers/hid/hidraw.c:296
       chrdev_open+0x26d/0x6f0 fs/char_dev.c:414
       do_dentry_open+0x957/0x1490 fs/open.c:959
       vfs_open+0x82/0x3f0 fs/open.c:1089
       do_open fs/namei.c:3727 [inline]
       path_openat+0x2141/0x2d20 fs/namei.c:3886
       do_filp_open+0x1dc/0x430 fs/namei.c:3913
       do_sys_openat2+0x17a/0x1e0 fs/open.c:1416
       do_sys_open fs/open.c:1431 [inline]
       __do_sys_openat fs/open.c:1447 [inline]
       __se_sys_openat fs/open.c:1442 [inline]
       __x64_sys_openat+0x175/0x210 fs/open.c:1442
       do_syscall_x64 arch/x86/entry/common.c:52 [inline]
       do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
       entry_SYSCALL_64_after_hwframe+0x77/0x7f

-> #0 (&hdev->ll_open_lock){+.+.}-{3:3}:
       check_prev_add kernel/locking/lockdep.c:3133 [inline]
       check_prevs_add kernel/locking/lockdep.c:3252 [inline]
       validate_chain kernel/locking/lockdep.c:3868 [inline]
       __lock_acquire+0x24ed/0x3cb0 kernel/locking/lockdep.c:5142
       lock_acquire kernel/locking/lockdep.c:5759 [inline]
       lock_acquire+0x1b1/0x560 kernel/locking/lockdep.c:5724
       __mutex_lock_common kernel/locking/mutex.c:608 [inline]
       __mutex_lock+0x175/0x9c0 kernel/locking/mutex.c:752
       hid_hw_open+0x25/0x170 drivers/hid/hid-core.c:2361
       input_open_device+0x1c9/0x320 drivers/input/input.c:617
       evdev_open_device drivers/input/evdev.c:391 [inline]
       evdev_open+0x533/0x6a0 drivers/input/evdev.c:478
       chrdev_open+0x26d/0x6f0 fs/char_dev.c:414
       do_dentry_open+0x957/0x1490 fs/open.c:959
       vfs_open+0x82/0x3f0 fs/open.c:1089
       do_open fs/namei.c:3727 [inline]
       path_openat+0x2141/0x2d20 fs/namei.c:3886
       do_filp_open+0x1dc/0x430 fs/namei.c:3913
       do_sys_openat2+0x17a/0x1e0 fs/open.c:1416
       do_sys_open fs/open.c:1431 [inline]
       __do_sys_openat fs/open.c:1447 [inline]
       __se_sys_openat fs/open.c:1442 [inline]
       __x64_sys_openat+0x175/0x210 fs/open.c:1442
       do_syscall_x64 arch/x86/entry/common.c:52 [inline]
       do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
       entry_SYSCALL_64_after_hwframe+0x77/0x7f

other info that might help us debug this:

 Possible unsafe locking scenario:

       CPU0                    CPU1
       ----                    ----
  lock(&dev->mutex#2);
                               lock(&hdev->ll_open_lock);
                               lock(&dev->mutex#2);
  lock(&hdev->ll_open_lock);

 *** DEADLOCK ***

2 locks held by acpid/2530:
 #0: ffff88810db56110 (&evdev->mutex){+.+.}-{3:3}, at: evdev_open_device drivers/input/evdev.c:384 [inline]
 #0: ffff88810db56110 (&evdev->mutex){+.+.}-{3:3}, at: evdev_open+0x2ee/0x6a0 drivers/input/evdev.c:478
 #1: ffff88810bb362c0 (&dev->mutex#2){+.+.}-{3:3}, at: input_open_device+0x4f/0x320 drivers/input/input.c:597

stack backtrace:
CPU: 0 UID: 0 PID: 2530 Comm: acpid Not tainted 6.11.0-rc3-syzkaller-00046-g82313624b2ae #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 06/27/2024
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:93 [inline]
 dump_stack_lvl+0x116/0x1f0 lib/dump_stack.c:119
 check_noncircular+0x31a/0x400 kernel/locking/lockdep.c:2186
 check_prev_add kernel/locking/lockdep.c:3133 [inline]
 check_prevs_add kernel/locking/lockdep.c:3252 [inline]
 validate_chain kernel/locking/lockdep.c:3868 [inline]
 __lock_acquire+0x24ed/0x3cb0 kernel/locking/lockdep.c:5142
 lock_acquire kernel/locking/lockdep.c:5759 [inline]
 lock_acquire+0x1b1/0x560 kernel/locking/lockdep.c:5724
 __mutex_lock_common kernel/locking/mutex.c:608 [inline]
 __mutex_lock+0x175/0x9c0 kernel/locking/mutex.c:752
 hid_hw_open+0x25/0x170 drivers/hid/hid-core.c:2361
 input_open_device+0x1c9/0x320 drivers/input/input.c:617
 evdev_open_device drivers/input/evdev.c:391 [inline]
 evdev_open+0x533/0x6a0 drivers/input/evdev.c:478
 chrdev_open+0x26d/0x6f0 fs/char_dev.c:414
 do_dentry_open+0x957/0x1490 fs/open.c:959
 vfs_open+0x82/0x3f0 fs/open.c:1089
 do_open fs/namei.c:3727 [inline]
 path_openat+0x2141/0x2d20 fs/namei.c:3886
 do_filp_open+0x1dc/0x430 fs/namei.c:3913
 do_sys_openat2+0x17a/0x1e0 fs/open.c:1416
 do_sys_open fs/open.c:1431 [inline]
 __do_sys_openat fs/open.c:1447 [inline]
 __se_sys_openat fs/open.c:1442 [inline]
 __x64_sys_openat+0x175/0x210 fs/open.c:1442
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f2b9d4f09a4
Code: 24 20 48 8d 44 24 30 48 89 44 24 28 64 8b 04 25 18 00 00 00 85 c0 75 2c 44 89 e2 48 89 ee bf 9c ff ff ff b8 01 01 00 00 0f 05 <48> 3d 00 f0 ff ff 76 60 48 8b 15 55 a4 0d 00 f7 d8 64 89 02 48 83
RSP: 002b:00007ffc30a90ad0 EFLAGS: 00000246 ORIG_RAX: 0000000000000101
RAX: ffffffffffffffda RBX: 00007ffc30a90db8 RCX: 00007f2b9d4f09a4
RDX: 0000000000080800 RSI: 00007ffc30a90cb8 RDI: 00000000ffffff9c
RBP: 00007ffc30a90cb8 R08: 00000000000000f4 R09: 00007ffc30a90cb8
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000080800
R13: 0000000000000020 R14: 00007ffc30a90db8 R15: 00007ffc30a90cb8
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

