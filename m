Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7DE072C1701
	for <lists+linux-usb@lfdr.de>; Mon, 23 Nov 2020 21:50:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730288AbgKWUsK (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 23 Nov 2020 15:48:10 -0500
Received: from mail-io1-f70.google.com ([209.85.166.70]:37432 "EHLO
        mail-io1-f70.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727461AbgKWUsK (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 23 Nov 2020 15:48:10 -0500
Received: by mail-io1-f70.google.com with SMTP id b4so13945995ioa.4
        for <linux-usb@vger.kernel.org>; Mon, 23 Nov 2020 12:48:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=LGXG/yE4pCZHrbFYBV7MvmTQGcL73YMmrAkdmnyipN8=;
        b=GTRCSfdpkfrVp/fflsGQPXopfR4OeEdJdinvRPApkHvpKjlOsiKWNCFzmqzYXraxw0
         eUNn4uoR7qUkd4ka8BpTtHGaIeyoL2RqOAOPHQUz4LelQywrlUUVj7DMMqcxbI2omU4V
         DkPu3Z33b8Q6Y7PkvGt2nqO0wPzaZJCYASW+eHT/UGyuP8wTyzwhqJNOWAceP3SINHaD
         xk/0U5+QsWnq2ozoUkAy8dEh0jtNIZwC1mZkaKoRwBSUzCGTSKWFK4PuQ9KPYQ4OqClH
         m8pMjODK0HTCRwlOUKL7c6V1UkYry/NSzgBvluihebTCstYS57pJxCYRdkLgYc9aa5du
         mpXg==
X-Gm-Message-State: AOAM532NsCVIPKKF7y0Z/N/tiDaQwNLjlMoaG6aJl1pgX9BnQ7fCfze3
        CLQIKp+hghjUbIJpvHbsoPXy0SEfURrs31MxguGPggcYoA6k
X-Google-Smtp-Source: ABdhPJxfjMpWWdjjJIJ2jcA4XA9tXf/bWZhEnyaauUTACVDeeRdwjYbx8eR2Ikh+iPMWapAlm22HifIgkjjdAu0Ik70xkn0n4uQN
MIME-Version: 1.0
X-Received: by 2002:a05:6638:41a:: with SMTP id q26mr1372070jap.27.1606164488688;
 Mon, 23 Nov 2020 12:48:08 -0800 (PST)
Date:   Mon, 23 Nov 2020 12:48:08 -0800
In-Reply-To: <20201123203853.GB720000@rowland.harvard.edu>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000cc9e3405b4cc4ff8@google.com>
Subject: Re: memory leak in hub_event
From:   syzbot <syzbot+44e64397bd81d5e84cba@syzkaller.appspotmail.com>
To:     linux-usb@vger.kernel.org, stern@rowland.harvard.edu,
        syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
memory leak in usb_set_configuration

BUG: memory leak
unreferenced object 0xffff8881268a1800 (size 1024):
  comm "kworker/0:2", pid 3644, jiffies 4294944749 (age 12.820s)
  hex dump (first 32 bytes):
    48 f3 6a 26 81 88 ff ff 48 f3 6a 26 81 88 ff ff  H.j&....H.j&....
    01 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
  backtrace:
    [<0000000089bfe22c>] kmalloc include/linux/slab.h:552 [inline]
    [<0000000089bfe22c>] kzalloc include/linux/slab.h:664 [inline]
    [<0000000089bfe22c>] usb_set_configuration+0x18c/0xb90 drivers/usb/core/message.c:1987
    [<00000000207f81de>] usb_generic_driver_probe+0x8c/0xc0 drivers/usb/core/generic.c:238
    [<000000007aa490e0>] usb_probe_device+0x5c/0x140 drivers/usb/core/driver.c:293
    [<0000000063ae4f8e>] really_probe+0x159/0x480 drivers/base/dd.c:554
    [<000000000b2cba9e>] driver_probe_device+0x84/0x100 drivers/base/dd.c:738
    [<00000000401d8f88>] __device_attach_driver+0xee/0x110 drivers/base/dd.c:844
    [<00000000071f219f>] bus_for_each_drv+0xb7/0x100 drivers/base/bus.c:431
    [<0000000050610cd8>] __device_attach+0x122/0x250 drivers/base/dd.c:912
    [<000000003a745e13>] bus_probe_device+0xc6/0xe0 drivers/base/bus.c:491
    [<00000000755052c8>] device_add+0x5ac/0xc30 drivers/base/core.c:2936
    [<000000005e2739cd>] usb_new_device.cold+0x166/0x578 drivers/usb/core/hub.c:2554
    [<00000000f1911f9c>] hub_port_connect drivers/usb/core/hub.c:5222 [inline]
    [<00000000f1911f9c>] hub_port_connect_change drivers/usb/core/hub.c:5362 [inline]
    [<00000000f1911f9c>] port_event drivers/usb/core/hub.c:5508 [inline]
    [<00000000f1911f9c>] hub_event+0x144a/0x20d0 drivers/usb/core/hub.c:5590
    [<000000000f3eae83>] process_one_work+0x27d/0x590 kernel/workqueue.c:2272
    [<00000000aaee64a0>] worker_thread+0x59/0x5d0 kernel/workqueue.c:2418
    [<00000000c7b69663>] kthread+0x178/0x1b0 kernel/kthread.c:292
    [<0000000083b3bd6e>] ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:296

BUG: memory leak
unreferenced object 0xffff8881267cbb00 (size 32):
  comm "kworker/0:2", pid 3644, jiffies 4294944749 (age 12.820s)
  hex dump (first 32 bytes):
    32 2d 31 3a 30 2e 30 00 00 00 00 00 00 00 00 00  2-1:0.0.........
    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
  backtrace:
    [<00000000cdbe26df>] kvasprintf+0x6c/0xf0 lib/kasprintf.c:25
    [<00000000f93de34f>] kvasprintf_const+0x58/0x110 lib/kasprintf.c:49
    [<00000000701cf1fc>] kobject_set_name_vargs+0x3b/0xe0 lib/kobject.c:289
    [<00000000d2130373>] dev_set_name+0x63/0x90 drivers/base/core.c:2722
    [<000000008249ed0f>] usb_set_configuration+0x6be/0xb90 drivers/usb/core/message.c:2094
    [<00000000207f81de>] usb_generic_driver_probe+0x8c/0xc0 drivers/usb/core/generic.c:238
    [<000000007aa490e0>] usb_probe_device+0x5c/0x140 drivers/usb/core/driver.c:293
    [<0000000063ae4f8e>] really_probe+0x159/0x480 drivers/base/dd.c:554
    [<000000000b2cba9e>] driver_probe_device+0x84/0x100 drivers/base/dd.c:738
    [<00000000401d8f88>] __device_attach_driver+0xee/0x110 drivers/base/dd.c:844
    [<00000000071f219f>] bus_for_each_drv+0xb7/0x100 drivers/base/bus.c:431
    [<0000000050610cd8>] __device_attach+0x122/0x250 drivers/base/dd.c:912
    [<000000003a745e13>] bus_probe_device+0xc6/0xe0 drivers/base/bus.c:491
    [<00000000755052c8>] device_add+0x5ac/0xc30 drivers/base/core.c:2936
    [<000000005e2739cd>] usb_new_device.cold+0x166/0x578 drivers/usb/core/hub.c:2554
    [<00000000f1911f9c>] hub_port_connect drivers/usb/core/hub.c:5222 [inline]
    [<00000000f1911f9c>] hub_port_connect_change drivers/usb/core/hub.c:5362 [inline]
    [<00000000f1911f9c>] port_event drivers/usb/core/hub.c:5508 [inline]
    [<00000000f1911f9c>] hub_event+0x144a/0x20d0 drivers/usb/core/hub.c:5590

BUG: memory leak
unreferenced object 0xffff888126840f00 (size 256):
  comm "kworker/0:2", pid 3644, jiffies 4294944753 (age 12.780s)
  hex dump (first 32 bytes):
    00 00 00 00 00 00 00 00 08 0f 84 26 81 88 ff ff  ...........&....
    08 0f 84 26 81 88 ff ff f0 8b 58 82 ff ff ff ff  ...&......X.....
  backtrace:
    [<00000000d74f9968>] kmalloc include/linux/slab.h:552 [inline]
    [<00000000d74f9968>] kzalloc include/linux/slab.h:664 [inline]
    [<00000000d74f9968>] device_private_init drivers/base/core.c:2778 [inline]
    [<00000000d74f9968>] device_add+0x7e8/0xc30 drivers/base/core.c:2828
    [<000000001ecf5486>] usb_set_configuration+0x9de/0xb90 drivers/usb/core/message.c:2159
    [<00000000207f81de>] usb_generic_driver_probe+0x8c/0xc0 drivers/usb/core/generic.c:238
    [<000000007aa490e0>] usb_probe_device+0x5c/0x140 drivers/usb/core/driver.c:293
    [<0000000063ae4f8e>] really_probe+0x159/0x480 drivers/base/dd.c:554
    [<000000000b2cba9e>] driver_probe_device+0x84/0x100 drivers/base/dd.c:738
    [<00000000401d8f88>] __device_attach_driver+0xee/0x110 drivers/base/dd.c:844
    [<00000000071f219f>] bus_for_each_drv+0xb7/0x100 drivers/base/bus.c:431
    [<0000000050610cd8>] __device_attach+0x122/0x250 drivers/base/dd.c:912
    [<000000003a745e13>] bus_probe_device+0xc6/0xe0 drivers/base/bus.c:491
    [<00000000755052c8>] device_add+0x5ac/0xc30 drivers/base/core.c:2936
    [<000000005e2739cd>] usb_new_device.cold+0x166/0x578 drivers/usb/core/hub.c:2554
    [<00000000f1911f9c>] hub_port_connect drivers/usb/core/hub.c:5222 [inline]
    [<00000000f1911f9c>] hub_port_connect_change drivers/usb/core/hub.c:5362 [inline]
    [<00000000f1911f9c>] port_event drivers/usb/core/hub.c:5508 [inline]
    [<00000000f1911f9c>] hub_event+0x144a/0x20d0 drivers/usb/core/hub.c:5590
    [<000000000f3eae83>] process_one_work+0x27d/0x590 kernel/workqueue.c:2272
    [<00000000aaee64a0>] worker_thread+0x59/0x5d0 kernel/workqueue.c:2418
    [<00000000c7b69663>] kthread+0x178/0x1b0 kernel/kthread.c:292

BUG: memory leak
unreferenced object 0xffff888125cc4800 (size 2048):
  comm "kworker/0:0", pid 5, jiffies 4294944827 (age 12.040s)
  hex dump (first 32 bytes):
    ff ff ff ff 31 00 00 00 00 00 00 00 00 00 00 00  ....1...........
    00 00 00 00 00 00 00 00 00 00 00 00 03 00 00 00  ................
  backtrace:
    [<000000004b6bc568>] kmalloc include/linux/slab.h:552 [inline]
    [<000000004b6bc568>] kzalloc include/linux/slab.h:664 [inline]
    [<000000004b6bc568>] usb_alloc_dev+0x32/0x450 drivers/usb/core/usb.c:582
    [<0000000098e340b1>] hub_port_connect drivers/usb/core/hub.c:5128 [inline]
    [<0000000098e340b1>] hub_port_connect_change drivers/usb/core/hub.c:5362 [inline]
    [<0000000098e340b1>] port_event drivers/usb/core/hub.c:5508 [inline]
    [<0000000098e340b1>] hub_event+0x118d/0x20d0 drivers/usb/core/hub.c:5590
    [<000000000f3eae83>] process_one_work+0x27d/0x590 kernel/workqueue.c:2272
    [<00000000aaee64a0>] worker_thread+0x59/0x5d0 kernel/workqueue.c:2418
    [<00000000c7b69663>] kthread+0x178/0x1b0 kernel/kthread.c:292
    [<0000000083b3bd6e>] ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:296



Tested on:

commit:         4d02da97 Merge tag 'net-5.10-rc5' of git://git.kernel.org/..
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=115d7eb9500000
kernel config:  https://syzkaller.appspot.com/x/.config?x=b29e92cdfa2687df
dashboard link: https://syzkaller.appspot.com/bug?extid=44e64397bd81d5e84cba
compiler:       gcc (GCC) 10.1.0-syz 20200507
patch:          https://syzkaller.appspot.com/x/patch.diff?x=10236fde500000

