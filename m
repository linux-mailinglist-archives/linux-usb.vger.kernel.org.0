Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E0AC771A4E
	for <lists+linux-usb@lfdr.de>; Tue, 23 Jul 2019 16:28:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730443AbfGWO2H (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 23 Jul 2019 10:28:07 -0400
Received: from mail-io1-f72.google.com ([209.85.166.72]:41739 "EHLO
        mail-io1-f72.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730042AbfGWO2H (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 23 Jul 2019 10:28:07 -0400
Received: by mail-io1-f72.google.com with SMTP id x17so47092345iog.8
        for <linux-usb@vger.kernel.org>; Tue, 23 Jul 2019 07:28:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=AR4zTYvQeVfAhq4U2KA1mN5jhPoKW9w2rYjRb5Rt5j8=;
        b=m1bWtg9kdBA7HgYqKA9iXgfGo1rw1FxInRbH8+klQaC+yNzYFBqnebUGwkk5V+b0Yl
         L2/ywgzs+VOraHeihZyKR/yLRo5MwZg261SzvFmF58cwR/uX6UNxV+kH92AGl430P61s
         WzUfN04mvcn+bujL73ILAFtKh8CAkWSmUtKjeBruJJtOl8DiNR23A9O4EmCZMWEX3UGS
         Su+xwLC5W7OB0iCqbaLaXgYOppQQqDU7jJodtO/It8SXIxciT9umgAp1fqz6BjtbC6Cx
         BZEwMpWFCcjckyVdgQ18XwJa1IWfj8M9/EeEAlbBcJMxK0rPm/K/UFBRQdmxEvZ4Dtj5
         w81A==
X-Gm-Message-State: APjAAAUhX/t2TmZaHry8vkY4FlLXopqG1qq56S3Vi4pfAIzWmyTexu9u
        PAF9b2dm0lvPbB8i1EUA4ECOPDGrsIYTRxp4v6Heb85Geo3K
X-Google-Smtp-Source: APXvYqx1bQF+VOIdm/1XnTXNxOLj1FgesgFpIozENAfzhx4UTPwc2/ucG7Wss/IVZH0x3DDuppGfUPXXNbOZmPeuK0AQybXlKJ6W
MIME-Version: 1.0
X-Received: by 2002:a6b:fb10:: with SMTP id h16mr61091747iog.195.1563892086263;
 Tue, 23 Jul 2019 07:28:06 -0700 (PDT)
Date:   Tue, 23 Jul 2019 07:28:06 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000044d8d0058e5a00da@google.com>
Subject: KASAN: use-after-free Read in device_release_driver_internal
From:   syzbot <syzbot+1b2449b7b5dc240d107a@syzkaller.appspotmail.com>
To:     andreyknvl@google.com, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,

syzbot found the following crash on:

HEAD commit:    6a3599ce usb-fuzzer: main usb gadget fuzzer driver
git tree:       https://github.com/google/kasan.git usb-fuzzer
console output: https://syzkaller.appspot.com/x/log.txt?x=13f640cc600000
kernel config:  https://syzkaller.appspot.com/x/.config?x=700ca426ab83faae
dashboard link: https://syzkaller.appspot.com/bug?extid=1b2449b7b5dc240d107a
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=116ce31fa00000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1022f694600000

IMPORTANT: if you fix the bug, please add the following tag to the commit:
Reported-by: syzbot+1b2449b7b5dc240d107a@syzkaller.appspotmail.com

usb 1-1: USB disconnect, device number 2
==================================================================
BUG: KASAN: use-after-free in __lock_acquire+0x3a5d/0x5340  
/kernel/locking/lockdep.c:3665
Read of size 8 at addr ffff8881cfc4ef90 by task kworker/0:2/108

CPU: 0 PID: 108 Comm: kworker/0:2 Not tainted 5.2.0-rc6+ #15
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS  
Google 01/01/2011
Workqueue: usb_hub_wq hub_event
Call Trace:
  __dump_stack /lib/dump_stack.c:77 [inline]
  dump_stack+0xca/0x13e /lib/dump_stack.c:113
  print_address_description+0x67/0x231 /mm/kasan/report.c:188
  __kasan_report.cold+0x1a/0x32 /mm/kasan/report.c:317
  kasan_report+0xe/0x20 /mm/kasan/common.c:614
  __lock_acquire+0x3a5d/0x5340 /kernel/locking/lockdep.c:3665
  lock_acquire+0x100/0x2b0 /kernel/locking/lockdep.c:4303
  __mutex_lock_common /kernel/locking/mutex.c:926 [inline]
  __mutex_lock+0xf9/0x12b0 /kernel/locking/mutex.c:1073
  device_release_driver_internal+0x23/0x4c0 /drivers/base/dd.c:1109
  bus_remove_device+0x2dc/0x4a0 /drivers/base/bus.c:556
  device_del+0x460/0xb80 /drivers/base/core.c:2274
  usb_disable_device+0x211/0x690 /drivers/usb/core/message.c:1237
  usb_disconnect+0x284/0x830 /drivers/usb/core/hub.c:2199
  hub_port_connect /drivers/usb/core/hub.c:4949 [inline]
  hub_port_connect_change /drivers/usb/core/hub.c:5213 [inline]
  port_event /drivers/usb/core/hub.c:5359 [inline]
  hub_event+0x13bd/0x3550 /drivers/usb/core/hub.c:5441
  process_one_work+0x905/0x1570 /kernel/workqueue.c:2269
  worker_thread+0x96/0xe20 /kernel/workqueue.c:2415
  kthread+0x30b/0x410 /kernel/kthread.c:255
  ret_from_fork+0x24/0x30 /arch/x86/entry/entry_64.S:352

Allocated by task 88:
  save_stack+0x1b/0x80 /mm/kasan/common.c:71
  set_track /mm/kasan/common.c:79 [inline]
  __kasan_kmalloc /mm/kasan/common.c:489 [inline]
  __kasan_kmalloc.constprop.0+0xbf/0xd0 /mm/kasan/common.c:462
  kmalloc /./include/linux/slab.h:547 [inline]
  kzalloc /./include/linux/slab.h:742 [inline]
  usb_set_configuration+0x2c4/0x1670 /drivers/usb/core/message.c:1846
  generic_probe+0x9d/0xd5 /drivers/usb/core/generic.c:210
  usb_probe_device+0x99/0x100 /drivers/usb/core/driver.c:266
  really_probe+0x281/0x660 /drivers/base/dd.c:509
  driver_probe_device+0x104/0x210 /drivers/base/dd.c:670
  __device_attach_driver+0x1c2/0x220 /drivers/base/dd.c:777
  bus_for_each_drv+0x15c/0x1e0 /drivers/base/bus.c:454
  __device_attach+0x217/0x360 /drivers/base/dd.c:843
  bus_probe_device+0x1e4/0x290 /drivers/base/bus.c:514
  device_add+0xae6/0x16f0 /drivers/base/core.c:2111
  usb_new_device.cold+0x6a4/0xe61 /drivers/usb/core/hub.c:2536
  hub_port_connect /drivers/usb/core/hub.c:5098 [inline]
  hub_port_connect_change /drivers/usb/core/hub.c:5213 [inline]
  port_event /drivers/usb/core/hub.c:5359 [inline]
  hub_event+0x1abd/0x3550 /drivers/usb/core/hub.c:5441
  process_one_work+0x905/0x1570 /kernel/workqueue.c:2269
  worker_thread+0x96/0xe20 /kernel/workqueue.c:2415
  kthread+0x30b/0x410 /kernel/kthread.c:255
  ret_from_fork+0x24/0x30 /arch/x86/entry/entry_64.S:352

Freed by task 108:
  save_stack+0x1b/0x80 /mm/kasan/common.c:71
  set_track /mm/kasan/common.c:79 [inline]
  __kasan_slab_free+0x130/0x180 /mm/kasan/common.c:451
  slab_free_hook /mm/slub.c:1421 [inline]
  slab_free_freelist_hook /mm/slub.c:1448 [inline]
  slab_free /mm/slub.c:2994 [inline]
  kfree+0xd7/0x280 /mm/slub.c:3949
  device_release+0x71/0x200 /drivers/base/core.c:1064
  kobject_cleanup /lib/kobject.c:691 [inline]
  kobject_release /lib/kobject.c:720 [inline]
  kref_put /./include/linux/kref.h:65 [inline]
  kobject_put+0x171/0x280 /lib/kobject.c:737
  put_device+0x1b/0x30 /drivers/base/core.c:2210
  klist_put+0xce/0x170 /lib/klist.c:221
  bus_remove_device+0x3a4/0x4a0 /drivers/base/bus.c:552
  device_del+0x460/0xb80 /drivers/base/core.c:2274
  usb_disable_device+0x211/0x690 /drivers/usb/core/message.c:1237
  usb_disconnect+0x284/0x830 /drivers/usb/core/hub.c:2199
  hub_port_connect /drivers/usb/core/hub.c:4949 [inline]
  hub_port_connect_change /drivers/usb/core/hub.c:5213 [inline]
  port_event /drivers/usb/core/hub.c:5359 [inline]
  hub_event+0x13bd/0x3550 /drivers/usb/core/hub.c:5441
  process_one_work+0x905/0x1570 /kernel/workqueue.c:2269
  worker_thread+0x96/0xe20 /kernel/workqueue.c:2415
  kthread+0x30b/0x410 /kernel/kthread.c:255
  ret_from_fork+0x24/0x30 /arch/x86/entry/entry_64.S:352

The buggy address belongs to the object at ffff8881cfc4ee80
  which belongs to the cache kmalloc-2k of size 2048
The buggy address is located 272 bytes inside of
  2048-byte region [ffff8881cfc4ee80, ffff8881cfc4f680)
The buggy address belongs to the page:
page:ffffea00073f1200 refcount:1 mapcount:0 mapping:ffff8881dac02800  
index:0x0 compound_mapcount: 0
flags: 0x200000000010200(slab|head)
raw: 0200000000010200 dead000000000100 dead000000000200 ffff8881dac02800
raw: 0000000000000000 00000000000f000f 00000001ffffffff 0000000000000000
page dumped because: kasan: bad access detected

Memory state around the buggy address:
  ffff8881cfc4ee80: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
  ffff8881cfc4ef00: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
> ffff8881cfc4ef80: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                          ^
  ffff8881cfc4f000: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
  ffff8881cfc4f080: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
==================================================================


---
This bug is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this bug report. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
syzbot can test patches for this bug, for details see:
https://goo.gl/tpsmEJ#testing-patches
