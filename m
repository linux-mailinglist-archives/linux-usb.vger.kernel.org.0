Return-Path: <linux-usb+bounces-17276-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ECE39BFCBB
	for <lists+linux-usb@lfdr.de>; Thu,  7 Nov 2024 03:47:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E22691F225F1
	for <lists+linux-usb@lfdr.de>; Thu,  7 Nov 2024 02:47:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2478284D0E;
	Thu,  7 Nov 2024 02:47:35 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-io1-f69.google.com (mail-io1-f69.google.com [209.85.166.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3446EBA2D
	for <linux-usb@vger.kernel.org>; Thu,  7 Nov 2024 02:47:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730947654; cv=none; b=ThfvUg6/io2aC4biFv2s8rGBcj2KgSYxPj9lJAKL5PoCgw4nhefhH87enrDgNgNZVtZqnsAtyCjD/SRcxi/HEm6Xgn7bJuYhwaqMs8LY6cLmb7OiC9pZhfuS4ofIbw+j84gpx+SaDpEcwor6l+MZrsGnYnu2fjSFr2gPZRl58ps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730947654; c=relaxed/simple;
	bh=bm90jDI8Ej0DYvaaEtbwzUiDu0QOV5wcZv450KxnmRw=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=GV7lpZrG9VVtCoBKCII+EQe4No7M/E94GKE2rrB7dJtqg6XkJHajpcaoSuFBmMrn7bYM/XZA+IA9Owc3K8Of9PPEikxXtGfhjTqvB5W02GZoN8y2yoA3PrsaazlfSbP7ZETPHsmyzoO6qUmbgQqYoeJsvxugJrmUHQ5GIDdmQaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f69.google.com with SMTP id ca18e2360f4ac-83acaa1f819so61252339f.3
        for <linux-usb@vger.kernel.org>; Wed, 06 Nov 2024 18:47:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730947652; x=1731552452;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LD+Utao4/CGuzFO+zQjWs0boxzV6TvrdAHiSkX8IMQM=;
        b=IfacdoSN7oHOfp6lDqpzBvyxuWnMvgfj0C0po5ovbiqukTbe/Bm/KjqnRwsBO+VX/H
         WSMA3UjAqChq0CzxAhngLdm3Iv04f3YmIzm1G1T09RA6lVgD7pjBUeExz5SuM26ilZPq
         Ywj4aIH1la3oil5MwlWcwCrNK9ogd6JwWBLbSBb1y3RVy+PBBBUGMRfFOYm3P3Ie+wFU
         KVKRWzP/Mp/ESMCp40BIlCPcSv+cCtrJ0QSPS/5QrrIGymMYliXKG5OiabS3G9R7lrDE
         bD5Zg1+dLSncz+JAoem1UklXyjJvz9kmaS+zP6X66nWXxTlvx7B8zO+/g+eNoeIEwJzC
         32uA==
X-Forwarded-Encrypted: i=1; AJvYcCXAiUAPaPlv9R2niaY0iLC6f+1MBEm0ait8uOOn0xlifTpLYIYSZnOUswHDc9i3eIjwFa36EAU7dvU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzcCyjBqVKZ+YF54GAjMbbLtwtrNY+4VV+C+tskkqLbyWyaRhbj
	c4aXVCQWiD9hU8cXQXtvxV1XlD0Xzv+i+LW50TBy05wlx3Bt5PUuC2gmmgE9b9BdlT+R0nsdhA5
	7ErQAbcvsb9mvtAZP13B9qQTwkLRAbUsx98UAgHZ/xVc4kB1MY5Uex4U=
X-Google-Smtp-Source: AGHT+IEYIX1kLJ9D0g+wSHWcXimE/udYx4Qw5b7gi/Ng8dTdM07EtGPI9m8+XxvR7ApAgMCCnopQwTo5YAZdoBIKcd9XBbAyakRJ
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1746:b0:3a6:c716:ab1f with SMTP id
 e9e14a558f8ab-3a6c716ae23mr167873565ab.9.1730947652453; Wed, 06 Nov 2024
 18:47:32 -0800 (PST)
Date: Wed, 06 Nov 2024 18:47:32 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <672c2a44.050a0220.350062.0283.GAE@google.com>
Subject: [syzbot] [block?] [usb?] WARNING: bad unlock balance in elevator_init_mq
From: syzbot <syzbot+a95fab8e491d4ac8cbe9@syzkaller.appspotmail.com>
To: axboe@kernel.dk, linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    c88416ba074a Add linux-next specific files for 20241101
git tree:       linux-next
console output: https://syzkaller.appspot.com/x/log.txt?x=16e21aa7980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=704b6be2ac2f205f
dashboard link: https://syzkaller.appspot.com/bug?extid=a95fab8e491d4ac8cbe9
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1722ab40580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/760a8c88d0c3/disk-c88416ba.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/46e4b0a851a2/vmlinux-c88416ba.xz
kernel image: https://storage.googleapis.com/syzbot-assets/428e2c784b75/bzImage-c88416ba.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+a95fab8e491d4ac8cbe9@syzkaller.appspotmail.com

sd 4:0:0:1: [sdb] 0-byte physical blocks
sd 4:0:0:1: [sdb] Test WP failed, assume Write Enabled
sd 4:0:0:1: [sdb] Asking for cache data failed
sd 4:0:0:1: [sdb] Assuming drive cache: write through
=====================================
WARNING: bad unlock balance detected!
6.12.0-rc5-next-20241101-syzkaller #0 Not tainted
-------------------------------------
kworker/u8:4/67 is trying to release lock (&q->q_usage_counter(queue)) at:
[<ffffffff849207a2>] elevator_init_mq+0x1e2/0x2d0 block/elevator.c:607
but there are no more locks to release!

other info that might help us debug this:
3 locks held by kworker/u8:4/67:
 #0: ffff88801d681148 ((wq_completion)async){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3204 [inline]
 #0: ffff88801d681148 ((wq_completion)async){+.+.}-{0:0}, at: process_scheduled_works+0x93b/0x1850 kernel/workqueue.c:3310
 #1: ffffc900020bfd00 ((work_completion)(&entry->work)){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3205 [inline]
 #1: ffffc900020bfd00 ((work_completion)(&entry->work)){+.+.}-{0:0}, at: process_scheduled_works+0x976/0x1850 kernel/workqueue.c:3310
 #2: ffff8880327ca378 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:1014 [inline]
 #2: ffff8880327ca378 (&dev->mutex){....}-{4:4}, at: __device_attach_async_helper+0xfc/0x300 drivers/base/dd.c:973

stack backtrace:
CPU: 1 UID: 0 PID: 67 Comm: kworker/u8:4 Not tainted 6.12.0-rc5-next-20241101-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 09/13/2024
Workqueue: async async_run_entry_fn
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x241/0x360 lib/dump_stack.c:120
 print_unlock_imbalance_bug+0x25b/0x2d0 kernel/locking/lockdep.c:5287
 __lock_release kernel/locking/lockdep.c:5526 [inline]
 lock_release+0x5cb/0xa30 kernel/locking/lockdep.c:5870
 blk_unfreeze_release_lock block/blk.h:745 [inline]
 blk_mq_unfreeze_queue+0xd2/0x140 block/blk-mq.c:213
 elevator_init_mq+0x1e2/0x2d0 block/elevator.c:607
 add_disk_fwnode+0x10d/0xf80 block/genhd.c:413
 sd_probe+0xba6/0x1100 drivers/scsi/sd.c:4024
 really_probe+0x2b8/0xad0 drivers/base/dd.c:658
 __driver_probe_device+0x1a2/0x390 drivers/base/dd.c:800
 driver_probe_device+0x50/0x430 drivers/base/dd.c:830
 __device_attach_driver+0x2d6/0x530 drivers/base/dd.c:958
 bus_for_each_drv+0x24e/0x2e0 drivers/base/bus.c:459
 __device_attach_async_helper+0x22d/0x300 drivers/base/dd.c:987
 async_run_entry_fn+0xa8/0x420 kernel/async.c:129
 process_one_work kernel/workqueue.c:3229 [inline]
 process_scheduled_works+0xa63/0x1850 kernel/workqueue.c:3310
 worker_thread+0x870/0xd30 kernel/workqueue.c:3391
 kthread+0x2f0/0x390 kernel/kthread.c:389
 ret_from_fork+0x4b/0x80 arch/x86/kernel/process.c:147
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:244
 </TASK>
sd 4:0:0:1: [sdb] Attached SCSI removable disk
sd 5:0:0:0: [sdc] Media removed, stopped polling
sd 5:0:0:0: [sdc] Attached SCSI removable disk
sd 2:0:0:0: [sdb] Media removed, stopped polling
sd 2:0:0:0: [sdb] Attached SCSI removable disk
sd 1:0:0:0: [sdb] Media removed, stopped polling
sd 1:0:0:0: [sdb] Attached SCSI removable disk
sd 4:0:0:0: [sdb] Media removed, stopped polling
sd 4:0:0:0: [sdb] Attached SCSI removable disk
sd 1:0:0:1: [sdf] Media removed, stopped polling
sd 1:0:0:1: [sdf] Attached SCSI removable disk


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

