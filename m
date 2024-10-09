Return-Path: <linux-usb+bounces-15891-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 64385995DFD
	for <lists+linux-usb@lfdr.de>; Wed,  9 Oct 2024 05:11:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B5558B22204
	for <lists+linux-usb@lfdr.de>; Wed,  9 Oct 2024 03:11:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D16C213D8A4;
	Wed,  9 Oct 2024 03:11:22 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com [209.85.166.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D78A426AEC
	for <linux-usb@vger.kernel.org>; Wed,  9 Oct 2024 03:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728443482; cv=none; b=SEq15k4xOUSlLGFyZ8U2pl32etwD5PUIMN5FaEHZ4eqQ8VRuAKLhm7kQ0zo8izda99HIVTB2xKjwoRFq1Z5/98S9ToYmVXXvNjQzKMQn89H9xlVLP4kwz2e95n5YO/aYmu+to4eC6PShQHzj+xicfDz/DAvQWML5UeEPwnBjK0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728443482; c=relaxed/simple;
	bh=X/ZHmpcgyS+Ui+PKS/ET0SeRRdgih797d5iz/3++UyM=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=sLTnpSgLdyuVv8UM07t07ojpkyLPyfmrjs4JVP4YBuuInihdQCu4Mm/7pC91CcaVGu9UAm9WEglxb+wxK7TrZl7/57a+ik48hpeDwcqtTBDW+KrI9sJGLLLphWeRyK2fmMAs8hA3745AqpN9jL+LseXcfOObB3UwukVvl8J6qfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f198.google.com with SMTP id e9e14a558f8ab-3a344da7987so84083625ab.1
        for <linux-usb@vger.kernel.org>; Tue, 08 Oct 2024 20:11:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728443480; x=1729048280;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=j8svYsS41wdNxKO+uXDkJQTIPzVTKmfccT8anlponCY=;
        b=NqIbqOZG3tFeRgwPzh/MTd/6oGSA5yrG4gZdXx070Nkzm681QiDEsvMctVaiqnGrFG
         41hze0G29J9nkBUM8++X5ADX1LGWEAShYk88dKU23ligPwI3WNEV0NKopHDuq8NP0gHo
         qgpOeN00qjgDGS5fGWXvmjyoJKNRZDFlGdIzXB7i20g8coyYQBdNqT1A2lOgHSZwb0gQ
         UuIvH73T4+pt43hRegTQdHynl7/F1Hja4w/qT+CWJjXtxgfQfrTO1SPhPlfRKHPh8eSj
         FmUXG9ir448N4arfOyLlrvHYkzFo6ZKtscn3rlKAoV66H9RpCp0IfMO/LfxmAZn2I+f5
         kuWA==
X-Forwarded-Encrypted: i=1; AJvYcCVWS7TlQu3culIFjlWuSAILZucF8frs9PqlW8I6Jx3RYRS8JUkOgPTDDVuJcaEr6pUzKiJ9yVqhaYc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9qzqVEpbpdacEWP+almLJ0/M0/iaUBp12NJ3u5HNrmLT/EVMG
	xiPoDn90WHug8Fq1k+qu5p1L3QTgkuaBDurWhT+09WdDaj51c+0p85t6NZ7Ukdm/3QpRfgD8De8
	VFIqzpeHB+1CfkNoo/jzKjYTchH3GE9bEr6yBWNIxUHk8/jc5/37AF5k=
X-Google-Smtp-Source: AGHT+IEqI99PaKQwGrV1aaFR36mKguy8Z+1d8WdOsSGJKm1EH2nkrGEFNIxyJn6NxWFgnX5tnIYgfk068/6luUfY098M3sWIVIiT
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:b2a:b0:3a0:9fa5:8f2 with SMTP id
 e9e14a558f8ab-3a397d19e3dmr11731325ab.18.1728443480021; Tue, 08 Oct 2024
 20:11:20 -0700 (PDT)
Date: Tue, 08 Oct 2024 20:11:19 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6705f457.050a0220.3f80e.0021.GAE@google.com>
Subject: [syzbot] [usb?] possible deadlock in usb_deregister_dev (3)
From: syzbot <syzbot+1f8ca5ee82576ec01f12@syzkaller.appspotmail.com>
To: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    4a9fe2a8ac53 dt-bindings: usb: dwc3-imx8mp: add compatible..
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
console output: https://syzkaller.appspot.com/x/log.txt?x=1675cd27980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=4510af5d637450fb
dashboard link: https://syzkaller.appspot.com/bug?extid=1f8ca5ee82576ec01f12
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=16107bd0580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=14983307980000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/883c5319cb52/disk-4a9fe2a8.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/caf4421ed2ef/vmlinux-4a9fe2a8.xz
kernel image: https://storage.googleapis.com/syzbot-assets/d8e3beb01d49/bzImage-4a9fe2a8.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+1f8ca5ee82576ec01f12@syzkaller.appspotmail.com

chaoskey 2-1:0.0: Unable to register with hwrng
usb 1-1: USB disconnect, device number 2
======================================================
WARNING: possible circular locking dependency detected
6.12.0-rc1-syzkaller-00027-g4a9fe2a8ac53 #0 Not tainted
------------------------------------------------------
kworker/0:2/804 is trying to acquire lock:
ffffffff899dadb0 (minor_rwsem){++++}-{3:3}, at: usb_deregister_dev+0x7c/0x1e0 drivers/usb/core/file.c:186

but task is already holding lock:
ffffffff89b120e8 (chaoskey_list_lock){+.+.}-{3:3}, at: chaoskey_disconnect+0xa8/0x2a0 drivers/usb/misc/chaoskey.c:235

which lock already depends on the new lock.


the existing dependency chain (in reverse order) is:

-> #1 (chaoskey_list_lock){+.+.}-{3:3}:
       __mutex_lock_common kernel/locking/mutex.c:608 [inline]
       __mutex_lock+0x175/0x9c0 kernel/locking/mutex.c:752
       chaoskey_open+0xdd/0x220 drivers/usb/misc/chaoskey.c:274
       usb_open+0x186/0x220 drivers/usb/core/file.c:47
       chrdev_open+0x237/0x6a0 fs/char_dev.c:414
       do_dentry_open+0x6cb/0x1390 fs/open.c:958
       vfs_open+0x82/0x3f0 fs/open.c:1088
       do_open fs/namei.c:3774 [inline]
       path_openat+0x1e6a/0x2d60 fs/namei.c:3933
       do_filp_open+0x1dc/0x430 fs/namei.c:3960
       do_sys_openat2+0x17a/0x1e0 fs/open.c:1415
       do_sys_open fs/open.c:1430 [inline]
       __do_sys_openat fs/open.c:1446 [inline]
       __se_sys_openat fs/open.c:1441 [inline]
       __x64_sys_openat+0x175/0x210 fs/open.c:1441
       do_syscall_x64 arch/x86/entry/common.c:52 [inline]
       do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
       entry_SYSCALL_64_after_hwframe+0x77/0x7f

-> #0 (minor_rwsem){++++}-{3:3}:
       check_prev_add kernel/locking/lockdep.c:3161 [inline]
       check_prevs_add kernel/locking/lockdep.c:3280 [inline]
       validate_chain kernel/locking/lockdep.c:3904 [inline]
       __lock_acquire+0x250b/0x3ce0 kernel/locking/lockdep.c:5202
       lock_acquire.part.0+0x11b/0x380 kernel/locking/lockdep.c:5825
       down_write+0x93/0x200 kernel/locking/rwsem.c:1577
       usb_deregister_dev+0x7c/0x1e0 drivers/usb/core/file.c:186
       chaoskey_disconnect+0xb7/0x2a0 drivers/usb/misc/chaoskey.c:236
       usb_unbind_interface+0x1e8/0x970 drivers/usb/core/driver.c:461
       device_remove drivers/base/dd.c:569 [inline]
       device_remove+0x122/0x170 drivers/base/dd.c:561
       __device_release_driver drivers/base/dd.c:1273 [inline]
       device_release_driver_internal+0x44a/0x610 drivers/base/dd.c:1296
       bus_remove_device+0x22f/0x420 drivers/base/bus.c:576
       device_del+0x396/0x9f0 drivers/base/core.c:3864
       usb_disable_device+0x36c/0x7f0 drivers/usb/core/message.c:1418
       usb_disconnect+0x2e1/0x920 drivers/usb/core/hub.c:2304
       hub_port_connect drivers/usb/core/hub.c:5361 [inline]
       hub_port_connect_change drivers/usb/core/hub.c:5661 [inline]
       port_event drivers/usb/core/hub.c:5821 [inline]
       hub_event+0x1bed/0x4f40 drivers/usb/core/hub.c:5903
       process_one_work+0x9c5/0x1ba0 kernel/workqueue.c:3229
       process_scheduled_works kernel/workqueue.c:3310 [inline]
       worker_thread+0x6c8/0xf00 kernel/workqueue.c:3391
       kthread+0x2c1/0x3a0 kernel/kthread.c:389
       ret_from_fork+0x45/0x80 arch/x86/kernel/process.c:147
       ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:244

other info that might help us debug this:

 Possible unsafe locking scenario:

       CPU0                    CPU1
       ----                    ----
  lock(chaoskey_list_lock);
                               lock(minor_rwsem);
                               lock(chaoskey_list_lock);
  lock(minor_rwsem);

 *** DEADLOCK ***

6 locks held by kworker/0:2/804:
 #0: ffff888106684148 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: process_one_work+0x129b/0x1ba0 kernel/workqueue.c:3204
 #1: ffffc90001c2fd80 ((work_completion)(&hub->events)){+.+.}-{0:0}, at: process_one_work+0x921/0x1ba0 kernel/workqueue.c:3205
 #2: ffff888109b0b190 (&dev->mutex){....}-{3:3}, at: device_lock include/linux/device.h:1014 [inline]
 #2: ffff888109b0b190 (&dev->mutex){....}-{3:3}, at: hub_event+0x1be/0x4f40 drivers/usb/core/hub.c:5849
 #3: ffff8881027fd190 (&dev->mutex){....}-{3:3}, at: device_lock include/linux/device.h:1014 [inline]
 #3: ffff8881027fd190 (&dev->mutex){....}-{3:3}, at: usb_disconnect+0x10a/0x920 drivers/usb/core/hub.c:2295
 #4: ffff888107af6160 (&dev->mutex){....}-{3:3}, at: device_lock include/linux/device.h:1014 [inline]
 #4: ffff888107af6160 (&dev->mutex){....}-{3:3}, at: __device_driver_lock drivers/base/dd.c:1095 [inline]
 #4: ffff888107af6160 (&dev->mutex){....}-{3:3}, at: device_release_driver_internal+0xa4/0x610 drivers/base/dd.c:1293
 #5: ffffffff89b120e8 (chaoskey_list_lock){+.+.}-{3:3}, at: chaoskey_disconnect+0xa8/0x2a0 drivers/usb/misc/chaoskey.c:235

stack backtrace:
CPU: 0 UID: 0 PID: 804 Comm: kworker/0:2 Not tainted 6.12.0-rc1-syzkaller-00027-g4a9fe2a8ac53 #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 09/13/2024
Workqueue: usb_hub_wq hub_event
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x116/0x1f0 lib/dump_stack.c:120
 print_circular_bug+0x41c/0x610 kernel/locking/lockdep.c:2074
 check_noncircular+0x31a/0x400 kernel/locking/lockdep.c:2206
 check_prev_add kernel/locking/lockdep.c:3161 [inline]
 check_prevs_add kernel/locking/lockdep.c:3280 [inline]
 validate_chain kernel/locking/lockdep.c:3904 [inline]
 __lock_acquire+0x250b/0x3ce0 kernel/locking/lockdep.c:5202
 lock_acquire.part.0+0x11b/0x380 kernel/locking/lockdep.c:5825
 down_write+0x93/0x200 kernel/locking/rwsem.c:1577
 usb_deregister_dev+0x7c/0x1e0 drivers/usb/core/file.c:186
 chaoskey_disconnect+0xb7/0x2a0 drivers/usb/misc/chaoskey.c:236
 usb_unbind_interface+0x1e8/0x970 drivers/usb/core/driver.c:461
 device_remove drivers/base/dd.c:569 [inline]
 device_remove+0x122/0x170 drivers/base/dd.c:561
 __device_release_driver drivers/base/dd.c:1273 [inline]
 device_release_driver_internal+0x44a/0x610 drivers/base/dd.c:1296
 bus_remove_device+0x22f/0x420 drivers/base/bus.c:576
 device_del+0x396/0x9f0 drivers/base/core.c:3864
 usb_disable_device+0x36c/0x7f0 drivers/usb/core/message.c:1418
 usb_disconnect+0x2e1/0x920 drivers/usb/core/hub.c:2304
 hub_port_connect drivers/usb/core/hub.c:5361 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5661 [inline]
 port_event drivers/usb/core/hub.c:5821 [inline]
 hub_event+0x1bed/0x4f40 drivers/usb/core/hub.c:5903
 process_one_work+0x9c5/0x1ba0 kernel/workqueue.c:3229
 process_scheduled_works kernel/workqueue.c:3310 [inline]
 worker_thread+0x6c8/0xf00 kernel/workqueue.c:3391
 kthread+0x2c1/0x3a0 kernel/kthread.c:389
 ret_from_fork+0x45/0x80 arch/x86/kernel/process.c:147
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:244
 </TASK>
usb 1-1: new high-speed USB device number 3 using dummy_hcd
usb 1-1: Using ep0 maxpacket: 32
usb 1-1: config 0 interface 0 altsetting 0 bulk endpoint 0x85 has invalid maxpacket 1024
usb 1-1: New USB device found, idVendor=12d8, idProduct=0001, bcdDevice=de.79
usb 1-1: New USB device strings: Mfr=1, Product=236, SerialNumber=2
usb 1-1: Product: syz
usb 1-1: Manufacturer: syz
usb 1-1: SerialNumber: syz
usb 1-1: config 0 descriptor??
chaoskey 1-1:0.0: Unable to register with hwrng


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

