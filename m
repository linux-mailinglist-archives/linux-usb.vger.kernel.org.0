Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9A272B3B56
	for <lists+linux-usb@lfdr.de>; Mon, 16 Sep 2019 15:30:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733204AbfIPN3K (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 16 Sep 2019 09:29:10 -0400
Received: from mail-io1-f71.google.com ([209.85.166.71]:36700 "EHLO
        mail-io1-f71.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727742AbfIPN3J (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 16 Sep 2019 09:29:09 -0400
Received: by mail-io1-f71.google.com with SMTP id g126so50761316iof.3
        for <linux-usb@vger.kernel.org>; Mon, 16 Sep 2019 06:29:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=iuyvgKlp0/jGRdzIYiqZttUg8snGBj6NuoX6jdbgouQ=;
        b=pJW5KaLv7/cGXdBYZMCI2IXetwQjT6HgD/QHau7YnZ9TVS629yqACOk+J+r/GI/acK
         HhDehddgOus8YREQ5dKrcrOqhvNYZWzr4ivK2eLwRaCT+HXSYMUXEEVUQsjDwHUKtHBB
         XlaiJMRFv94SrQ7UB66fgrvgNvIFtZvHpqbrsfc2EmSeeY4ORcOA2o8wqTkFa7fJFDq7
         z6a5SMdWMkPUJCZLnedK2MZGeWbZejjgTtgSf+1pfV6tBACyAZNdYR+NYMd+luXVDO5K
         W4+M3aJPpBMC8IKCi6tIpqypysM2otWnAiEZgkTcyHhUrxo2i2xfWQG6OY/q/SkdTo4F
         d+nA==
X-Gm-Message-State: APjAAAU/4FDv62XfTpDrKJH8AS9s1exHLtMmbImMVBJtTCG+jI6GNnTt
        tqKOTnUwtBBr3nkEM9Z10MY06y0H64R+CXm6Nxo40tTvfUV1
X-Google-Smtp-Source: APXvYqwHHX1YGKx5EQblVusctD9IXbBbOXdJ0uPeJ82h9wU4Gzg40S35DtcOT8a71RopPPZnI9A38ekbCv4NXVfSYIZ8SudS/kNE
MIME-Version: 1.0
X-Received: by 2002:a5e:9616:: with SMTP id a22mr162935ioq.46.1568640548857;
 Mon, 16 Sep 2019 06:29:08 -0700 (PDT)
Date:   Mon, 16 Sep 2019 06:29:08 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000b1f1050592ab96ee@google.com>
Subject: possible deadlock in open_rio (2)
From:   syzbot <syzbot+19cf612d23f66bc19f22@syzkaller.appspotmail.com>
To:     andreyknvl@google.com, gregkh@linuxfoundation.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        miquel@df.uba.ar, rio500-users@lists.sourceforge.net,
        syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,

syzbot found the following crash on:

HEAD commit:    f0df5c1b usb-fuzzer: main usb gadget fuzzer driver
git tree:       https://github.com/google/kasan.git usb-fuzzer
console output: https://syzkaller.appspot.com/x/log.txt?x=11512cd1600000
kernel config:  https://syzkaller.appspot.com/x/.config?x=5c6633fa4ed00be5
dashboard link: https://syzkaller.appspot.com/bug?extid=19cf612d23f66bc19f22
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=16f92c6e600000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=10b9b85e600000

IMPORTANT: if you fix the bug, please add the following tag to the commit:
Reported-by: syzbot+19cf612d23f66bc19f22@syzkaller.appspotmail.com

======================================================
WARNING: possible circular locking dependency detected
5.3.0-rc7+ #0 Not tainted
------------------------------------------------------
syz-executor071/1724 is trying to acquire lock:
00000000f749c934 (rio500_mutex){+.+.}, at: open_rio+0x16/0xe0  
drivers/usb/misc/rio500.c:65

but task is already holding lock:
000000009c24ba51 (minor_rwsem){++++}, at: usb_open+0x23/0x270  
drivers/usb/core/file.c:39

which lock already depends on the new lock.


the existing dependency chain (in reverse order) is:

-> #1 (minor_rwsem){++++}:
        down_write+0x92/0x150 kernel/locking/rwsem.c:1500
        usb_register_dev drivers/usb/core/file.c:187 [inline]
        usb_register_dev+0x131/0x670 drivers/usb/core/file.c:156
        probe_rio.cold+0x53/0x237 drivers/usb/misc/rio500.c:474
        usb_probe_interface+0x305/0x7a0 drivers/usb/core/driver.c:361
        really_probe+0x281/0x6d0 drivers/base/dd.c:548
        driver_probe_device+0x101/0x1b0 drivers/base/dd.c:721
        __device_attach_driver+0x1c2/0x220 drivers/base/dd.c:828
        bus_for_each_drv+0x162/0x1e0 drivers/base/bus.c:454
        __device_attach+0x217/0x360 drivers/base/dd.c:894
        bus_probe_device+0x1e4/0x290 drivers/base/bus.c:514
        device_add+0xae6/0x16f0 drivers/base/core.c:2165
        usb_set_configuration+0xdf6/0x1670 drivers/usb/core/message.c:2023
        generic_probe+0x9d/0xd5 drivers/usb/core/generic.c:210
        usb_probe_device+0x99/0x100 drivers/usb/core/driver.c:266
        really_probe+0x281/0x6d0 drivers/base/dd.c:548
        driver_probe_device+0x101/0x1b0 drivers/base/dd.c:721
        __device_attach_driver+0x1c2/0x220 drivers/base/dd.c:828
        bus_for_each_drv+0x162/0x1e0 drivers/base/bus.c:454
        __device_attach+0x217/0x360 drivers/base/dd.c:894
        bus_probe_device+0x1e4/0x290 drivers/base/bus.c:514
        device_add+0xae6/0x16f0 drivers/base/core.c:2165
        usb_new_device.cold+0x6a4/0xe79 drivers/usb/core/hub.c:2536
        hub_port_connect drivers/usb/core/hub.c:5098 [inline]
        hub_port_connect_change drivers/usb/core/hub.c:5213 [inline]
        port_event drivers/usb/core/hub.c:5359 [inline]
        hub_event+0x1b5c/0x3640 drivers/usb/core/hub.c:5441
        process_one_work+0x92b/0x1530 kernel/workqueue.c:2269
        worker_thread+0x96/0xe20 kernel/workqueue.c:2415
        kthread+0x318/0x420 kernel/kthread.c:255
        ret_from_fork+0x24/0x30 arch/x86/entry/entry_64.S:352

-> #0 (rio500_mutex){+.+.}:
        check_prev_add kernel/locking/lockdep.c:2405 [inline]
        check_prevs_add kernel/locking/lockdep.c:2507 [inline]
        validate_chain kernel/locking/lockdep.c:2897 [inline]
        __lock_acquire+0x1f7c/0x3b50 kernel/locking/lockdep.c:3880
        lock_acquire+0x127/0x320 kernel/locking/lockdep.c:4412
        __mutex_lock_common kernel/locking/mutex.c:930 [inline]
        __mutex_lock+0x158/0x1360 kernel/locking/mutex.c:1077
        open_rio+0x16/0xe0 drivers/usb/misc/rio500.c:65
        usb_open+0x1df/0x270 drivers/usb/core/file.c:48
        chrdev_open+0x219/0x5c0 fs/char_dev.c:414
        do_dentry_open+0x494/0x1120 fs/open.c:797
        do_last fs/namei.c:3416 [inline]
        path_openat+0x1430/0x3f50 fs/namei.c:3533
        do_filp_open+0x1a1/0x280 fs/namei.c:3563
        do_sys_open+0x3c0/0x580 fs/open.c:1089
        do_syscall_64+0xb7/0x580 arch/x86/entry/common.c:296
        entry_SYSCALL_64_after_hwframe+0x49/0xbe

other info that might help us debug this:

  Possible unsafe locking scenario:

        CPU0                    CPU1
        ----                    ----
   lock(minor_rwsem);
                                lock(rio500_mutex);
                                lock(minor_rwsem);
   lock(rio500_mutex);

  *** DEADLOCK ***

1 lock held by syz-executor071/1724:
  #0: 000000009c24ba51 (minor_rwsem){++++}, at: usb_open+0x23/0x270  
drivers/usb/core/file.c:39

stack backtrace:
CPU: 0 PID: 1724 Comm: syz-executor071 Not tainted 5.3.0-rc7+ #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS  
Google 01/01/2011
Call Trace:
  __dump_stack lib/dump_stack.c:77 [inline]
  dump_stack+0xca/0x13e lib/dump_stack.c:113
  check_noncircular+0x345/0x3e0 kernel/locking/lockdep.c:1741
  check_prev_add kernel/locking/lockdep.c:2405 [inline]
  check_prevs_add kernel/locking/lockdep.c:2507 [inline]
  validate_chain kernel/locking/lockdep.c:2897 [inline]
  __lock_acquire+0x1f7c/0x3b50 kernel/locking/lockdep.c:3880
  lock_acquire+0x127/0x320 kernel/locking/lockdep.c:4412
  __mutex_lock_common kernel/locking/mutex.c:930 [inline]
  __mutex_lock+0x158/0x1360 kernel/locking/mutex.c:1077
  open_rio+0x16/0xe0 drivers/usb/misc/rio500.c:65
  usb_open+0x1df/0x270 drivers/usb/core/file.c:48
  chrdev_open+0x219/0x5c0 fs/char_dev.c:414
  do_dentry_open+0x494/0x1120 fs/open.c:797
  do_last fs/namei.c:3416 [inline]
  path_openat+0x1430/0x3f50 fs/namei.c:3533
  do_filp_open+0x1a1/0x280 fs/namei.c:3563
  do_sys_open+0x3c0/0x580 fs/open.c:1089
  do_syscall_64+0xb7/0x580 arch/x86/entry/common.c:296
  entry_SYSCALL_64_after_hwframe+0x49/0xbe
RIP: 0033:0x401130
Code: 01 f0 ff ff 0f 83 00 0b 00 00 c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f  
44 00 00 83 3d 5d 0c 2d 00 00 75 14 b8 02 00 00 00 0f 05 <48> 3d 01 f0 ff  
ff 0f 83 d4 0a 00 00 c3 48 83 ec 08 e8 3a 00 00 00
RSP: 002b:00007ffca0216788 EFLAGS: 00000246 ORIG_RAX: 0000000000000002
RAX: ffffffffffffffda RBX: 00000000004002c8 RCX: 0000000000401130
RDX: 0000000000000000 RSI: 0000000000000002 RDI: 00007ffca02167a0
RBP: 00000000006cb018 R08: 0000000000000000 R09: 000000000000000f
R10: 0000000000000064 R11: 0000000000000246 R12: 0000000000402090
R13: 0000000000402120 R14: 0000000000000000 R15: 00


---
This bug is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this bug report. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
syzbot can test patches for this bug, for details see:
https://goo.gl/tpsmEJ#testing-patches
