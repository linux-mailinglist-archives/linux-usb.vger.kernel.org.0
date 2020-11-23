Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E91D12C14F3
	for <lists+linux-usb@lfdr.de>; Mon, 23 Nov 2020 21:03:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727119AbgKWUBK (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 23 Nov 2020 15:01:10 -0500
Received: from mail-io1-f69.google.com ([209.85.166.69]:44583 "EHLO
        mail-io1-f69.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726921AbgKWUBJ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 23 Nov 2020 15:01:09 -0500
Received: by mail-io1-f69.google.com with SMTP id p12so13833748ioj.11
        for <linux-usb@vger.kernel.org>; Mon, 23 Nov 2020 12:01:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=Ko7nwhTGGiKHd70/ZGthku4qrchayecD8A3kHnKGqF0=;
        b=DoAubEE3AgL1SNB+tK7+aDY8KRbdPkJm4Jv1EQH/+akzYaZwVKf9weM6Jo+IEsx/Ly
         6kdxYXjqlU5p40JryAhcFnACh6B0Y8EmT8teCrKnWw3I0eso7L+fpJO4EEzbY7HeWicK
         2WSEjXD57dTruf32AO23/DLhFvtalTvFdGvy9eU9ROElSmH39xyAilkTCALy9DfpSOO/
         PNPQDrvtegHINOXmZhGy524wwSCVnB3Y0nqBqbI7fBZCCCYEMvFaaw3tlpZL/8S089H6
         yRPCltdAA6iw/bXYiqBozfSOUy7C19fOUvLcO0NKC5BxIv8lsKKrX0FCS+pY2Qk7BNKc
         72BQ==
X-Gm-Message-State: AOAM532A8geGbVrioBnqRCs4+CwrfvzHV52tzs6gKk8P/5Qn6R3v57BH
        DvXtOZsisLeH/H4ruQwdd3QfsAhmvUCkk82sY4O+NhjXC8v8
X-Google-Smtp-Source: ABdhPJy13D4YEMhGTuyDGSuORHv/JF5zjJjzpqNatAuZ4G9xxhdtYq6lLpKSqWfGTN6NIvbVMFECC5CXvEIzTHREEG7iZjcYJ0MJ
MIME-Version: 1.0
X-Received: by 2002:a05:6602:5de:: with SMTP id w30mr1204481iox.64.1606161668349;
 Mon, 23 Nov 2020 12:01:08 -0800 (PST)
Date:   Mon, 23 Nov 2020 12:01:08 -0800
In-Reply-To: <20201123195307.GA720000@rowland.harvard.edu>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000b1a48005b4cba75e@google.com>
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
unreferenced object 0xffff88812695d400 (size 1024):
  comm "kworker/1:2", pid 3876, jiffies 4294944657 (age 14.950s)
  hex dump (first 32 bytes):
    c8 ee 8d 26 81 88 ff ff c8 ee 8d 26 81 88 ff ff  ...&.......&....
    01 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
  backtrace:
    [<00000000e23bdd53>] kmalloc include/linux/slab.h:552 [inline]
    [<00000000e23bdd53>] kzalloc include/linux/slab.h:664 [inline]
    [<00000000e23bdd53>] usb_set_configuration+0x18c/0xb90 drivers/usb/core/message.c:1987
    [<0000000075483a2c>] usb_generic_driver_probe+0x8c/0xc0 drivers/usb/core/generic.c:238
    [<00000000e7052b0c>] usb_probe_device+0x5c/0x140 drivers/usb/core/driver.c:293
    [<0000000084544ac0>] really_probe+0x159/0x480 drivers/base/dd.c:554
    [<00000000b1ca23bf>] driver_probe_device+0x84/0x100 drivers/base/dd.c:738
    [<0000000071b8d8fa>] __device_attach_driver+0xee/0x110 drivers/base/dd.c:844
    [<00000000b1c25910>] bus_for_each_drv+0xb7/0x100 drivers/base/bus.c:431
    [<00000000104c17ae>] __device_attach+0x122/0x250 drivers/base/dd.c:912
    [<00000000b93cff33>] bus_probe_device+0xc6/0xe0 drivers/base/bus.c:491
    [<0000000098ed347d>] device_add+0x5ac/0xc30 drivers/base/core.c:2936
    [<000000008afe4d3b>] usb_new_device.cold+0x166/0x578 drivers/usb/core/hub.c:2554
    [<000000000db8d2bb>] hub_port_connect drivers/usb/core/hub.c:5222 [inline]
    [<000000000db8d2bb>] hub_port_connect_change drivers/usb/core/hub.c:5362 [inline]
    [<000000000db8d2bb>] port_event drivers/usb/core/hub.c:5508 [inline]
    [<000000000db8d2bb>] hub_event+0x144a/0x20d0 drivers/usb/core/hub.c:5590
    [<00000000d321de91>] process_one_work+0x27d/0x590 kernel/workqueue.c:2272
    [<0000000038230b58>] worker_thread+0x59/0x5d0 kernel/workqueue.c:2418
    [<00000000a1e60acf>] kthread+0x178/0x1b0 kernel/kthread.c:292
    [<00000000d5e1cdc3>] ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:296

BUG: memory leak
unreferenced object 0xffff8881269b6560 (size 32):
  comm "kworker/1:2", pid 3876, jiffies 4294944657 (age 14.950s)
  hex dump (first 32 bytes):
    36 2d 31 3a 30 2e 30 00 00 00 00 00 00 00 00 00  6-1:0.0.........
    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
  backtrace:
    [<00000000e5418e58>] kvasprintf+0x6c/0xf0 lib/kasprintf.c:25
    [<00000000a3c51b27>] kvasprintf_const+0x58/0x110 lib/kasprintf.c:49
    [<000000002234e01b>] kobject_set_name_vargs+0x3b/0xe0 lib/kobject.c:289
    [<00000000f280c658>] dev_set_name+0x63/0x90 drivers/base/core.c:2722
    [<000000008b5b3978>] usb_set_configuration+0x6be/0xb90 drivers/usb/core/message.c:2094
    [<0000000075483a2c>] usb_generic_driver_probe+0x8c/0xc0 drivers/usb/core/generic.c:238
    [<00000000e7052b0c>] usb_probe_device+0x5c/0x140 drivers/usb/core/driver.c:293
    [<0000000084544ac0>] really_probe+0x159/0x480 drivers/base/dd.c:554
    [<00000000b1ca23bf>] driver_probe_device+0x84/0x100 drivers/base/dd.c:738
    [<0000000071b8d8fa>] __device_attach_driver+0xee/0x110 drivers/base/dd.c:844
    [<00000000b1c25910>] bus_for_each_drv+0xb7/0x100 drivers/base/bus.c:431
    [<00000000104c17ae>] __device_attach+0x122/0x250 drivers/base/dd.c:912
    [<00000000b93cff33>] bus_probe_device+0xc6/0xe0 drivers/base/bus.c:491
    [<0000000098ed347d>] device_add+0x5ac/0xc30 drivers/base/core.c:2936
    [<000000008afe4d3b>] usb_new_device.cold+0x166/0x578 drivers/usb/core/hub.c:2554
    [<000000000db8d2bb>] hub_port_connect drivers/usb/core/hub.c:5222 [inline]
    [<000000000db8d2bb>] hub_port_connect_change drivers/usb/core/hub.c:5362 [inline]
    [<000000000db8d2bb>] port_event drivers/usb/core/hub.c:5508 [inline]
    [<000000000db8d2bb>] hub_event+0x144a/0x20d0 drivers/usb/core/hub.c:5590

BUG: memory leak
unreferenced object 0xffff8881263eff00 (size 256):
  comm "kworker/1:2", pid 3876, jiffies 4294944661 (age 14.910s)
  hex dump (first 32 bytes):
    00 00 00 00 00 00 00 00 08 ff 3e 26 81 88 ff ff  ..........>&....
    08 ff 3e 26 81 88 ff ff f0 8b 58 82 ff ff ff ff  ..>&......X.....
  backtrace:
    [<000000001dc8ab7b>] kmalloc include/linux/slab.h:552 [inline]
    [<000000001dc8ab7b>] kzalloc include/linux/slab.h:664 [inline]
    [<000000001dc8ab7b>] device_private_init drivers/base/core.c:2778 [inline]
    [<000000001dc8ab7b>] device_add+0x7e8/0xc30 drivers/base/core.c:2828
    [<00000000268b1f35>] usb_set_configuration+0x9de/0xb90 drivers/usb/core/message.c:2159
    [<0000000075483a2c>] usb_generic_driver_probe+0x8c/0xc0 drivers/usb/core/generic.c:238
    [<00000000e7052b0c>] usb_probe_device+0x5c/0x140 drivers/usb/core/driver.c:293
    [<0000000084544ac0>] really_probe+0x159/0x480 drivers/base/dd.c:554
    [<00000000b1ca23bf>] driver_probe_device+0x84/0x100 drivers/base/dd.c:738
    [<0000000071b8d8fa>] __device_attach_driver+0xee/0x110 drivers/base/dd.c:844
    [<00000000b1c25910>] bus_for_each_drv+0xb7/0x100 drivers/base/bus.c:431
    [<00000000104c17ae>] __device_attach+0x122/0x250 drivers/base/dd.c:912
    [<00000000b93cff33>] bus_probe_device+0xc6/0xe0 drivers/base/bus.c:491
    [<0000000098ed347d>] device_add+0x5ac/0xc30 drivers/base/core.c:2936
    [<000000008afe4d3b>] usb_new_device.cold+0x166/0x578 drivers/usb/core/hub.c:2554
    [<000000000db8d2bb>] hub_port_connect drivers/usb/core/hub.c:5222 [inline]
    [<000000000db8d2bb>] hub_port_connect_change drivers/usb/core/hub.c:5362 [inline]
    [<000000000db8d2bb>] port_event drivers/usb/core/hub.c:5508 [inline]
    [<000000000db8d2bb>] hub_event+0x144a/0x20d0 drivers/usb/core/hub.c:5590
    [<00000000d321de91>] process_one_work+0x27d/0x590 kernel/workqueue.c:2272
    [<0000000038230b58>] worker_thread+0x59/0x5d0 kernel/workqueue.c:2418
    [<00000000a1e60acf>] kthread+0x178/0x1b0 kernel/kthread.c:292

BUG: memory leak
unreferenced object 0xffff888126ad1800 (size 2048):
  comm "kworker/0:3", pid 4909, jiffies 4294944664 (age 14.880s)
  hex dump (first 32 bytes):
    ff ff ff ff 31 00 00 00 00 00 00 00 00 00 00 00  ....1...........
    00 00 00 00 00 00 00 00 00 00 00 00 03 00 00 00  ................
  backtrace:
    [<0000000083df40a5>] kmalloc include/linux/slab.h:552 [inline]
    [<0000000083df40a5>] kzalloc include/linux/slab.h:664 [inline]
    [<0000000083df40a5>] usb_alloc_dev+0x32/0x450 drivers/usb/core/usb.c:582
    [<000000006a2b040a>] hub_port_connect drivers/usb/core/hub.c:5128 [inline]
    [<000000006a2b040a>] hub_port_connect_change drivers/usb/core/hub.c:5362 [inline]
    [<000000006a2b040a>] port_event drivers/usb/core/hub.c:5508 [inline]
    [<000000006a2b040a>] hub_event+0x118d/0x20d0 drivers/usb/core/hub.c:5590
    [<00000000d321de91>] process_one_work+0x27d/0x590 kernel/workqueue.c:2272
    [<0000000038230b58>] worker_thread+0x59/0x5d0 kernel/workqueue.c:2418
    [<00000000a1e60acf>] kthread+0x178/0x1b0 kernel/kthread.c:292
    [<00000000d5e1cdc3>] ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:296



Tested on:

commit:         4d02da97 Merge tag 'net-5.10-rc5' of git://git.kernel.org/..
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=110c7521500000
kernel config:  https://syzkaller.appspot.com/x/.config?x=b29e92cdfa2687df
dashboard link: https://syzkaller.appspot.com/bug?extid=44e64397bd81d5e84cba
compiler:       gcc (GCC) 10.1.0-syz 20200507
patch:          https://syzkaller.appspot.com/x/patch.diff?x=10a8b8f1500000

