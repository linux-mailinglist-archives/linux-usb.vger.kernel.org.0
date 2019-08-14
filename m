Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2915E8D4E1
	for <lists+linux-usb@lfdr.de>; Wed, 14 Aug 2019 15:38:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727083AbfHNNiC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 14 Aug 2019 09:38:02 -0400
Received: from mail-ot1-f70.google.com ([209.85.210.70]:41108 "EHLO
        mail-ot1-f70.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726263AbfHNNiC (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 14 Aug 2019 09:38:02 -0400
Received: by mail-ot1-f70.google.com with SMTP id x1so1885927oto.8
        for <linux-usb@vger.kernel.org>; Wed, 14 Aug 2019 06:38:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=5KFSpTNEnWIsYjCsFvEkxZBXKFK565cP3qQxOf2je1Q=;
        b=rknxRSw4LnrmMvXoRPnQh9zVahfz+n6euFFVVXR9DC4rPO0ahmxkicG+pxuapZoYSn
         ykkAYMNg+nX8UnkHSVk3b2hRdexnJsjVe/TcJOxAiTJzIyAnHTL81nbyFC9JmfXXRLVN
         OzsAVhp4XDGQNXphS8a7H3uSKi+865578OXgrzOk7uX+c8grPFtyM1Kyd5ItWlv/cQZg
         sDDMwLTLVJPDi7pxLRe3pu+d1YAcHtbZn8+CWNCezDyf2Jysyggf7E8b67W+zgyZEvL5
         pBDE65FgdilmZsaW+E0E3JJa6qMC1KKLGprTEveih+gv7ykMnQ/KBfwM21vT2GFs6uWd
         Kp9g==
X-Gm-Message-State: APjAAAXQj5uxY7LUFvLcgs51ZKmPiPXfnnUPlQ7SrUdfM1pNAivjg0bJ
        6A6U1dE/CoIinfXtRbQRw5fDVk0o5w9XTXWoyDFTl/bvAI8p
X-Google-Smtp-Source: APXvYqyIAk0DIeooLvbGS9BdYlgSqGLOOJF7D83nPgiYfieZmmNVIAxKMDNWI7N9ltRZ7Lyi2xGf4Nio07TAqdPHpeivwXq8qXoR
MIME-Version: 1.0
X-Received: by 2002:a05:6638:35a:: with SMTP id x26mr3569970jap.104.1565789880944;
 Wed, 14 Aug 2019 06:38:00 -0700 (PDT)
Date:   Wed, 14 Aug 2019 06:38:00 -0700
In-Reply-To: <1565789116.5780.1.camel@suse.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000a59094059013dd63@google.com>
Subject: Re: divide error in usbtmc_generic_read
From:   syzbot <syzbot+55b0304b360654a7537b@syzkaller.appspotmail.com>
To:     andreyknvl@google.com, gregkh@linuxfoundation.org,
        guido.kiener@rohde-schwarz.com, linux-usb@vger.kernel.org,
        oneukum@suse.com, steve_bayless@keysight.com,
        syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,

syzbot has tested the proposed patch but the reproducer still triggered  
crash:
KASAN: use-after-free Read in usbtmc_disconnect

usb 5-1: USB disconnect, device number 2
==================================================================
BUG: KASAN: use-after-free in __mutex_lock_common  
kernel/locking/mutex.c:912 [inline]
BUG: KASAN: use-after-free in __mutex_lock+0xf23/0x1360  
kernel/locking/mutex.c:1077
Read of size 8 at addr ffff8881d63299c8 by task kworker/1:0/17

CPU: 1 PID: 17 Comm: kworker/1:0 Not tainted 5.3.0-rc4+ #1
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS  
Google 01/01/2011
Workqueue: usb_hub_wq hub_event
Call Trace:
  __dump_stack lib/dump_stack.c:77 [inline]
  dump_stack+0xca/0x13e lib/dump_stack.c:113
  print_address_description+0x6a/0x32c mm/kasan/report.c:351
  __kasan_report.cold+0x1a/0x33 mm/kasan/report.c:482
  kasan_report+0xe/0x12 mm/kasan/common.c:612
  __mutex_lock_common kernel/locking/mutex.c:912 [inline]
  __mutex_lock+0xf23/0x1360 kernel/locking/mutex.c:1077
  usbtmc_disconnect+0x58/0x180 drivers/usb/class/usbtmc.c:2443
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

Allocated by task 1737:
  save_stack+0x1b/0x80 mm/kasan/common.c:69
  set_track mm/kasan/common.c:77 [inline]
  __kasan_kmalloc mm/kasan/common.c:487 [inline]
  __kasan_kmalloc.constprop.0+0xbf/0xd0 mm/kasan/common.c:460
  kmalloc include/linux/slab.h:552 [inline]
  kzalloc include/linux/slab.h:748 [inline]
  usbtmc_probe+0xad/0x1360 drivers/usb/class/usbtmc.c:2328
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

Freed by task 1737:
  save_stack+0x1b/0x80 mm/kasan/common.c:69
  set_track mm/kasan/common.c:77 [inline]
  __kasan_slab_free+0x130/0x180 mm/kasan/common.c:449
  slab_free_hook mm/slub.c:1423 [inline]
  slab_free_freelist_hook mm/slub.c:1474 [inline]
  slab_free mm/slub.c:3016 [inline]
  kfree+0xe4/0x2f0 mm/slub.c:3957
  kref_put include/linux/kref.h:65 [inline]
  usbtmc_probe+0x55c/0x1360 drivers/usb/class/usbtmc.c:2433
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

The buggy address belongs to the object at ffff8881d6329900
  which belongs to the cache kmalloc-512 of size 512
The buggy address is located 200 bytes inside of
  512-byte region [ffff8881d6329900, ffff8881d6329b00)
The buggy address belongs to the page:
page:ffffea000758ca00 refcount:1 mapcount:0 mapping:ffff8881da002500  
index:0x0 compound_mapcount: 0
flags: 0x200000000010200(slab|head)
raw: 0200000000010200 ffffea0007585680 0000000700000007 ffff8881da002500
raw: 0000000000000000 00000000000c000c 00000001ffffffff 0000000000000000
page dumped because: kasan: bad access detected

Memory state around the buggy address:
  ffff8881d6329880: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
  ffff8881d6329900: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
> ffff8881d6329980: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                                               ^
  ffff8881d6329a00: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
  ffff8881d6329a80: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
==================================================================


Tested on:

commit:         d0847550 usb-fuzzer: main usb gadget fuzzer driver
git tree:       https://github.com/google/kasan.git
console output: https://syzkaller.appspot.com/x/log.txt?x=10ac29ee600000
kernel config:  https://syzkaller.appspot.com/x/.config?x=dbc9c80cc095da19
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
patch:          https://syzkaller.appspot.com/x/patch.diff?x=11f3b2e2600000

