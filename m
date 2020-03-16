Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 15619187510
	for <lists+linux-usb@lfdr.de>; Mon, 16 Mar 2020 22:47:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732732AbgCPVrN (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 16 Mar 2020 17:47:13 -0400
Received: from mail-il1-f197.google.com ([209.85.166.197]:37347 "EHLO
        mail-il1-f197.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732652AbgCPVrN (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 16 Mar 2020 17:47:13 -0400
Received: by mail-il1-f197.google.com with SMTP id c26so5942882ila.4
        for <linux-usb@vger.kernel.org>; Mon, 16 Mar 2020 14:47:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=93JvZLmTOnkoS91wA9XohED6Fc53DZaaGOWIBltvckk=;
        b=BUUoGt7ANCmiHtLyoa7rPMPQAJa0ARVuf9GUOyD9kZ/nRI+jZ5HN892mNKYuRc1h9A
         aT5NzidXhEUOtbKBbKRh5pn3/VCPXUCfgN+wsifZkTMK9NXDPi7fhiw80zXt0n8Pwank
         QBiQYgjn27bO/MM5jJq59YPB1EsBkPSJcgUynMlOY1z8dxESNgobphMf3TrJFE46+OKU
         5XKfyX0Iga1dojjgWGW+h6crwNO7Ze7NIhzddmuRUxiAYOUeaQuWoaPvj5AG2AnlyJod
         WkyGQSiEL2P/rWXEB3FWoqp6f0Z8Jfy6M/sEcSy6wOUipZIGULx6+cElhSHaAbVEpGCr
         oY9w==
X-Gm-Message-State: ANhLgQ2+VOOfss5jmtEbBY//0By+AnTVFS+nYjyByCQNT/9ODskfzbaR
        lcJ4iwbIjvMxM0l7q/p9zChbpTqtoReGjVXZmGQv6XTBtPzt
X-Google-Smtp-Source: ADFU+vuP1lLey3covMBjxE5Q1WQdv7zR5SCoeqBIA4imdlwnlesQoluKF13qvJoOLJb6k+MvKvMmXDY3eVgd6ZApMEFf4+Ec46DF
MIME-Version: 1.0
X-Received: by 2002:a6b:e70c:: with SMTP id b12mr1104590ioh.33.1584395231954;
 Mon, 16 Mar 2020 14:47:11 -0700 (PDT)
Date:   Mon, 16 Mar 2020 14:47:11 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000fc0c1c05a0ffc2b8@google.com>
Subject: KASAN: slab-out-of-bounds Read in dlfb_usb_probe
From:   syzbot <syzbot+ed94135f896a14d75284@syzkaller.appspotmail.com>
To:     andreyknvl@google.com, gregkh@linuxfoundation.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        rafael@kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,

syzbot found the following crash on:

HEAD commit:    d6ff8147 usb: gadget: add raw-gadget interface
git tree:       https://github.com/google/kasan.git usb-fuzzer
console output: https://syzkaller.appspot.com/x/log.txt?x=10bccd55e00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=90a3d9bed5648419
dashboard link: https://syzkaller.appspot.com/bug?extid=ed94135f896a14d75284
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=139f4a75e00000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=15fb8d19e00000

IMPORTANT: if you fix the bug, please add the following tag to the commit:
Reported-by: syzbot+ed94135f896a14d75284@syzkaller.appspotmail.com

usb 1-1: New USB device strings: Mfr=1, Product=2, SerialNumber=3
usb 1-1: Product: syz
usb 1-1: Manufacturer: syz
usb 1-1: SerialNumber: syz
usb 1-1: config 0 descriptor??
==================================================================
BUG: KASAN: slab-out-of-bounds in hex_string+0x439/0x4c0 lib/vsprintf.c:1137
Read of size 1 at addr ffff8881ce6cb71b by task kworker/0:2/94

CPU: 0 PID: 94 Comm: kworker/0:2 Not tainted 5.6.0-rc3-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
Workqueue: usb_hub_wq hub_event
Call Trace:
 __dump_stack lib/dump_stack.c:77 [inline]
 dump_stack+0xef/0x16e lib/dump_stack.c:118
 print_address_description.constprop.0.cold+0xd3/0x314 mm/kasan/report.c:374
 __kasan_report.cold+0x37/0x77 mm/kasan/report.c:506
 kasan_report+0xe/0x20 mm/kasan/common.c:641
 hex_string+0x439/0x4c0 lib/vsprintf.c:1137
 pointer+0x45b/0x680 lib/vsprintf.c:2193
 vsnprintf+0x5ac/0x14f0 lib/vsprintf.c:2578
 va_format.isra.0+0x129/0x1b0 lib/vsprintf.c:1652
 pointer+0x4bf/0x680 lib/vsprintf.c:2221
 vsnprintf+0x5ac/0x14f0 lib/vsprintf.c:2578
 vscnprintf+0x29/0x80 lib/vsprintf.c:2677
 vprintk_store+0x40/0x4b0 kernel/printk/printk.c:1917
 vprintk_emit+0xc8/0x3d0 kernel/printk/printk.c:1978
 dev_vprintk_emit+0x4fc/0x541 drivers/base/core.c:3603
 dev_printk_emit+0xba/0xf1 drivers/base/core.c:3614
 __dev_printk+0x1db/0x203 drivers/base/core.c:3626
 _dev_info+0xd7/0x109 drivers/base/core.c:3672
 dlfb_parse_vendor_descriptor drivers/video/fbdev/udlfb.c:1589 [inline]
 dlfb_usb_probe.cold+0xfd9/0x1ba3 drivers/video/fbdev/udlfb.c:1672
 usb_probe_interface+0x310/0x800 drivers/usb/core/driver.c:374
 really_probe+0x290/0xac0 drivers/base/dd.c:551
 driver_probe_device+0x223/0x350 drivers/base/dd.c:724
 __device_attach_driver+0x1d1/0x290 drivers/base/dd.c:831
 bus_for_each_drv+0x162/0x1e0 drivers/base/bus.c:431
 __device_attach+0x217/0x390 drivers/base/dd.c:897
 bus_probe_device+0x1e4/0x290 drivers/base/bus.c:491
 device_add+0x1459/0x1bf0 drivers/base/core.c:2487
 usb_set_configuration+0xe47/0x17d0 drivers/usb/core/message.c:2023
 usb_generic_driver_probe+0x9d/0xe0 drivers/usb/core/generic.c:241
 usb_probe_device+0xd9/0x230 drivers/usb/core/driver.c:272
 really_probe+0x290/0xac0 drivers/base/dd.c:551
 driver_probe_device+0x223/0x350 drivers/base/dd.c:724
 __device_attach_driver+0x1d1/0x290 drivers/base/dd.c:831
 bus_for_each_drv+0x162/0x1e0 drivers/base/bus.c:431
 __device_attach+0x217/0x390 drivers/base/dd.c:897
 bus_probe_device+0x1e4/0x290 drivers/base/bus.c:491
 device_add+0x1459/0x1bf0 drivers/base/core.c:2487
 usb_new_device.cold+0x540/0xcd0 drivers/usb/core/hub.c:2544
 hub_port_connect drivers/usb/core/hub.c:5191 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5331 [inline]
 port_event drivers/usb/core/hub.c:5477 [inline]
 hub_event+0x21cb/0x4300 drivers/usb/core/hub.c:5559
 process_one_work+0x94b/0x1620 kernel/workqueue.c:2264
 worker_thread+0x96/0xe20 kernel/workqueue.c:2410
 kthread+0x318/0x420 kernel/kthread.c:255
 ret_from_fork+0x24/0x30 arch/x86/entry/entry_64.S:352

Allocated by task 94:
 save_stack+0x1b/0x80 mm/kasan/common.c:72
 set_track mm/kasan/common.c:80 [inline]
 __kasan_kmalloc mm/kasan/common.c:515 [inline]
 __kasan_kmalloc.constprop.0+0xbf/0xd0 mm/kasan/common.c:488
 kmalloc include/linux/slab.h:560 [inline]
 usb_get_configuration+0x311/0x3a20 drivers/usb/core/config.c:919
 usb_enumerate_device drivers/usb/core/hub.c:2377 [inline]
 usb_new_device+0x2f9/0x450 drivers/usb/core/hub.c:2513
 hub_port_connect drivers/usb/core/hub.c:5191 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5331 [inline]
 port_event drivers/usb/core/hub.c:5477 [inline]
 hub_event+0x21cb/0x4300 drivers/usb/core/hub.c:5559
 process_one_work+0x94b/0x1620 kernel/workqueue.c:2264
 worker_thread+0x96/0xe20 kernel/workqueue.c:2410
 kthread+0x318/0x420 kernel/kthread.c:255
 ret_from_fork+0x24/0x30 arch/x86/entry/entry_64.S:352

Freed by task 369:
 save_stack+0x1b/0x80 mm/kasan/common.c:72
 set_track mm/kasan/common.c:80 [inline]
 kasan_set_free_info mm/kasan/common.c:337 [inline]
 __kasan_slab_free+0x117/0x160 mm/kasan/common.c:476
 slab_free_hook mm/slub.c:1444 [inline]
 slab_free_freelist_hook mm/slub.c:1477 [inline]
 slab_free mm/slub.c:3024 [inline]
 kfree+0xd5/0x300 mm/slub.c:3976
 single_release+0x8c/0xb0 fs/seq_file.c:609
 __fput+0x2d7/0x840 fs/file_table.c:280
 task_work_run+0x13f/0x1c0 kernel/task_work.c:113
 tracehook_notify_resume include/linux/tracehook.h:188 [inline]
 exit_to_usermode_loop+0x1d2/0x200 arch/x86/entry/common.c:164
 prepare_exit_to_usermode arch/x86/entry/common.c:195 [inline]
 syscall_return_slowpath arch/x86/entry/common.c:278 [inline]
 do_syscall_64+0x4e0/0x5a0 arch/x86/entry/common.c:304
 entry_SYSCALL_64_after_hwframe+0x49/0xbe

The buggy address belongs to the object at ffff8881ce6cb700
 which belongs to the cache kmalloc-32 of size 32
The buggy address is located 27 bytes inside of
 32-byte region [ffff8881ce6cb700, ffff8881ce6cb720)
The buggy address belongs to the page:
page:ffffea000739b2c0 refcount:1 mapcount:0 mapping:ffff8881da003400 index:0xffff8881ce6cbec0
flags: 0x200000000000200(slab)
raw: 0200000000000200 ffffea00073bfac0 0000000d0000000d ffff8881da003400
raw: ffff8881ce6cbec0 000000008040002b 00000001ffffffff 0000000000000000
page dumped because: kasan: bad access detected

Memory state around the buggy address:
 ffff8881ce6cb600: fb fb fb fb fc fc fc fc fb fb fb fb fc fc fc fc
 ffff8881ce6cb680: fb fb fb fb fc fc fc fc fb fb fb fb fc fc fc fc
>ffff8881ce6cb700: 00 00 00 03 fc fc fc fc fb fb fb fb fc fc fc fc
                            ^
 ffff8881ce6cb780: fb fb fb fb fc fc fc fc fb fb fb fb fc fc fc fc
 ffff8881ce6cb800: fb fb fb fb fc fc fc fc fb fb fb fb fc fc fc fc
==================================================================


---
This bug is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this bug report. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
syzbot can test patches for this bug, for details see:
https://goo.gl/tpsmEJ#testing-patches
