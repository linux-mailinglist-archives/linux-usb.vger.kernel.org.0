Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BF75C7D977
	for <lists+linux-usb@lfdr.de>; Thu,  1 Aug 2019 12:38:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730910AbfHAKiH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 1 Aug 2019 06:38:07 -0400
Received: from mail-io1-f69.google.com ([209.85.166.69]:47657 "EHLO
        mail-io1-f69.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729021AbfHAKiG (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 1 Aug 2019 06:38:06 -0400
Received: by mail-io1-f69.google.com with SMTP id r27so78719291iob.14
        for <linux-usb@vger.kernel.org>; Thu, 01 Aug 2019 03:38:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=pbGmbF/POUQV24a8JlDDiPC5+2XXWOy8ug9M60UKDPM=;
        b=I+bWJAkX1Hh4zECY8+fMDFAfse7/jUraL6dBamcKoB/3CFdl3mHZyVCh0AXA0QuePl
         tx3hPT1tRhhoD3DqUV+LkhziG7Z6/La1VvT7ikdTsjX1+N4d6rk8dTCUHOhf4IHyxqPt
         tYSpR2oKAQ6YAWmfY/nh3mfD7Heh/DKi5mewuA+O5IR6fwo//lYAGd5DNfzdqoGonDaw
         L+/yKSIR+udPxOscChcYfqYLrcMliQfQPCeZdp7v7VZur+xdN27fiXylNjU7uJ+6qPL+
         wvqjmo0tnxv4007m9DvQWdQR3cKOylfCqPawhafteMlocsW9T079uxHDbqYumMr9QMO2
         RJHQ==
X-Gm-Message-State: APjAAAWmkKDRh1f/jOiSQD5wmV94up7BHgtW6U5prrNx+sbN5UzhYBXT
        wmhzDRSm2c/wC8eaAH8fUPcovKBhqTVMj6oK949AhR7mrM8p
X-Google-Smtp-Source: APXvYqwbtON7kQZ9CnpohL/UR+kkehQVmRcu12UBT3xDbQaVlqds9vmdtu1cJfwXRel76ScV1YuI7fxycV1jB3THK5egmXBDXNpn
MIME-Version: 1.0
X-Received: by 2002:a02:b10b:: with SMTP id r11mr124699453jah.140.1564655885449;
 Thu, 01 Aug 2019 03:38:05 -0700 (PDT)
Date:   Thu, 01 Aug 2019 03:38:05 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000003f86d8058f0bd671@google.com>
Subject: KASAN: use-after-free Read in usb_free_coherent
From:   syzbot <syzbot+d1fedb1c1fdb07fca507@syzkaller.appspotmail.com>
To:     andreyknvl@google.com, dtor@chromium.org,
        gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, mans@mansr.com,
        mathias.payer@nebelwelt.net, robh@kernel.org,
        srinivas.kandagatla@linaro.org, stern@rowland.harvard.edu,
        suzuki.poulose@arm.com, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,

syzbot found the following crash on:

HEAD commit:    7f7867ff usb-fuzzer: main usb gadget fuzzer driver
git tree:       https://github.com/google/kasan.git usb-fuzzer
console output: https://syzkaller.appspot.com/x/log.txt?x=13efa030600000
kernel config:  https://syzkaller.appspot.com/x/.config?x=792eb47789f57810
dashboard link: https://syzkaller.appspot.com/bug?extid=d1fedb1c1fdb07fca507
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)

Unfortunately, I don't have any reproducer for this crash yet.

IMPORTANT: if you fix the bug, please add the following tag to the commit:
Reported-by: syzbot+d1fedb1c1fdb07fca507@syzkaller.appspotmail.com

==================================================================
BUG: KASAN: use-after-free in usb_free_coherent+0x79/0x80  
drivers/usb/core/usb.c:928
Read of size 8 at addr ffff8881b18599c8 by task syz-executor.4/16007

CPU: 0 PID: 16007 Comm: syz-executor.4 Not tainted 5.3.0-rc2+ #23
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS  
Google 01/01/2011
Call Trace:
  __dump_stack lib/dump_stack.c:77 [inline]
  dump_stack+0xca/0x13e lib/dump_stack.c:113
  print_address_description+0x6a/0x32c mm/kasan/report.c:351
  __kasan_report.cold+0x1a/0x33 mm/kasan/report.c:482
  kasan_report+0xe/0x12 mm/kasan/common.c:612
  usb_free_coherent+0x79/0x80 drivers/usb/core/usb.c:928
  yurex_delete+0x138/0x330 drivers/usb/misc/yurex.c:100
  kref_put include/linux/kref.h:65 [inline]
  yurex_release+0x66/0x90 drivers/usb/misc/yurex.c:392
  __fput+0x2d7/0x840 fs/file_table.c:280
  task_work_run+0x13f/0x1c0 kernel/task_work.c:113
  tracehook_notify_resume include/linux/tracehook.h:188 [inline]
  exit_to_usermode_loop+0x1d2/0x200 arch/x86/entry/common.c:163
  prepare_exit_to_usermode arch/x86/entry/common.c:194 [inline]
  syscall_return_slowpath arch/x86/entry/common.c:274 [inline]
  do_syscall_64+0x45f/0x580 arch/x86/entry/common.c:299
  entry_SYSCALL_64_after_hwframe+0x49/0xbe
RIP: 0033:0x413511
Code: 75 14 b8 03 00 00 00 0f 05 48 3d 01 f0 ff ff 0f 83 04 1b 00 00 c3 48  
83 ec 08 e8 0a fc ff ff 48 89 04 24 b8 03 00 00 00 0f 05 <48> 8b 3c 24 48  
89 c2 e8 53 fc ff ff 48 89 d0 48 83 c4 08 48 3d 01
RSP: 002b:00007ffc424ea2e0 EFLAGS: 00000293 ORIG_RAX: 0000000000000003
RAX: 0000000000000000 RBX: 0000000000000007 RCX: 0000000000413511
RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000006
RBP: 0000000000000001 R08: 0000000029a2fc22 R09: 0000000029a2fc26
R10: 00007ffc424ea3c0 R11: 0000000000000293 R12: 000000000075c9a0
R13: 000000000075c9a0 R14: 0000000000761938 R15: ffffffffffffffff

Allocated by task 2776:
  save_stack+0x1b/0x80 mm/kasan/common.c:69
  set_track mm/kasan/common.c:77 [inline]
  __kasan_kmalloc mm/kasan/common.c:487 [inline]
  __kasan_kmalloc.constprop.0+0xbf/0xd0 mm/kasan/common.c:460
  kmalloc include/linux/slab.h:552 [inline]
  kzalloc include/linux/slab.h:748 [inline]
  usb_alloc_dev+0x51/0xf95 drivers/usb/core/usb.c:583
  hub_port_connect drivers/usb/core/hub.c:5004 [inline]
  hub_port_connect_change drivers/usb/core/hub.c:5213 [inline]
  port_event drivers/usb/core/hub.c:5359 [inline]
  hub_event+0x15c0/0x3640 drivers/usb/core/hub.c:5441
  process_one_work+0x92b/0x1530 kernel/workqueue.c:2269
  worker_thread+0x96/0xe20 kernel/workqueue.c:2415
  kthread+0x318/0x420 kernel/kthread.c:255
  ret_from_fork+0x24/0x30 arch/x86/entry/entry_64.S:352

Freed by task 16007:
  save_stack+0x1b/0x80 mm/kasan/common.c:69
  set_track mm/kasan/common.c:77 [inline]
  __kasan_slab_free+0x130/0x180 mm/kasan/common.c:449
  slab_free_hook mm/slub.c:1423 [inline]
  slab_free_freelist_hook mm/slub.c:1470 [inline]
  slab_free mm/slub.c:3012 [inline]
  kfree+0xe4/0x2f0 mm/slub.c:3953
  device_release+0x71/0x200 drivers/base/core.c:1064
  kobject_cleanup lib/kobject.c:693 [inline]
  kobject_release lib/kobject.c:722 [inline]
  kref_put include/linux/kref.h:65 [inline]
  kobject_put+0x171/0x280 lib/kobject.c:739
  put_device+0x1b/0x30 drivers/base/core.c:2213
  usb_put_dev+0x1f/0x30 drivers/usb/core/usb.c:725
  yurex_delete+0x40/0x330 drivers/usb/misc/yurex.c:95
  kref_put include/linux/kref.h:65 [inline]
  yurex_release+0x66/0x90 drivers/usb/misc/yurex.c:392
  __fput+0x2d7/0x840 fs/file_table.c:280
  task_work_run+0x13f/0x1c0 kernel/task_work.c:113
  tracehook_notify_resume include/linux/tracehook.h:188 [inline]
  exit_to_usermode_loop+0x1d2/0x200 arch/x86/entry/common.c:163
  prepare_exit_to_usermode arch/x86/entry/common.c:194 [inline]
  syscall_return_slowpath arch/x86/entry/common.c:274 [inline]
  do_syscall_64+0x45f/0x580 arch/x86/entry/common.c:299
  entry_SYSCALL_64_after_hwframe+0x49/0xbe

The buggy address belongs to the object at ffff8881b1859980
  which belongs to the cache kmalloc-2k of size 2048
The buggy address is located 72 bytes inside of
  2048-byte region [ffff8881b1859980, ffff8881b185a180)
The buggy address belongs to the page:
page:ffffea0006c61600 refcount:1 mapcount:0 mapping:ffff8881da00c000  
index:0x0 compound_mapcount: 0
flags: 0x200000000010200(slab|head)
raw: 0200000000010200 0000000000000000 0000000100000001 ffff8881da00c000
raw: 0000000000000000 00000000000f000f 00000001ffffffff 0000000000000000
page dumped because: kasan: bad access detected

Memory state around the buggy address:
  ffff8881b1859880: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
  ffff8881b1859900: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
> ffff8881b1859980: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                                               ^
  ffff8881b1859a00: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
  ffff8881b1859a80: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
==================================================================


---
This bug is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this bug report. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
