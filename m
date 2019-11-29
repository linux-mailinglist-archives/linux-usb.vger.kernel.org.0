Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D0DDD10D438
	for <lists+linux-usb@lfdr.de>; Fri, 29 Nov 2019 11:35:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726586AbfK2KfI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 29 Nov 2019 05:35:08 -0500
Received: from mail-io1-f71.google.com ([209.85.166.71]:44045 "EHLO
        mail-io1-f71.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725892AbfK2KfI (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 29 Nov 2019 05:35:08 -0500
Received: by mail-io1-f71.google.com with SMTP id t16so14960379iog.11
        for <linux-usb@vger.kernel.org>; Fri, 29 Nov 2019 02:35:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=OGcjapQzLy7dUOOJVg8PgFzMbIK79uLO7twQWtJcTVg=;
        b=JNeFO3ZT+ooNgb9nGnZb11W8/bAp6b3+GgHltQV3mjDa+cnkoNEFKyVDmRqBn0afzp
         5SWeuDvPnLokSyPft/kI2pcQcKwgNr7S+eKbKZWTUvIjwK6rJ/aKSJIJxWXOcwmTuNgn
         Ea/ASX8KRw62hjHhhIeCIwclZgTAgeziMiYBJLqqW8/OWt/Ctj1o+IafjDbdbcbjjk6M
         kiHx/K6DAmqSa1xNsGcrLK4QG4SdGVONp4rJnvc3MPpjw6MOy9uVAHMY9Ljjf11gEh9T
         +aUIJK6lM2ndTYh22CjR2nlLGaxMXZCA5eijo8pGd47FlTyaxXg3ceeDfPdoiFJ3eQAi
         iy5w==
X-Gm-Message-State: APjAAAXaZdQuXHf1eBRQRzCYWsPcxntW1pYR2/QtPqPtfOXIXQtqVzth
        Snax9pOPVKHzAZj6bz/f0XgR0W1WKmLG/+iA0Lb5T0U4wAL4
X-Google-Smtp-Source: APXvYqyZ/qpLbF8G7/m0oN8CFhBaeKT++NcOzBx0xKuJJyRfyOqI+2t7pNtx6RmLAqJIFtZWoYhct7OpE46I2WDkiQTGmCA+lY18
MIME-Version: 1.0
X-Received: by 2002:a5d:8855:: with SMTP id t21mr46884865ios.138.1575023707562;
 Fri, 29 Nov 2019 02:35:07 -0800 (PST)
Date:   Fri, 29 Nov 2019 02:35:07 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000009a2b62059879c830@google.com>
Subject: KASAN: slab-out-of-bounds Read in chaoskey_disconnect
From:   syzbot <syzbot+8632e5cd5a4e644e5745@syzkaller.appspotmail.com>
To:     alexandre.belloni@bootlin.com, andreyknvl@google.com,
        arnd@arndb.de, b.zolnierkie@samsung.com,
        gregkh@linuxfoundation.org, herbert@gondor.apana.org.au,
        linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, lvivier@redhat.com,
        mchehab+samsung@kernel.org, mpm@selenic.com, swboyd@chromium.org,
        syzkaller-bugs@googlegroups.com, tytso@mit.edu
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,

syzbot found the following crash on:

HEAD commit:    da06441b usb: gadget: add raw-gadget interface
git tree:       https://github.com/google/kasan.git usb-fuzzer
console output: https://syzkaller.appspot.com/x/log.txt?x=10dd88eee00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=99c88c44660624e7
dashboard link: https://syzkaller.appspot.com/bug?extid=8632e5cd5a4e644e5745
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)

Unfortunately, I don't have any reproducer for this crash yet.

IMPORTANT: if you fix the bug, please add the following tag to the commit:
Reported-by: syzbot+8632e5cd5a4e644e5745@syzkaller.appspotmail.com

usb 3-1: USB disconnect, device number 46
==================================================================
BUG: KASAN: slab-out-of-bounds in atomic_read  
include/asm-generic/atomic-instrumented.h:26 [inline]
BUG: KASAN: slab-out-of-bounds in refcount_inc_not_zero_checked+0x72/0x1e0  
lib/refcount.c:123
Read of size 4 at addr ffff8881d2771820 by task kworker/1:4/3303

CPU: 1 PID: 3303 Comm: kworker/1:4 Not tainted 5.4.0-rc6-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS  
Google 01/01/2011
Workqueue: usb_hub_wq hub_event
Call Trace:
  __dump_stack lib/dump_stack.c:77 [inline]
  dump_stack+0xca/0x13e lib/dump_stack.c:113
  print_address_description.constprop.0+0x36/0x50 mm/kasan/report.c:374
  __kasan_report.cold+0x1a/0x33 mm/kasan/report.c:506
  kasan_report+0xe/0x20 mm/kasan/common.c:634
  check_memory_region_inline mm/kasan/generic.c:185 [inline]
  check_memory_region+0x128/0x190 mm/kasan/generic.c:192
  atomic_read include/asm-generic/atomic-instrumented.h:26 [inline]
  refcount_inc_not_zero_checked+0x72/0x1e0 lib/refcount.c:123
  refcount_inc_checked+0x12/0x60 lib/refcount.c:156
  get_task_struct include/linux/sched/task.h:110 [inline]
  kthread_stop+0x6c/0x610 kernel/kthread.c:554
  hwrng_unregister+0x190/0x210 drivers/char/hw_random/core.c:538
  chaoskey_disconnect+0x1b2/0x200 drivers/usb/misc/chaoskey.c:232
  usb_unbind_interface+0x1bd/0x8a0 drivers/usb/core/driver.c:423
  __device_release_driver drivers/base/dd.c:1134 [inline]
  device_release_driver_internal+0x42f/0x500 drivers/base/dd.c:1165
  bus_remove_device+0x2dc/0x4a0 drivers/base/bus.c:532
  device_del+0x420/0xb20 drivers/base/core.c:2376
  usb_disable_device+0x211/0x690 drivers/usb/core/message.c:1237
  usb_disconnect+0x284/0x8d0 drivers/usb/core/hub.c:2200
  hub_port_connect drivers/usb/core/hub.c:5035 [inline]
  hub_port_connect_change drivers/usb/core/hub.c:5324 [inline]
  port_event drivers/usb/core/hub.c:5470 [inline]
  hub_event+0x16f2/0x3800 drivers/usb/core/hub.c:5552
  process_one_work+0x92b/0x1530 kernel/workqueue.c:2269
  worker_thread+0x96/0xe20 kernel/workqueue.c:2415
  kthread+0x318/0x420 kernel/kthread.c:255
  ret_from_fork+0x24/0x30 arch/x86/entry/entry_64.S:352

Allocated by task 25070:
  save_stack+0x1b/0x80 mm/kasan/common.c:69
  set_track mm/kasan/common.c:77 [inline]
  __kasan_kmalloc mm/kasan/common.c:510 [inline]
  __kasan_kmalloc.constprop.0+0xbf/0xd0 mm/kasan/common.c:483
  kmalloc_node include/linux/slab.h:599 [inline]
  kvmalloc_node+0x61/0xf0 mm/util.c:564
  kvmalloc include/linux/mm.h:670 [inline]
  seq_buf_alloc fs/seq_file.c:32 [inline]
  seq_read+0x805/0x10f0 fs/seq_file.c:204
  kernfs_fop_read+0xe9/0x560 fs/kernfs/file.c:251
  __vfs_read+0x76/0x100 fs/read_write.c:425
  vfs_read+0x1ea/0x430 fs/read_write.c:461
  ksys_read+0x127/0x250 fs/read_write.c:587
  do_syscall_64+0xb7/0x580 arch/x86/entry/common.c:290
  entry_SYSCALL_64_after_hwframe+0x49/0xbe

Freed by task 25070:
  save_stack+0x1b/0x80 mm/kasan/common.c:69
  set_track mm/kasan/common.c:77 [inline]
  kasan_set_free_info mm/kasan/common.c:332 [inline]
  __kasan_slab_free+0x130/0x180 mm/kasan/common.c:471
  slab_free_hook mm/slub.c:1424 [inline]
  slab_free_freelist_hook mm/slub.c:1475 [inline]
  slab_free mm/slub.c:3025 [inline]
  kfree+0xe4/0x320 mm/slub.c:3977
  kvfree+0x59/0x60 mm/util.c:593
  seq_release+0x4f/0x80 fs/seq_file.c:360
  kernfs_fop_release+0xf2/0x190 fs/kernfs/file.c:780
  __fput+0x2d7/0x840 fs/file_table.c:280
  task_work_run+0x13f/0x1c0 kernel/task_work.c:113
  tracehook_notify_resume include/linux/tracehook.h:188 [inline]
  exit_to_usermode_loop+0x1d2/0x200 arch/x86/entry/common.c:163
  prepare_exit_to_usermode arch/x86/entry/common.c:194 [inline]
  syscall_return_slowpath arch/x86/entry/common.c:274 [inline]
  do_syscall_64+0x45f/0x580 arch/x86/entry/common.c:300
  entry_SYSCALL_64_after_hwframe+0x49/0xbe

The buggy address belongs to the object at ffff8881d2770000
  which belongs to the cache kmalloc-4k of size 4096
The buggy address is located 2080 bytes to the right of
  4096-byte region [ffff8881d2770000, ffff8881d2771000)
The buggy address belongs to the page:
page:ffffea000749dc00 refcount:1 mapcount:0 mapping:ffff8881da00c280  
index:0x0 compound_mapcount: 0
flags: 0x200000000010200(slab|head)
raw: 0200000000010200 dead000000000100 dead000000000122 ffff8881da00c280
raw: 0000000000000000 0000000000040004 00000001ffffffff 0000000000000000
page dumped because: kasan: bad access detected

Memory state around the buggy address:
  ffff8881d2771700: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
  ffff8881d2771780: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
> ffff8881d2771800: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
                                ^
  ffff8881d2771880: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
  ffff8881d2771900: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
==================================================================


---
This bug is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this bug report. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
