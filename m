Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7B2D799760
	for <lists+linux-usb@lfdr.de>; Thu, 22 Aug 2019 16:52:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387649AbfHVOwD (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 22 Aug 2019 10:52:03 -0400
Received: from mail-io1-f71.google.com ([209.85.166.71]:34123 "EHLO
        mail-io1-f71.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387623AbfHVOwD (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 22 Aug 2019 10:52:03 -0400
Received: by mail-io1-f71.google.com with SMTP id u84so6659367iod.1
        for <linux-usb@vger.kernel.org>; Thu, 22 Aug 2019 07:52:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=tfx7SDslrAc2PE/2x1wo//njmv7hdH0lKRSyyPIMdi4=;
        b=BJ7V9nx1K4Gc+Ld7/Z2U/yOFkXg3pNELoWB5B7p4SwxNKSO+IUomM5SLc8ozdS/xwL
         0cmEzgr4gWoh+HHKwOwyQdEdFfmMCnxPEKQLuYGsuB3gtqRGRjdLLWpE0C5VRDxNzuVn
         Cv3TM6uCqqrUGgCYGsoK/DtVF5jYTHucLZ4MQzJQP9Yh6IBhahLAFAQsZ2evGK6O1NnL
         7OkxpgSp1UydgGJx7Sznt/HB8vvfIOq9zv+drxw6/t1xxIAla5a7ReMIm4qLi9mJWqbr
         auMbFJ8e7+lhZSD9Rl1LsayRY3dbOlOcZXw1onIzO9Vduzl7aVze0R18L0jkqz55A5lw
         6pHg==
X-Gm-Message-State: APjAAAUPLClEK5n8wonW50xLoxyDETabkB/34bMGtZmUXno97t0dc0sH
        OfdlqN4M7wc1rcKJZkyWMPVakvy0VqBnfk0SrAL4/JIT1MMR
X-Google-Smtp-Source: APXvYqwkEaTPCEPE5B5SaIMErimJclWbQrN3F74IJA31/lCxZp7z9GPtNByyYN9jYTdop8VhaerLh0MJEljVR+aigpJ3sOHjTL8k
MIME-Version: 1.0
X-Received: by 2002:a02:a99d:: with SMTP id q29mr16782714jam.80.1566485521709;
 Thu, 22 Aug 2019 07:52:01 -0700 (PDT)
Date:   Thu, 22 Aug 2019 07:52:01 -0700
In-Reply-To: <1566484884.8347.53.camel@suse.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000001145b10590b5d5bc@google.com>
Subject: Re: WARNING in r871xu_dev_remove
From:   syzbot <syzbot+80899a8a8efe8968cde7@syzkaller.appspotmail.com>
To:     Larry.Finger@lwfinger.net, andreyknvl@google.com,
        devel@driverdev.osuosl.org, florian.c.schilhabel@googlemail.com,
        gregkh@linuxfoundation.org, himadri18.07@gmail.com,
        kai.heng.feng@canonical.com, linux-usb@vger.kernel.org,
        linux.dkm@gmail.com, oneukum@suse.com, straube.linux@gmail.com,
        syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,

syzbot has tested the proposed patch but the reproducer still triggered  
crash:
KASAN: use-after-free Read in device_release_driver_internal

==================================================================
BUG: KASAN: use-after-free in __mutex_lock_common  
kernel/locking/mutex.c:912 [inline]
BUG: KASAN: use-after-free in __mutex_lock+0xf23/0x1360  
kernel/locking/mutex.c:1077
Read of size 8 at addr ffff8881d644bd78 by task kworker/0:4/2855

CPU: 0 PID: 2855 Comm: kworker/0:4 Not tainted 5.3.0-rc5+ #1
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
  device_release_driver_internal+0x23/0x500 drivers/base/dd.c:1162
  bus_remove_device+0x2dc/0x4a0 drivers/base/bus.c:556
  device_del+0x420/0xb10 drivers/base/core.c:2339
  usb_disconnect+0x4c3/0x8d0 drivers/usb/core/hub.c:2225
  hub_port_connect drivers/usb/core/hub.c:4949 [inline]
  hub_port_connect_change drivers/usb/core/hub.c:5213 [inline]
  port_event drivers/usb/core/hub.c:5359 [inline]
  hub_event+0x1454/0x3640 drivers/usb/core/hub.c:5441
  process_one_work+0x92b/0x1530 kernel/workqueue.c:2269
  worker_thread+0x96/0xe20 kernel/workqueue.c:2415
  kthread+0x318/0x420 kernel/kthread.c:255
  ret_from_fork+0x24/0x30 arch/x86/entry/entry_64.S:352

Allocated by task 12:
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

Freed by task 2855:
  save_stack+0x1b/0x80 mm/kasan/common.c:69
  set_track mm/kasan/common.c:77 [inline]
  __kasan_slab_free+0x130/0x180 mm/kasan/common.c:449
  slab_free_hook mm/slub.c:1423 [inline]
  slab_free_freelist_hook mm/slub.c:1474 [inline]
  slab_free mm/slub.c:3016 [inline]
  kfree+0xe4/0x2f0 mm/slub.c:3957
  device_release+0x71/0x200 drivers/base/core.c:1064
  kobject_cleanup lib/kobject.c:693 [inline]
  kobject_release lib/kobject.c:722 [inline]
  kref_put include/linux/kref.h:65 [inline]
  kobject_put+0x171/0x280 lib/kobject.c:739
  put_device+0x1b/0x30 drivers/base/core.c:2264
  klist_put+0xce/0x170 lib/klist.c:221
  bus_remove_device+0x3a4/0x4a0 drivers/base/bus.c:552
  device_del+0x420/0xb10 drivers/base/core.c:2339
  usb_disconnect+0x4c3/0x8d0 drivers/usb/core/hub.c:2225
  hub_port_connect drivers/usb/core/hub.c:4949 [inline]
  hub_port_connect_change drivers/usb/core/hub.c:5213 [inline]
  port_event drivers/usb/core/hub.c:5359 [inline]
  hub_event+0x1454/0x3640 drivers/usb/core/hub.c:5441
  process_one_work+0x92b/0x1530 kernel/workqueue.c:2269
  worker_thread+0x96/0xe20 kernel/workqueue.c:2415
  kthread+0x318/0x420 kernel/kthread.c:255
  ret_from_fork+0x24/0x30 arch/x86/entry/entry_64.S:352

The buggy address belongs to the object at ffff8881d644bb80
  which belongs to the cache kmalloc-2k of size 2048
The buggy address is located 504 bytes inside of
  2048-byte region [ffff8881d644bb80, ffff8881d644c380)
The buggy address belongs to the page:
page:ffffea0007591200 refcount:1 mapcount:0 mapping:ffff8881da00c000  
index:0xffff8881d6448000 compound_mapcount: 0
flags: 0x200000000010200(slab|head)
raw: 0200000000010200 ffffea000760ac00 0000000200000002 ffff8881da00c000
raw: ffff8881d6448000 00000000800f000a 00000001ffffffff 0000000000000000
page dumped because: kasan: bad access detected

Memory state around the buggy address:
  ffff8881d644bc00: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
  ffff8881d644bc80: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
> ffff8881d644bd00: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                                                                 ^
  ffff8881d644bd80: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
  ffff8881d644be00: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
==================================================================


Tested on:

commit:         eea39f24 usb-fuzzer: main usb gadget fuzzer driver
git tree:       https://github.com/google/kasan.git
console output: https://syzkaller.appspot.com/x/log.txt?x=1018661e600000
kernel config:  https://syzkaller.appspot.com/x/.config?x=d0c62209eedfd54e
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
patch:          https://syzkaller.appspot.com/x/patch.diff?x=1425bc2e600000

