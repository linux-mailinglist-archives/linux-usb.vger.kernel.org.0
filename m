Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 20D0D89DEA
	for <lists+linux-usb@lfdr.de>; Mon, 12 Aug 2019 14:18:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728535AbfHLMSQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 12 Aug 2019 08:18:16 -0400
Received: from mail-ot1-f70.google.com ([209.85.210.70]:54105 "EHLO
        mail-ot1-f70.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728389AbfHLMSJ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 12 Aug 2019 08:18:09 -0400
Received: by mail-ot1-f70.google.com with SMTP id q16so8360660ota.20
        for <linux-usb@vger.kernel.org>; Mon, 12 Aug 2019 05:18:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=mVzn4ykZa4whD4Bssk0VrUMsymZGXpU9cTy6k6n/Cx0=;
        b=S9J40cYi4KUSy6BFfyogZBw/+RbEmtN0Rkevn4vlQjUL2upezROWS/RjL7qTQ2qVqw
         KD5bsgodxbATzd6C/BwZrb11iSkLXKTAQfi63F7DWorfCMQ2h5qm0mIW8R9kM3048KsU
         0kmwQ5rs56JUNScwZdhv6GMJb0VADzn7+Vrg60wcz94HCxkvO0DiRZI7dBRHE0U62CtR
         VTz8oRt+YPennRWVH/+OOXQqHFXbDh2saId726hqSrHdzv0xcKgBWVYoim3J5hBmbaUn
         if4P8jZ3lnauEji8dm9rdlCMbGbnNLL30W5zy4RhKS0HkcNlQDXEMD5rEWJSz3WNVpRR
         lBCQ==
X-Gm-Message-State: APjAAAU/0QGEeM2MU2fTwm9oxHHx+hgO6qgmVIvZaJfZLNKBlZL3z46V
        2yzRCQ8uQY1wjqs0ARxXqzB3qqGC2anye6hAYYM6MP+4Y9mX
X-Google-Smtp-Source: APXvYqyHaVj+7ZJlDk4mz+QHlUf895VQQAz8jsKiXp3N3rD6/rgBbooGRn/cwEgflK+5SgtMJrcKrkwkB46LZnL5UECB15GKmkYp
MIME-Version: 1.0
X-Received: by 2002:a02:22c6:: with SMTP id o189mr36896194jao.35.1565612288012;
 Mon, 12 Aug 2019 05:18:08 -0700 (PDT)
Date:   Mon, 12 Aug 2019 05:18:08 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000487b44058fea845c@google.com>
Subject: KASAN: slab-out-of-bounds Read in usbnet_generic_cdc_bind
From:   syzbot <syzbot+45a53506b65321c1fe91@syzkaller.appspotmail.com>
To:     andreyknvl@google.com, davem@davemloft.net,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        netdev@vger.kernel.org, oliver@neukum.org,
        syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,

syzbot found the following crash on:

HEAD commit:    e96407b4 usb-fuzzer: main usb gadget fuzzer driver
git tree:       https://github.com/google/kasan.git usb-fuzzer
console output: https://syzkaller.appspot.com/x/log.txt?x=1390791c600000
kernel config:  https://syzkaller.appspot.com/x/.config?x=cfa2c18fb6a8068e
dashboard link: https://syzkaller.appspot.com/bug?extid=45a53506b65321c1fe91
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=12c78cd2600000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1395b40e600000

IMPORTANT: if you fix the bug, please add the following tag to the commit:
Reported-by: syzbot+45a53506b65321c1fe91@syzkaller.appspotmail.com

usb 1-1: config 1 interface 0 altsetting 0 has 0 endpoint descriptors,  
different from the interface descriptor's value: 18
usb 1-1: New USB device found, idVendor=0525, idProduct=a4a1, bcdDevice=  
0.40
usb 1-1: New USB device strings: Mfr=6, Product=0, SerialNumber=0
==================================================================
BUG: KASAN: slab-out-of-bounds in memcmp+0xa6/0xb0 lib/string.c:904
Read of size 1 at addr ffff8881d4262f3b by task kworker/1:2/83

CPU: 1 PID: 83 Comm: kworker/1:2 Not tainted 5.3.0-rc2+ #25
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS  
Google 01/01/2011
Workqueue: usb_hub_wq hub_event
Call Trace:
  __dump_stack lib/dump_stack.c:77 [inline]
  dump_stack+0xca/0x13e lib/dump_stack.c:113
  print_address_description+0x6a/0x32c mm/kasan/report.c:351
  __kasan_report.cold+0x1a/0x33 mm/kasan/report.c:482
  kasan_report+0xe/0x12 mm/kasan/common.c:612
  memcmp+0xa6/0xb0 lib/string.c:904
  memcmp include/linux/string.h:400 [inline]
  usbnet_generic_cdc_bind+0x71b/0x17c0 drivers/net/usb/cdc_ether.c:225
  usbnet_ether_cdc_bind drivers/net/usb/cdc_ether.c:322 [inline]
  usbnet_cdc_bind+0x20/0x1a0 drivers/net/usb/cdc_ether.c:430
  usbnet_probe+0xb43/0x23d0 drivers/net/usb/usbnet.c:1722
  usb_probe_interface+0x305/0x7a0 drivers/usb/core/driver.c:361
  really_probe+0x281/0x650 drivers/base/dd.c:548
  driver_probe_device+0x101/0x1b0 drivers/base/dd.c:709
  __device_attach_driver+0x1c2/0x220 drivers/base/dd.c:816
  bus_for_each_drv+0x15c/0x1e0 drivers/base/bus.c:454
  __device_attach+0x217/0x360 drivers/base/dd.c:882
  bus_probe_device+0x1e4/0x290 drivers/base/bus.c:514
  device_add+0xae6/0x16f0 drivers/base/core.c:2114
  usb_set_configuration+0xdf6/0x1670 drivers/usb/core/message.c:2023
  generic_probe+0x9d/0xd5 drivers/usb/core/generic.c:210
  usb_probe_device+0x99/0x100 drivers/usb/core/driver.c:266
  really_probe+0x281/0x650 drivers/base/dd.c:548
  driver_probe_device+0x101/0x1b0 drivers/base/dd.c:709
  __device_attach_driver+0x1c2/0x220 drivers/base/dd.c:816
  bus_for_each_drv+0x15c/0x1e0 drivers/base/bus.c:454
  __device_attach+0x217/0x360 drivers/base/dd.c:882
  bus_probe_device+0x1e4/0x290 drivers/base/bus.c:514
  device_add+0xae6/0x16f0 drivers/base/core.c:2114
  usb_new_device.cold+0x6a4/0xe79 drivers/usb/core/hub.c:2536
  hub_port_connect drivers/usb/core/hub.c:5098 [inline]
  hub_port_connect_change drivers/usb/core/hub.c:5213 [inline]
  port_event drivers/usb/core/hub.c:5359 [inline]
  hub_event+0x1b5c/0x3640 drivers/usb/core/hub.c:5441
  process_one_work+0x92b/0x1530 kernel/workqueue.c:2269
  worker_thread+0x96/0xe20 kernel/workqueue.c:2415
  kthread+0x318/0x420 kernel/kthread.c:255
  ret_from_fork+0x24/0x30 arch/x86/entry/entry_64.S:352

Allocated by task 83:
  save_stack+0x1b/0x80 mm/kasan/common.c:69
  set_track mm/kasan/common.c:77 [inline]
  __kasan_kmalloc mm/kasan/common.c:487 [inline]
  __kasan_kmalloc.constprop.0+0xbf/0xd0 mm/kasan/common.c:460
  kmalloc include/linux/slab.h:557 [inline]
  usb_get_configuration+0x30c/0x3070 drivers/usb/core/config.c:857
  usb_enumerate_device drivers/usb/core/hub.c:2369 [inline]
  usb_new_device+0xd3/0x160 drivers/usb/core/hub.c:2505
  hub_port_connect drivers/usb/core/hub.c:5098 [inline]
  hub_port_connect_change drivers/usb/core/hub.c:5213 [inline]
  port_event drivers/usb/core/hub.c:5359 [inline]
  hub_event+0x1b5c/0x3640 drivers/usb/core/hub.c:5441
  process_one_work+0x92b/0x1530 kernel/workqueue.c:2269
  worker_thread+0x96/0xe20 kernel/workqueue.c:2415
  kthread+0x318/0x420 kernel/kthread.c:255
  ret_from_fork+0x24/0x30 arch/x86/entry/entry_64.S:352

Freed by task 269:
  save_stack+0x1b/0x80 mm/kasan/common.c:69
  set_track mm/kasan/common.c:77 [inline]
  __kasan_slab_free+0x130/0x180 mm/kasan/common.c:449
  slab_free_hook mm/slub.c:1423 [inline]
  slab_free_freelist_hook mm/slub.c:1470 [inline]
  slab_free mm/slub.c:3012 [inline]
  kfree+0xe4/0x2f0 mm/slub.c:3953
  kobject_uevent_env+0x294/0x1160 lib/kobject_uevent.c:624
  kobject_synth_uevent+0x70a/0x81e lib/kobject_uevent.c:208
  uevent_store+0x20/0x50 drivers/base/core.c:1244
  dev_attr_store+0x50/0x80 drivers/base/core.c:947
  sysfs_kf_write+0x110/0x160 fs/sysfs/file.c:138
  kernfs_fop_write+0x2b0/0x470 fs/kernfs/file.c:315
  __vfs_write+0x76/0x100 fs/read_write.c:494
  vfs_write+0x262/0x5c0 fs/read_write.c:558
  ksys_write+0x127/0x250 fs/read_write.c:611
  do_syscall_64+0xb7/0x580 arch/x86/entry/common.c:296
  entry_SYSCALL_64_after_hwframe+0x49/0xbe

The buggy address belongs to the object at ffff8881d4262f00
  which belongs to the cache kmalloc-64 of size 64
The buggy address is located 59 bytes inside of
  64-byte region [ffff8881d4262f00, ffff8881d4262f40)
The buggy address belongs to the page:
page:ffffea0007509880 refcount:1 mapcount:0 mapping:ffff8881da003180  
index:0x0
flags: 0x200000000000200(slab)
raw: 0200000000000200 ffffea00074d1f00 0000001800000018 ffff8881da003180
raw: 0000000000000000 00000000802a002a 00000001ffffffff 0000000000000000
page dumped because: kasan: bad access detected

Memory state around the buggy address:
  ffff8881d4262e00: fb fb fb fb fc fc fc fc 00 00 00 00 00 00 fc fc
  ffff8881d4262e80: fc fc fc fc fb fb fb fb fb fb fb fb fc fc fc fc
> ffff8881d4262f00: 00 00 00 00 00 00 00 03 fc fc fc fc fb fb fb fb
                                         ^
  ffff8881d4262f80: fb fb fb fb fc fc fc fc fc fc fc fc fc fc fc fc
  ffff8881d4263000: fb fb fb fb fb fb fb fb fb fb fc fc fc fc fb fb
==================================================================


---
This bug is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this bug report. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
syzbot can test patches for this bug, for details see:
https://goo.gl/tpsmEJ#testing-patches
