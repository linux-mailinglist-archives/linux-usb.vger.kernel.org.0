Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 545E22C14A5
	for <lists+linux-usb@lfdr.de>; Mon, 23 Nov 2020 20:50:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730111AbgKWTmM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 23 Nov 2020 14:42:12 -0500
Received: from mail-io1-f69.google.com ([209.85.166.69]:36441 "EHLO
        mail-io1-f69.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729300AbgKWTmM (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 23 Nov 2020 14:42:12 -0500
Received: by mail-io1-f69.google.com with SMTP id q126so13834811iof.3
        for <linux-usb@vger.kernel.org>; Mon, 23 Nov 2020 11:42:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=+QFTdx0h5VKc/wbB6EaM0f6JW9+fYVkD9tVEpkcmRKQ=;
        b=WvoYvWlyOOZs/VNNXVOfVnjSogMQH/jFSA3eoX18WP4C/toNvF76V8wq11MMS4on8x
         A167osU0xnKocGBqw7RxPJvuKtLdEENCYtBvCx07RJcmBhLzeKL0qv3NFJnKPyGnDFKh
         4tui7E7T/y4R6nX398Qlijn+1ap0kC/nwMIJsRo0RZfDqf2uVB9J3OsUqizQqMB5UMov
         zV6q5vdIDK/nn4oBULMPMvxeXrNBKszOfZ88MABgumTiJkGiH7xoCtLv6VZvNwXyN1nM
         ywVdUXsWuv+7ysxC9tO5ivIHAEpIZ2EyLAFjaMwF/nxfIqdoRIk5G+BTwhGHG9h0JZu+
         bI9Q==
X-Gm-Message-State: AOAM532VuuhWKq83mAQt6jtxT6V+3H4v3P6TJflWPtKb7dv6ig0ElnO+
        5uWc8tav9ndNHXovwFQB0ppmVgsAv2JhleehM3O1dW0dXH4C
X-Google-Smtp-Source: ABdhPJxbcn441pkOa6VBDBKRx6MDUZf0Ff3a/b+eXb1qoS3NiW0FgfxcsCEhsjOeu5z0gx6YH+XSS3RKRtV3A1u3Ntptwn3CLEH7
MIME-Version: 1.0
X-Received: by 2002:a92:3403:: with SMTP id b3mr1258961ila.140.1606160531160;
 Mon, 23 Nov 2020 11:42:11 -0800 (PST)
Date:   Mon, 23 Nov 2020 11:42:11 -0800
In-Reply-To: <20201123193230.GA718753@rowland.harvard.edu>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000e9843a05b4cb6330@google.com>
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
unreferenced object 0xffff888125a13400 (size 1024):
  comm "kworker/0:3", pid 8164, jiffies 4294944436 (age 13.610s)
  hex dump (first 32 bytes):
    08 c7 84 25 81 88 ff ff 08 c7 84 25 81 88 ff ff  ...%.......%....
    01 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
  backtrace:
    [<0000000042c26fbc>] kmalloc include/linux/slab.h:552 [inline]
    [<0000000042c26fbc>] kzalloc include/linux/slab.h:664 [inline]
    [<0000000042c26fbc>] usb_set_configuration+0x18c/0xb90 drivers/usb/core/message.c:1987
    [<00000000df7c22fc>] usb_generic_driver_probe+0x8c/0xc0 drivers/usb/core/generic.c:238
    [<00000000dbc03c2e>] usb_probe_device+0x5c/0x140 drivers/usb/core/driver.c:293
    [<0000000061119d56>] really_probe+0x159/0x480 drivers/base/dd.c:554
    [<000000009f962ea9>] driver_probe_device+0x84/0x100 drivers/base/dd.c:738
    [<000000001459c72b>] __device_attach_driver+0xee/0x110 drivers/base/dd.c:844
    [<000000000532b098>] bus_for_each_drv+0xb7/0x100 drivers/base/bus.c:431
    [<00000000910da3ce>] __device_attach+0x122/0x250 drivers/base/dd.c:912
    [<0000000072e90711>] bus_probe_device+0xc6/0xe0 drivers/base/bus.c:491
    [<000000005cbbd88c>] device_add+0x5ac/0xc30 drivers/base/core.c:2936
    [<00000000e7bc8059>] usb_new_device.cold+0x166/0x578 drivers/usb/core/hub.c:2554
    [<00000000d9415aa4>] hub_port_connect drivers/usb/core/hub.c:5222 [inline]
    [<00000000d9415aa4>] hub_port_connect_change drivers/usb/core/hub.c:5362 [inline]
    [<00000000d9415aa4>] port_event drivers/usb/core/hub.c:5508 [inline]
    [<00000000d9415aa4>] hub_event+0x144a/0x20d0 drivers/usb/core/hub.c:5590
    [<000000004f0d05ee>] process_one_work+0x27d/0x590 kernel/workqueue.c:2272
    [<00000000a8771f1e>] worker_thread+0x59/0x5d0 kernel/workqueue.c:2418
    [<00000000b8ee2caf>] kthread+0x178/0x1b0 kernel/kthread.c:292
    [<00000000e31b0818>] ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:296

BUG: memory leak
unreferenced object 0xffff88812592c340 (size 32):
  comm "kworker/0:3", pid 8164, jiffies 4294944436 (age 13.610s)
  hex dump (first 32 bytes):
    33 2d 31 3a 30 2e 30 00 00 00 00 00 00 00 00 00  3-1:0.0.........
    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
  backtrace:
    [<0000000045f13983>] kvasprintf+0x6c/0xf0 lib/kasprintf.c:25
    [<0000000044941061>] kvasprintf_const+0x58/0x110 lib/kasprintf.c:49
    [<00000000c19829d3>] kobject_set_name_vargs+0x3b/0xe0 lib/kobject.c:289
    [<00000000b2f7d014>] dev_set_name+0x63/0x90 drivers/base/core.c:2722
    [<0000000071eb3ed0>] usb_set_configuration+0x6be/0xb90 drivers/usb/core/message.c:2094
    [<00000000df7c22fc>] usb_generic_driver_probe+0x8c/0xc0 drivers/usb/core/generic.c:238
    [<00000000dbc03c2e>] usb_probe_device+0x5c/0x140 drivers/usb/core/driver.c:293
    [<0000000061119d56>] really_probe+0x159/0x480 drivers/base/dd.c:554
    [<000000009f962ea9>] driver_probe_device+0x84/0x100 drivers/base/dd.c:738
    [<000000001459c72b>] __device_attach_driver+0xee/0x110 drivers/base/dd.c:844
    [<000000000532b098>] bus_for_each_drv+0xb7/0x100 drivers/base/bus.c:431
    [<00000000910da3ce>] __device_attach+0x122/0x250 drivers/base/dd.c:912
    [<0000000072e90711>] bus_probe_device+0xc6/0xe0 drivers/base/bus.c:491
    [<000000005cbbd88c>] device_add+0x5ac/0xc30 drivers/base/core.c:2936
    [<00000000e7bc8059>] usb_new_device.cold+0x166/0x578 drivers/usb/core/hub.c:2554
    [<00000000d9415aa4>] hub_port_connect drivers/usb/core/hub.c:5222 [inline]
    [<00000000d9415aa4>] hub_port_connect_change drivers/usb/core/hub.c:5362 [inline]
    [<00000000d9415aa4>] port_event drivers/usb/core/hub.c:5508 [inline]
    [<00000000d9415aa4>] hub_event+0x144a/0x20d0 drivers/usb/core/hub.c:5590

BUG: memory leak
unreferenced object 0xffff888125a0b300 (size 256):
  comm "kworker/0:3", pid 8164, jiffies 4294944441 (age 13.560s)
  hex dump (first 32 bytes):
    00 00 00 00 00 00 00 00 08 b3 a0 25 81 88 ff ff  ...........%....
    08 b3 a0 25 81 88 ff ff f0 8b 58 82 ff ff ff ff  ...%......X.....
  backtrace:
    [<000000009575797b>] kmalloc include/linux/slab.h:552 [inline]
    [<000000009575797b>] kzalloc include/linux/slab.h:664 [inline]
    [<000000009575797b>] device_private_init drivers/base/core.c:2778 [inline]
    [<000000009575797b>] device_add+0x7e8/0xc30 drivers/base/core.c:2828
    [<000000009e05d7ea>] usb_set_configuration+0x9de/0xb90 drivers/usb/core/message.c:2159
    [<00000000df7c22fc>] usb_generic_driver_probe+0x8c/0xc0 drivers/usb/core/generic.c:238
    [<00000000dbc03c2e>] usb_probe_device+0x5c/0x140 drivers/usb/core/driver.c:293
    [<0000000061119d56>] really_probe+0x159/0x480 drivers/base/dd.c:554
    [<000000009f962ea9>] driver_probe_device+0x84/0x100 drivers/base/dd.c:738
    [<000000001459c72b>] __device_attach_driver+0xee/0x110 drivers/base/dd.c:844
    [<000000000532b098>] bus_for_each_drv+0xb7/0x100 drivers/base/bus.c:431
    [<00000000910da3ce>] __device_attach+0x122/0x250 drivers/base/dd.c:912
    [<0000000072e90711>] bus_probe_device+0xc6/0xe0 drivers/base/bus.c:491
    [<000000005cbbd88c>] device_add+0x5ac/0xc30 drivers/base/core.c:2936
    [<00000000e7bc8059>] usb_new_device.cold+0x166/0x578 drivers/usb/core/hub.c:2554
    [<00000000d9415aa4>] hub_port_connect drivers/usb/core/hub.c:5222 [inline]
    [<00000000d9415aa4>] hub_port_connect_change drivers/usb/core/hub.c:5362 [inline]
    [<00000000d9415aa4>] port_event drivers/usb/core/hub.c:5508 [inline]
    [<00000000d9415aa4>] hub_event+0x144a/0x20d0 drivers/usb/core/hub.c:5590
    [<000000004f0d05ee>] process_one_work+0x27d/0x590 kernel/workqueue.c:2272
    [<00000000a8771f1e>] worker_thread+0x59/0x5d0 kernel/workqueue.c:2418
    [<00000000b8ee2caf>] kthread+0x178/0x1b0 kernel/kthread.c:292

BUG: memory leak
unreferenced object 0xffff888125b55800 (size 2048):
  comm "kworker/0:1", pid 7, jiffies 4294944569 (age 12.280s)
  hex dump (first 32 bytes):
    ff ff ff ff 31 00 00 00 00 00 00 00 00 00 00 00  ....1...........
    00 00 00 00 00 00 00 00 00 00 00 00 03 00 00 00  ................
  backtrace:
    [<00000000dad779b6>] kmalloc include/linux/slab.h:552 [inline]
    [<00000000dad779b6>] kzalloc include/linux/slab.h:664 [inline]
    [<00000000dad779b6>] usb_alloc_dev+0x32/0x450 drivers/usb/core/usb.c:582
    [<000000006a07019b>] hub_port_connect drivers/usb/core/hub.c:5128 [inline]
    [<000000006a07019b>] hub_port_connect_change drivers/usb/core/hub.c:5362 [inline]
    [<000000006a07019b>] port_event drivers/usb/core/hub.c:5508 [inline]
    [<000000006a07019b>] hub_event+0x118d/0x20d0 drivers/usb/core/hub.c:5590
    [<000000004f0d05ee>] process_one_work+0x27d/0x590 kernel/workqueue.c:2272
    [<00000000a8771f1e>] worker_thread+0x59/0x5d0 kernel/workqueue.c:2418
    [<00000000b8ee2caf>] kthread+0x178/0x1b0 kernel/kthread.c:292
    [<00000000e31b0818>] ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:296



Tested on:

commit:         4d02da97 Merge tag 'net-5.10-rc5' of git://git.kernel.org/..
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=12436fde500000
kernel config:  https://syzkaller.appspot.com/x/.config?x=b29e92cdfa2687df
dashboard link: https://syzkaller.appspot.com/bug?extid=44e64397bd81d5e84cba
compiler:       gcc (GCC) 10.1.0-syz 20200507
patch:          https://syzkaller.appspot.com/x/patch.diff?x=1197fc2d500000

