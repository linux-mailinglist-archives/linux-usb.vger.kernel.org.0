Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 15A94E9BD7
	for <lists+linux-usb@lfdr.de>; Wed, 30 Oct 2019 13:52:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726403AbfJ3MwL (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 30 Oct 2019 08:52:11 -0400
Received: from mail-io1-f71.google.com ([209.85.166.71]:38898 "EHLO
        mail-io1-f71.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726261AbfJ3MwL (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 30 Oct 2019 08:52:11 -0400
Received: by mail-io1-f71.google.com with SMTP id c2so1763172ioc.5
        for <linux-usb@vger.kernel.org>; Wed, 30 Oct 2019 05:52:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=5hl1COUvMaR/U8JjzZqIErDBOd54NybwZ/tb4y78jAQ=;
        b=QTyBDIe3mFQirpRvLrxcyeWbNxFw+rloeqoPpJTmV4SiXaPUuoBQQMQ2xKv8crkYzo
         m5sTa/i5V7Vn6jKNmU8PvVPZMgRAT0Y+vviAYV7CSTmDWHL45O44lmt/NihkoopP4Bo/
         EglRVQq26Gx3xYvPzDqOHZWoBnV31MPG6evTgMOvhQgwaJphkeW7trIAcOo6BLZgg3OY
         r5ik3QlCUC1u+BZsthplqBbbqJCv0cuIgc5epeD8PiFmvU7tI7AlQ1YY9o+sAITlbUW7
         6JuKdHT3KJFtltpgcVdWmq5rl7wn5wfJPhTkiXBk/zhnVZlpIMocElKVfUVWRM3qBpXq
         AYKw==
X-Gm-Message-State: APjAAAXoCFAmhSGaLxaN7WN1ta8p8A8ZT0tEpeVifWde8eoMQg9jQrcu
        w9tKwciMkd5Z72dPoSPvcTh8vHCoGyComCE5S6yDy6pSn92Z
X-Google-Smtp-Source: APXvYqz9IdOqVAWhBZFp4jTj3wtDsFAQEvnFLMFBXNXDb5NTFnEnQEDIA4rX7SdypFtBelBuAYEkR9NveoCO+CapTI1FZGDPJHVO
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:4c4:: with SMTP id f4mr25553238ils.79.1572439928625;
 Wed, 30 Oct 2019 05:52:08 -0700 (PDT)
Date:   Wed, 30 Oct 2019 05:52:08 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000006062280596203360@google.com>
Subject: KASAN: use-after-free Read in chaoskey_disconnect
From:   syzbot <syzbot+6d8505fcdf25f00ac276@syzkaller.appspotmail.com>
To:     alexandre.belloni@bootlin.com, andreyknvl@google.com,
        arnd@arndb.de, gregkh@linuxfoundation.org,
        herbert@gondor.apana.org.au, linux-crypto@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        lvivier@redhat.com, mchehab+samsung@kernel.org, mpm@selenic.com,
        swboyd@chromium.org, syzkaller-bugs@googlegroups.com, tytso@mit.edu
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,

syzbot found the following crash on:

HEAD commit:    ff6409a6 usb-fuzzer: main usb gadget fuzzer driver
git tree:       https://github.com/google/kasan.git usb-fuzzer
console output: https://syzkaller.appspot.com/x/log.txt?x=15e1ba24e00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=3230c37d442895b7
dashboard link: https://syzkaller.appspot.com/bug?extid=6d8505fcdf25f00ac276
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=169b8904e00000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=166f3104e00000

IMPORTANT: if you fix the bug, please add the following tag to the commit:
Reported-by: syzbot+6d8505fcdf25f00ac276@syzkaller.appspotmail.com

usb 3-1: string descriptor 0 read error: -71
usb 3-1: USB disconnect, device number 2
==================================================================
BUG: KASAN: use-after-free in atomic_read  
include/asm-generic/atomic-instrumented.h:26 [inline]
BUG: KASAN: use-after-free in refcount_inc_not_zero_checked+0x72/0x1e0  
lib/refcount.c:123
Read of size 4 at addr ffff8881cf679820 by task kworker/1:1/1730

CPU: 1 PID: 1730 Comm: kworker/1:1 Not tainted 5.4.0-rc5+ #0
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
  process_scheduled_works kernel/workqueue.c:2331 [inline]
  worker_thread+0x7ab/0xe20 kernel/workqueue.c:2417
  kthread+0x318/0x420 kernel/kthread.c:255
  ret_from_fork+0x24/0x30 arch/x86/entry/entry_64.S:352

Allocated by task 2:
  save_stack+0x1b/0x80 mm/kasan/common.c:69
  set_track mm/kasan/common.c:77 [inline]
  __kasan_kmalloc mm/kasan/common.c:510 [inline]
  __kasan_kmalloc.constprop.0+0xbf/0xd0 mm/kasan/common.c:483
  slab_post_alloc_hook mm/slab.h:584 [inline]
  slab_alloc_node mm/slub.c:2779 [inline]
  kmem_cache_alloc_node+0xdc/0x310 mm/slub.c:2815
  alloc_task_struct_node kernel/fork.c:169 [inline]
  dup_task_struct kernel/fork.c:865 [inline]
  copy_process+0x4201/0x6470 kernel/fork.c:1851
  _do_fork+0x129/0xec0 kernel/fork.c:2366
  kernel_thread+0xaa/0xe0 kernel/fork.c:2453
  create_kthread kernel/kthread.c:278 [inline]
  kthreadd+0x4a2/0x680 kernel/kthread.c:596
  ret_from_fork+0x24/0x30 arch/x86/entry/entry_64.S:352

Freed by task 16:
  save_stack+0x1b/0x80 mm/kasan/common.c:69
  set_track mm/kasan/common.c:77 [inline]
  kasan_set_free_info mm/kasan/common.c:332 [inline]
  __kasan_slab_free+0x130/0x180 mm/kasan/common.c:471
  slab_free_hook mm/slub.c:1424 [inline]
  slab_free_freelist_hook mm/slub.c:1475 [inline]
  slab_free mm/slub.c:3025 [inline]
  kmem_cache_free+0xb9/0x380 mm/slub.c:3041
  __put_task_struct+0x1e2/0x4c0 kernel/fork.c:748
  put_task_struct include/linux/sched/task.h:119 [inline]
  delayed_put_task_struct+0x1b4/0x2c0 kernel/exit.c:182
  __rcu_reclaim kernel/rcu/rcu.h:222 [inline]
  rcu_do_batch kernel/rcu/tree.c:2157 [inline]
  rcu_core+0x630/0x1ca0 kernel/rcu/tree.c:2377
  __do_softirq+0x221/0x912 kernel/softirq.c:292

The buggy address belongs to the object at ffff8881cf679800
  which belongs to the cache task_struct of size 5888
The buggy address is located 32 bytes inside of
  5888-byte region [ffff8881cf679800, ffff8881cf67af00)
The buggy address belongs to the page:
page:ffffea00073d9e00 refcount:1 mapcount:0 mapping:ffff8881da116000  
index:0x0 compound_mapcount: 0
flags: 0x200000000010200(slab|head)
raw: 0200000000010200 dead000000000100 dead000000000122 ffff8881da116000
raw: 0000000000000000 0000000080050005 00000001ffffffff 0000000000000000
page dumped because: kasan: bad access detected

Memory state around the buggy address:
  ffff8881cf679700: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
  ffff8881cf679780: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
> ffff8881cf679800: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                                ^
  ffff8881cf679880: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
  ffff8881cf679900: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
==================================================================


---
This bug is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this bug report. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
syzbot can test patches for this bug, for details see:
https://goo.gl/tpsmEJ#testing-patches
