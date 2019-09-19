Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6BA66B80AC
	for <lists+linux-usb@lfdr.de>; Thu, 19 Sep 2019 20:19:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732832AbfISSTQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 19 Sep 2019 14:19:16 -0400
Received: from mail-io1-f71.google.com ([209.85.166.71]:43736 "EHLO
        mail-io1-f71.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732803AbfISSTJ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 19 Sep 2019 14:19:09 -0400
Received: by mail-io1-f71.google.com with SMTP id o6so6414514ioh.10
        for <linux-usb@vger.kernel.org>; Thu, 19 Sep 2019 11:19:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=+yQcYxMZb17XiDJGbYIKSLSyMdYykh3q5+keWRn0RrY=;
        b=VHqr/HUv4NXKXVOJ8dUvH2m6vRI5Myb1Cj1EV+aY60/QOCgHpr92VXrkNaNuIPAY0n
         P6GZl4uy8jqG1WAXJpIont/okTi/VGIkY7DSa9iQC70TW/OUQ2XEzz2BAtRGCbzkYk4S
         pOFY1XRwfQ9u8iT25KYpfHqoza3DNR+fawaanWzcmI3Fe6fWjI8o+GSsh9sCk9BTJlTl
         NqQmfCoxlOjjs7CCpPXA56fRGqJYixXAAH9VQOlm2cQMa9CWK2Esb5sXVcTIOivAgWGq
         UnXahVcVC1b4PPBnSfCMPM3SN2lpoYhVRplIbJ5DOiTJyD+TtIaQWi13NNqI3i3AKanH
         T22w==
X-Gm-Message-State: APjAAAWOUxgrnj9GW1cl/p7EuMPA6XtYEgoyNh6WK/QzD+bXUe3tnKhq
        2ibgNzc0j636idxQ3iI0UKvExpB6O/uEBz8W4At0+CssyrjO
X-Google-Smtp-Source: APXvYqw+8wxb9eWxhabhAShuL5SBODaxBsq2pCTNE4luKrAt9NicK/F7tNLq3nidWgXv/TXsLrjIp8vQp2lfBHuk1MYfD+HirEWc
MIME-Version: 1.0
X-Received: by 2002:a5d:91da:: with SMTP id k26mr3484058ior.90.1568917147565;
 Thu, 19 Sep 2019 11:19:07 -0700 (PDT)
Date:   Thu, 19 Sep 2019 11:19:07 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000004349550592ebfd2d@google.com>
Subject: KASAN: invalid-free in disconnect_rio (2)
From:   syzbot <syzbot+745b0dff8028f9488eba@syzkaller.appspotmail.com>
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

HEAD commit:    e0bd8d79 usb-fuzzer: main usb gadget fuzzer driver
git tree:       https://github.com/google/kasan.git usb-fuzzer
console output: https://syzkaller.appspot.com/x/log.txt?x=17d6f31d600000
kernel config:  https://syzkaller.appspot.com/x/.config?x=8847e5384a16f66a
dashboard link: https://syzkaller.appspot.com/bug?extid=745b0dff8028f9488eba
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1009f769600000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=15b1d4b1600000

IMPORTANT: if you fix the bug, please add the following tag to the commit:
Reported-by: syzbot+745b0dff8028f9488eba@syzkaller.appspotmail.com

usb 5-1: New USB device found, idVendor=0841, idProduct=0001,  
bcdDevice=c5.d0
usb 5-1: New USB device strings: Mfr=0, Product=0, SerialNumber=0
usb 5-1: config 0 descriptor??
rio500 5-1:0.133: Second USB Rio at address 2 refused
rio500: probe of 5-1:0.133 failed with error -16
usb 3-1: USB disconnect, device number 2
==================================================================
BUG: KASAN: double-free or invalid-free in disconnect_rio+0x12b/0x1b0  
drivers/usb/misc/rio500.c:525

CPU: 0 PID: 102 Comm: kworker/0:2 Not tainted 5.3.0+ #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS  
Google 01/01/2011
Workqueue: usb_hub_wq hub_event
Call Trace:
  __dump_stack lib/dump_stack.c:77 [inline]
  dump_stack+0xca/0x13e lib/dump_stack.c:113
  print_address_description+0x6a/0x32c mm/kasan/report.c:351
  kasan_report_invalid_free+0x61/0xa0 mm/kasan/report.c:444
  __kasan_slab_free+0x162/0x180 mm/kasan/common.c:434
  slab_free_hook mm/slub.c:1423 [inline]
  slab_free_freelist_hook mm/slub.c:1474 [inline]
  slab_free mm/slub.c:3016 [inline]
  kfree+0xe4/0x2f0 mm/slub.c:3957
  disconnect_rio+0x12b/0x1b0 drivers/usb/misc/rio500.c:525
  usb_unbind_interface+0x1bd/0x8a0 drivers/usb/core/driver.c:423
  __device_release_driver drivers/base/dd.c:1134 [inline]
  device_release_driver_internal+0x42f/0x500 drivers/base/dd.c:1165
  bus_remove_device+0x2dc/0x4a0 drivers/base/bus.c:532
  device_del+0x420/0xb10 drivers/base/core.c:2375
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

Allocated by task 17:
  save_stack+0x1b/0x80 mm/kasan/common.c:69
  set_track mm/kasan/common.c:77 [inline]
  __kasan_kmalloc mm/kasan/common.c:493 [inline]
  __kasan_kmalloc.constprop.0+0xbf/0xd0 mm/kasan/common.c:466
  kmalloc include/linux/slab.h:552 [inline]
  probe_rio+0x135/0x248 drivers/usb/misc/rio500.c:474
  usb_probe_interface+0x305/0x7a0 drivers/usb/core/driver.c:361
  really_probe+0x281/0x6d0 drivers/base/dd.c:548
  driver_probe_device+0x101/0x1b0 drivers/base/dd.c:721
  __device_attach_driver+0x1c2/0x220 drivers/base/dd.c:828
  bus_for_each_drv+0x162/0x1e0 drivers/base/bus.c:430
  __device_attach+0x217/0x360 drivers/base/dd.c:894
  bus_probe_device+0x1e4/0x290 drivers/base/bus.c:490
  device_add+0xae6/0x16f0 drivers/base/core.c:2201
  usb_set_configuration+0xdf6/0x1670 drivers/usb/core/message.c:2023
  generic_probe+0x9d/0xd5 drivers/usb/core/generic.c:210
  usb_probe_device+0x99/0x100 drivers/usb/core/driver.c:266
  really_probe+0x281/0x6d0 drivers/base/dd.c:548
  driver_probe_device+0x101/0x1b0 drivers/base/dd.c:721
  __device_attach_driver+0x1c2/0x220 drivers/base/dd.c:828
  bus_for_each_drv+0x162/0x1e0 drivers/base/bus.c:430
  __device_attach+0x217/0x360 drivers/base/dd.c:894
  bus_probe_device+0x1e4/0x290 drivers/base/bus.c:490
  device_add+0xae6/0x16f0 drivers/base/core.c:2201
  usb_new_device.cold+0x6a4/0xe79 drivers/usb/core/hub.c:2536
  hub_port_connect drivers/usb/core/hub.c:5098 [inline]
  hub_port_connect_change drivers/usb/core/hub.c:5213 [inline]
  port_event drivers/usb/core/hub.c:5359 [inline]
  hub_event+0x1b5c/0x3640 drivers/usb/core/hub.c:5441
  process_one_work+0x92b/0x1530 kernel/workqueue.c:2269
  worker_thread+0x96/0xe20 kernel/workqueue.c:2415
  kthread+0x318/0x420 kernel/kthread.c:255
  ret_from_fork+0x24/0x30 arch/x86/entry/entry_64.S:352

Freed by task 83:
  save_stack+0x1b/0x80 mm/kasan/common.c:69
  set_track mm/kasan/common.c:77 [inline]
  __kasan_slab_free+0x130/0x180 mm/kasan/common.c:455
  slab_free_hook mm/slub.c:1423 [inline]
  slab_free_freelist_hook mm/slub.c:1474 [inline]
  slab_free mm/slub.c:3016 [inline]
  kfree+0xe4/0x2f0 mm/slub.c:3957
  disconnect_rio+0x12b/0x1b0 drivers/usb/misc/rio500.c:525
  usb_unbind_interface+0x1bd/0x8a0 drivers/usb/core/driver.c:423
  __device_release_driver drivers/base/dd.c:1134 [inline]
  device_release_driver_internal+0x42f/0x500 drivers/base/dd.c:1165
  bus_remove_device+0x2dc/0x4a0 drivers/base/bus.c:532
  device_del+0x420/0xb10 drivers/base/core.c:2375
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

The buggy address belongs to the object at ffff8881d5498000
  which belongs to the cache kmalloc-4k of size 4096
The buggy address is located 0 bytes inside of
  4096-byte region [ffff8881d5498000, ffff8881d5499000)
The buggy address belongs to the page:
page:ffffea0007552600 refcount:1 mapcount:0 mapping:ffff8881da00c280  
index:0x0 compound_mapcount: 0
flags: 0x200000000010200(slab|head)
raw: 0200000000010200 dead000000000100 dead000000000122 ffff8881da00c280
raw: 0000000000000000 0000000000070007 00000001ffffffff 0000000000000000
page dumped because: kasan: bad access detected

Memory state around the buggy address:
  ffff8881d5497f00: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
  ffff8881d5497f80: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> ffff8881d5498000: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                    ^
  ffff8881d5498080: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
  ffff8881d5498100: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
==================================================================


---
This bug is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this bug report. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
syzbot can test patches for this bug, for details see:
https://goo.gl/tpsmEJ#testing-patches
