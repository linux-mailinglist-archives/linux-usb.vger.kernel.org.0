Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6AFFEB3B54
	for <lists+linux-usb@lfdr.de>; Mon, 16 Sep 2019 15:29:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733257AbfIPN3O (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 16 Sep 2019 09:29:14 -0400
Received: from mail-io1-f70.google.com ([209.85.166.70]:54671 "EHLO
        mail-io1-f70.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733236AbfIPN3N (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 16 Sep 2019 09:29:13 -0400
Received: by mail-io1-f70.google.com with SMTP id a20so50561062iok.21
        for <linux-usb@vger.kernel.org>; Mon, 16 Sep 2019 06:29:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=5ZUJhsqgpoCCn4jU5YhYsYU3T40C0q5cqL5dhqkQeqI=;
        b=thTBfuBkN6tyibgR0ZgE2QME7HuTDfCn70jd9i1dJdv8pD+yNyflRXjJ5MVtlQvSm1
         zb5xFlNzk9jW2qBfVWIjNTilNMfPhdcCiZHHA9/qSIKXBJVihOvNnJ9JEycrxgKXuj+w
         zOdxhrVcnfsnLhRHXdB/6AJbkm4pT7zERHt3/k+UNfT24FbDSG7g2qnokWQKEnF+t9eI
         d+XbdmTRJ1rKL/5zRtjAu9lXUHcEZDaH+kXLa2qBB1/0VlzRsUrShjO61js3nLR21HOc
         TkhNwjkAYpAbdo1XcvQjA+iL/5VYwLdwI0q0NVvMMWc/RBfggPnjP4GbcgQb3gnj4JSb
         Omkw==
X-Gm-Message-State: APjAAAWa+4pxrM6+7jRhksroYZ2sgbkr6ORdTZrnTidqahMrddLF6Imq
        ROr2mxVZfgK3cb+GwAyvs7DG1XMAnkSsv1OQfFDZUvZbzOHP
X-Google-Smtp-Source: APXvYqxQ8gS9JKu5CWGDi2n0HkCBaJx8dcwVaidIgtmT3OjfgEyCIjrTsgva7oqzsn38gzf+eOiHqX+HLatv4EQFuNGKozMclNNk
MIME-Version: 1.0
X-Received: by 2002:a02:7797:: with SMTP id g145mr67307912jac.60.1568640552296;
 Mon, 16 Sep 2019 06:29:12 -0700 (PDT)
Date:   Mon, 16 Sep 2019 06:29:12 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000e669b80592ab96fc@google.com>
Subject: possible deadlock in tower_open
From:   syzbot <syzbot+66935bec147fbf68d9f8@syzkaller.appspotmail.com>
To:     andreyknvl@google.com, gregkh@linuxfoundation.org,
        legousb-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, starblue@users.sourceforge.net,
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
console output: https://syzkaller.appspot.com/x/log.txt?x=13c8d14e600000
kernel config:  https://syzkaller.appspot.com/x/.config?x=5c6633fa4ed00be5
dashboard link: https://syzkaller.appspot.com/bug?extid=66935bec147fbf68d9f8
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)

Unfortunately, I don't have any reproducer for this crash yet.

IMPORTANT: if you fix the bug, please add the following tag to the commit:
Reported-by: syzbot+66935bec147fbf68d9f8@syzkaller.appspotmail.com

======================================================
WARNING: possible circular locking dependency detected
5.3.0-rc7+ #0 Not tainted
------------------------------------------------------
syz-executor.1/8155 is trying to acquire lock:
0000000086c1bdfc (open_disc_mutex){+.+.}, at: tower_open+0xce/0x9b0  
drivers/usb/misc/legousbtower.c:335

but task is already holding lock:
000000000f520f73 (minor_rwsem){++++}, at: usb_open+0x23/0x270  
drivers/usb/core/file.c:39

which lock already depends on the new lock.


the existing dependency chain (in reverse order) is:

-> #1 (minor_rwsem){++++}:
        down_write+0x92/0x150 kernel/locking/rwsem.c:1500
        usb_deregister_dev+0x95/0x230 drivers/usb/core/file.c:239
        tower_disconnect+0xa8/0x300 drivers/usb/misc/legousbtower.c:951
        usb_unbind_interface+0x1bd/0x8a0 drivers/usb/core/driver.c:423
        __device_release_driver drivers/base/dd.c:1134 [inline]
        device_release_driver_internal+0x42f/0x500 drivers/base/dd.c:1165
        bus_remove_device+0x2dc/0x4a0 drivers/base/bus.c:556
        device_del+0x420/0xb10 drivers/base/core.c:2339
        usb_disable_device+0x211/0x690 drivers/usb/core/message.c:1237
        usb_disconnect+0x284/0x8d0 drivers/usb/core/hub.c:2199
        hub_port_connect drivers/usb/core/hub.c:4949 [inline]
        hub_port_connect_change drivers/usb/core/hub.c:5213 [inline]
        port_event drivers/usb/core/hub.c:5359 [inline]
        hub_event+0x1454/0x3640 drivers/usb/core/hub.c:5441
        process_one_work+0x92b/0x1530 kernel/workqueue.c:2269
        worker_thread+0x96/0xe20 kernel/workqueue.c:2415
        kthread+0x318/0x420 kernel/kthread.c:255
        ret_from_fork+0x24/0x30 arch/x86/entry/entry_64.S:352

-> #0 (open_disc_mutex){+.+.}:
        check_prev_add kernel/locking/lockdep.c:2405 [inline]
        check_prevs_add kernel/locking/lockdep.c:2507 [inline]
        validate_chain kernel/locking/lockdep.c:2897 [inline]
        __lock_acquire+0x1f7c/0x3b50 kernel/locking/lockdep.c:3880
        lock_acquire+0x127/0x320 kernel/locking/lockdep.c:4412
        __mutex_lock_common kernel/locking/mutex.c:930 [inline]
        __mutex_lock+0x158/0x1360 kernel/locking/mutex.c:1077
        tower_open+0xce/0x9b0 drivers/usb/misc/legousbtower.c:335
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
                                lock(open_disc_mutex);
                                lock(minor_rwsem);
   lock(open_disc_mutex);

  *** DEADLOCK ***

1 lock held by syz-executor.1/8155:
  #0: 000000000f520f73 (minor_rwsem){++++}, at: usb_open+0x23/0x270  
drivers/usb/core/file.c:39

stack backtrace:
CPU: 0 PID: 8155 Comm: syz-executor.1 Not tainted 5.3.0-rc7+ #0
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
  tower_open+0xce/0x9b0 drivers/usb/misc/legousbtower.c:335
  usb_open+0x1df/0x270 drivers/usb/core/file.c:48
  chrdev_open+0x219/0x5c0 fs/char_dev.c:414
  do_dentry_open+0x494/0x1120 fs/open.c:797
  do_last fs/namei.c:3416 [inline]
  path_openat+0x1430/0x3f50 fs/namei.c:3533
  do_filp_open+0x1a1/0x280 fs/namei.c:3563
  do_sys_open+0x3c0/0x580 fs/open.c:1089
  do_syscall_64+0xb7/0x580 arch/x86/entry/common.c:296
  entry_SYSCALL_64_after_hwframe+0x49/0xbe
RIP: 0033:0x4137d1
Code: 75 14 b8 02 00 00 00 0f 05 48 3d 01 f0 ff ff 0f 83 04 19 00 00 c3 48  
83 ec 08 e8 0a fa ff ff 48 89 04 24 b8 02 00 00 00 0f 05 <48> 8b 3c 24 48  
89 c2 e8 53 fa ff ff 48 89 d0 48 83 c4 08 48 3d 01
RSP: 002b:00007f56184c17a0 EFLAGS: 00000293 ORIG_RAX: 0000000000000002
RAX: ffffffffffffffda RBX: 6666666666666667 RCX: 00000000004137d1
RDX: 0000000000000000 RSI: 0000000000000000 RDI: 00007f56184c1850
RBP: 000000000075c070 R08: 000000000000000f R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000293 R12: 00007f56184c26d4
R13: 00000000004c8cab R14: 00000000004dfc78 R15: 00000000ffffffff


---
This bug is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this bug report. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
