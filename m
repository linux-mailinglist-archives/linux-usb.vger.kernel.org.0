Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3236F378ED0
	for <lists+linux-usb@lfdr.de>; Mon, 10 May 2021 15:52:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241090AbhEJNYD (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 10 May 2021 09:24:03 -0400
Received: from mail-il1-f199.google.com ([209.85.166.199]:39451 "EHLO
        mail-il1-f199.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344810AbhEJMUX (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 10 May 2021 08:20:23 -0400
Received: by mail-il1-f199.google.com with SMTP id v3-20020a056e0213c3b029016165a33c15so13554105ilj.6
        for <linux-usb@vger.kernel.org>; Mon, 10 May 2021 05:19:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=hbAZFBKi/91vle8IM936jH+bKaKyU5eiz4qnNx9xk7g=;
        b=V7BU3grC9wCkI1TRZYRD7tqAxhGEHcj0BoLT1QKCSD62JbUunuzy+i4pAp7vcGrggl
         d9hn1PMcq8fNwne0TM+LKk082Pjuus2GuWIOu1yjlwRSjHdudSIe57cZQ7tlOAo6r+oV
         SIt0m1j4CM9lN7NmHA7ywOkAYJJYuKTwV+IdwEcgYXqWaklAVx7AH2b9KxnUen3JtVKv
         yU4BCiZ1YTsl3slsiUBUJRQiv5lGYRcAMQk4mnz2vd3W1nf+s+FXl4GdXka9m2ZbCotz
         ZHNl/sqown24oAjV21s7dCuhkFQyD4v02UfesRuhXg1JYp6IA1pqp5regXx4JXs7cX2e
         dPkQ==
X-Gm-Message-State: AOAM530SSAUjmdlQ2unI3fPo3TaDfV8Ijkad/B+8uz9kDn0OPbGOs6Qx
        c5/77E1oqFSFWZxjjABWILb0/Kr/v5G/RFVho6Ljpb+66Ad5
X-Google-Smtp-Source: ABdhPJwXpj8S5GjUILMl0R62juQ4GkZOBmbuUP6T2/BxzMk1kLOxXpNZKMaqIMpNpwZqvCNgU8dxvr/feSSFm47SVVLH/8q4tor9
MIME-Version: 1.0
X-Received: by 2002:a5d:8c84:: with SMTP id g4mr1713784ion.32.1620649158559;
 Mon, 10 May 2021 05:19:18 -0700 (PDT)
Date:   Mon, 10 May 2021 05:19:18 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000066cad205c1f8c94f@google.com>
Subject: [syzbot] KASAN: slab-out-of-bounds Read in snd_usbmidi_get_ms_info
From:   syzbot <syzbot+6bb23a5d5548b93c94aa@syzkaller.appspotmail.com>
To:     alsa-devel@alsa-project.org, clemens@ladisch.de,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        perex@perex.cz, syzkaller-bugs@googlegroups.com, tiwai@suse.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,

syzbot found the following issue on:

HEAD commit:    31a85035 usb: gadget: fsl_qe_udc: fix implicit-fallthrough..
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
console output: https://syzkaller.appspot.com/x/log.txt?x=109f5a63d00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=fbebe41cc7d12c56
dashboard link: https://syzkaller.appspot.com/bug?extid=6bb23a5d5548b93c94aa
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=10693995d00000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=10e23c65d00000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+6bb23a5d5548b93c94aa@syzkaller.appspotmail.com

usb 1-1: config 199 interface 0 altsetting 0 endpoint 0x5 has an invalid bInterval 0, changing to 7
usb 1-1: New USB device found, idVendor=7300, idProduct=128c, bcdDevice=ed.06
usb 1-1: New USB device strings: Mfr=0, Product=0, SerialNumber=0
usb 1-1: string descriptor 0 read error: -71
usb 1-1: MIDIStreaming interface descriptor not found
==================================================================
BUG: KASAN: slab-out-of-bounds in snd_usbmidi_get_ms_info+0xeaf/0x10e0 sound/usb/midi.c:1982
Read of size 1 at addr ffff888119b80722 by task kworker/0:1/7

CPU: 0 PID: 7 Comm: kworker/0:1 Not tainted 5.12.0-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
Workqueue: usb_hub_wq hub_event
Call Trace:
 __dump_stack lib/dump_stack.c:79 [inline]
 dump_stack+0x143/0x1db lib/dump_stack.c:120
 print_address_description.constprop.0.cold+0x5b/0x2f8 mm/kasan/report.c:233
 __kasan_report mm/kasan/report.c:419 [inline]
 kasan_report.cold+0x7c/0xd8 mm/kasan/report.c:436
 snd_usbmidi_get_ms_info+0xeaf/0x10e0 sound/usb/midi.c:1982
 __snd_usbmidi_create+0x393/0x1ba0 sound/usb/midi.c:2485
 snd_usb_create_quirk+0xa5/0xe0 sound/usb/quirks.c:604
 usb_audio_probe+0xcf0/0x2c90 sound/usb/card.c:796
 usb_probe_interface+0x315/0x7f0 drivers/usb/core/driver.c:396
 really_probe+0x291/0xf60 drivers/base/dd.c:576
 driver_probe_device+0x298/0x410 drivers/base/dd.c:763
 __device_attach_driver+0x203/0x2c0 drivers/base/dd.c:870
 bus_for_each_drv+0x15f/0x1e0 drivers/base/bus.c:431
 __device_attach+0x228/0x4b0 drivers/base/dd.c:938
 bus_probe_device+0x1e4/0x290 drivers/base/bus.c:491
 device_add+0xbe0/0x2100 drivers/base/core.c:3319
 usb_set_configuration+0x113f/0x1910 drivers/usb/core/message.c:2164
 usb_generic_driver_probe+0xba/0x100 drivers/usb/core/generic.c:238
 usb_probe_device+0xd9/0x2c0 drivers/usb/core/driver.c:293
 really_probe+0x291/0xf60 drivers/base/dd.c:576
 driver_probe_device+0x298/0x410 drivers/base/dd.c:763
 __device_attach_driver+0x203/0x2c0 drivers/base/dd.c:870
 bus_for_each_drv+0x15f/0x1e0 drivers/base/bus.c:431
 __device_attach+0x228/0x4b0 drivers/base/dd.c:938
 bus_probe_device+0x1e4/0x290 drivers/base/bus.c:491
 device_add+0xbe0/0x2100 drivers/base/core.c:3319
 usb_new_device.cold+0x721/0x1058 drivers/usb/core/hub.c:2556
 hub_port_connect drivers/usb/core/hub.c:5276 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5416 [inline]
 port_event drivers/usb/core/hub.c:5562 [inline]
 hub_event+0x2357/0x4330 drivers/usb/core/hub.c:5644
 process_one_work+0x98d/0x1580 kernel/workqueue.c:2275
 worker_thread+0x64c/0x1120 kernel/workqueue.c:2421
 kthread+0x38c/0x460 kernel/kthread.c:313
 ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:294

Allocated by task 7:
 kasan_save_stack+0x1b/0x40 mm/kasan/common.c:38
 kasan_set_track mm/kasan/common.c:46 [inline]
 set_alloc_info mm/kasan/common.c:428 [inline]
 ____kasan_kmalloc mm/kasan/common.c:507 [inline]
 __kasan_kmalloc+0x7c/0x90 mm/kasan/common.c:516
 kmalloc include/linux/slab.h:561 [inline]
 usb_get_configuration+0x321/0x3d60 drivers/usb/core/config.c:919
 usb_enumerate_device drivers/usb/core/hub.c:2389 [inline]
 usb_new_device+0x42c/0x7a0 drivers/usb/core/hub.c:2525
 hub_port_connect drivers/usb/core/hub.c:5276 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5416 [inline]
 port_event drivers/usb/core/hub.c:5562 [inline]
 hub_event+0x2357/0x4330 drivers/usb/core/hub.c:5644
 process_one_work+0x98d/0x1580 kernel/workqueue.c:2275
 worker_thread+0x64c/0x1120 kernel/workqueue.c:2421
 kthread+0x38c/0x460 kernel/kthread.c:313
 ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:294

The buggy address belongs to the object at ffff888119b80700
 which belongs to the cache kmalloc-64 of size 64
The buggy address is located 34 bytes inside of
 64-byte region [ffff888119b80700, ffff888119b80740)
The buggy address belongs to the page:
page:ffffea000466e000 refcount:1 mapcount:0 mapping:0000000000000000 index:0xffff888119b80680 pfn:0x119b80
flags: 0x200000000000200(slab|node=0|zone=2)
raw: 0200000000000200 ffffea0004206f00 0000000900000009 ffff888100041640
raw: ffff888119b80680 000000008020001d 00000001ffffffff 0000000000000000
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 0, migratetype Unmovable, gfp_mask 0x12cc0(GFP_KERNEL|__GFP_NOWARN|__GFP_NORETRY), pid 2653, ts 10410979522, free_ts 0
 prep_new_page mm/page_alloc.c:2358 [inline]
 get_page_from_freelist+0xc97/0x26a0 mm/page_alloc.c:3994
 __alloc_pages+0x1b2/0x4f0 mm/page_alloc.c:5200
 alloc_pages+0x18c/0x2a0 mm/mempolicy.c:2272
 alloc_slab_page mm/slub.c:1644 [inline]
 allocate_slab+0x2c5/0x4c0 mm/slub.c:1784
 new_slab mm/slub.c:1847 [inline]
 new_slab_objects mm/slub.c:2593 [inline]
 ___slab_alloc+0x476/0x7b0 mm/slub.c:2756
 __slab_alloc+0x68/0x80 mm/slub.c:2796
 slab_alloc_node mm/slub.c:2878 [inline]
 slab_alloc mm/slub.c:2920 [inline]
 kmem_cache_alloc_trace+0x27e/0x2a0 mm/slub.c:2937
 kmalloc include/linux/slab.h:556 [inline]
 kzalloc include/linux/slab.h:686 [inline]
 allocate_cgrp_cset_links+0x19c/0x240 kernel/cgroup/cgroup.c:1119
 find_css_set+0x6d3/0x1a40 kernel/cgroup/cgroup.c:1197
 cgroup_migrate_prepare_dst+0x105/0x830 kernel/cgroup/cgroup.c:2641
 cgroup_attach_task+0x39f/0x760 kernel/cgroup/cgroup.c:2747
 __cgroup1_procs_write.constprop.0+0x3a9/0x490 kernel/cgroup/cgroup-v1.c:519
 cgroup_file_write+0x1ec/0x780 kernel/cgroup/cgroup.c:3711
 kernfs_fop_write_iter+0x342/0x500 fs/kernfs/file.c:296
 call_write_iter include/linux/fs.h:2114 [inline]
 new_sync_write+0x426/0x650 fs/read_write.c:518
 vfs_write+0x743/0x9e0 fs/read_write.c:605
page_owner free stack trace missing

Memory state around the buggy address:
 ffff888119b80600: fa fb fb fb fb fb fb fb fc fc fc fc fc fc fc fc
 ffff888119b80680: fb fb fb fb fb fb fb fb fc fc fc fc fc fc fc fc
>ffff888119b80700: 00 00 00 00 02 fc fc fc fc fc fc fc fc fc fc fc
                               ^
 ffff888119b80780: fa fb fb fb fb fb fb fb fc fc fc fc fc fc fc fc
 ffff888119b80800: fa fb fb fb fb fb fb fb fc fc fc fc fc fc fc fc
==================================================================


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
syzbot can test patches for this issue, for details see:
https://goo.gl/tpsmEJ#testing-patches
