Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9B2FFA683B
	for <lists+linux-usb@lfdr.de>; Tue,  3 Sep 2019 14:09:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729015AbfICMJA (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 3 Sep 2019 08:09:00 -0400
Received: from mail-io1-f72.google.com ([209.85.166.72]:47537 "EHLO
        mail-io1-f72.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729096AbfICMIL (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 3 Sep 2019 08:08:11 -0400
Received: by mail-io1-f72.google.com with SMTP id b22so22814380iod.14
        for <linux-usb@vger.kernel.org>; Tue, 03 Sep 2019 05:08:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=CxUZjygCpasgBPF+y6oi8xFjs0AF9HB9H4iCmjReROA=;
        b=mAztyqN1vohl3QCnzjNuTcN9H3Bn34eWJ+z9pNLpAUP1odQKc1VTjSH4OKEr0Fj+CG
         xzB+bL5NnApIXuKkZ5I05WWkVHoiOMbTh1FKTcutB33S1aky2ekFhLcDMSOXzDGPWjXe
         fq+Vk5Z2GRmJ2CR0ZKCf0kAVhuWxRYZnDaufTlC3xQrkFty9ODFJzuTGyPmC6lETwHSb
         aDdUMWDQ1BT5Oyw4S/UBsCA2xcby6FMsL0fg2aJ92n2KI6zn3S24bC5lE38/yqvmihkb
         GebJKS8nKwilwDVqVr6Y+YlAT87zbtHpVfYe0dNXOxYBhiQafbzbvvkT8CjUCuW6SALV
         NhJA==
X-Gm-Message-State: APjAAAUoO30wloOrjDuEXvXNJvslSsIkg0F/M2H3YH1M6YNeo791OzfV
        g5jVyNpTLoJ1GVZO73n9u361e8FFZcZQxdThk1UDwL+jLYtL
X-Google-Smtp-Source: APXvYqxJaDVBHS+iGbOfAA2e4mOzogSUuWdHkrWEZqKdilXl6J5OAzbdJdVyXU1F8zsOLcuxFRx7RNEyHuu2a2/6l2VRLzfXwaYU
MIME-Version: 1.0
X-Received: by 2002:a02:81c5:: with SMTP id r5mr37662960jag.143.1567512490314;
 Tue, 03 Sep 2019 05:08:10 -0700 (PDT)
Date:   Tue, 03 Sep 2019 05:08:10 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000002a95df0591a4f114@google.com>
Subject: WARNING in hso_free_net_device
From:   syzbot <syzbot+44d53c7255bb1aea22d2@syzkaller.appspotmail.com>
To:     alexios.zavras@intel.com, andreyknvl@google.com,
        benquike@gmail.com, davem@davemloft.net,
        gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, mathias.payer@nebelwelt.net,
        netdev@vger.kernel.org, rfontana@redhat.com,
        syzkaller-bugs@googlegroups.com, tglx@linutronix.de
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,

syzbot found the following crash on:

HEAD commit:    eea39f24 usb-fuzzer: main usb gadget fuzzer driver
git tree:       https://github.com/google/kasan.git usb-fuzzer
console output: https://syzkaller.appspot.com/x/log.txt?x=15f17e61600000
kernel config:  https://syzkaller.appspot.com/x/.config?x=d0c62209eedfd54e
dashboard link: https://syzkaller.appspot.com/bug?extid=44d53c7255bb1aea22d2
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=10ffdd12600000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=15a738fe600000

IMPORTANT: if you fix the bug, please add the following tag to the commit:
Reported-by: syzbot+44d53c7255bb1aea22d2@syzkaller.appspotmail.com

usb 1-1: config 0 has no interface number 0
usb 1-1: New USB device found, idVendor=0af0, idProduct=d257,  
bcdDevice=4e.87
usb 1-1: New USB device strings: Mfr=0, Product=0, SerialNumber=0
usb 1-1: config 0 descriptor??
hso 1-1:0.15: Can't find BULK IN endpoint
------------[ cut here ]------------
WARNING: CPU: 1 PID: 83 at net/core/dev.c:8167  
rollback_registered_many.cold+0x41/0x1bc net/core/dev.c:8167
Kernel panic - not syncing: panic_on_warn set ...
CPU: 1 PID: 83 Comm: kworker/1:2 Not tainted 5.3.0-rc5+ #28
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS  
Google 01/01/2011
Workqueue: usb_hub_wq hub_event
Call Trace:
  __dump_stack lib/dump_stack.c:77 [inline]
  dump_stack+0xca/0x13e lib/dump_stack.c:113
  panic+0x2a3/0x6da kernel/panic.c:219
  __warn.cold+0x20/0x4a kernel/panic.c:576
  report_bug+0x262/0x2a0 lib/bug.c:186
  fixup_bug arch/x86/kernel/traps.c:179 [inline]
  fixup_bug arch/x86/kernel/traps.c:174 [inline]
  do_error_trap+0x12b/0x1e0 arch/x86/kernel/traps.c:272
  do_invalid_op+0x32/0x40 arch/x86/kernel/traps.c:291
  invalid_op+0x23/0x30 arch/x86/entry/entry_64.S:1028
RIP: 0010:rollback_registered_many.cold+0x41/0x1bc net/core/dev.c:8167
Code: ff e8 c7 26 90 fc 48 c7 c7 40 ec 63 86 e8 24 c8 7a fc 0f 0b e9 93 be  
ff ff e8 af 26 90 fc 48 c7 c7 40 ec 63 86 e8 0c c8 7a fc <0f> 0b 4c 89 e7  
e8 f9 12 34 fd 31 ff 41 89 c4 89 c6 e8 bd 27 90 fc
RSP: 0018:ffff8881d934f088 EFLAGS: 00010282
RAX: 0000000000000024 RBX: ffff8881d2ad4400 RCX: 0000000000000000
RDX: 0000000000000000 RSI: ffffffff81288cfd RDI: ffffed103b269e03
RBP: ffff8881d934f1b8 R08: 0000000000000024 R09: fffffbfff11ad794
R10: fffffbfff11ad793 R11: ffffffff88d6bc9f R12: ffff8881d2ad4470
R13: ffff8881d934f148 R14: dffffc0000000000 R15: 0000000000000000
  rollback_registered+0xf2/0x1c0 net/core/dev.c:8243
  unregister_netdevice_queue net/core/dev.c:9290 [inline]
  unregister_netdevice_queue+0x1d7/0x2b0 net/core/dev.c:9283
  unregister_netdevice include/linux/netdevice.h:2631 [inline]
  unregister_netdev+0x18/0x20 net/core/dev.c:9331
  hso_free_net_device+0xff/0x300 drivers/net/usb/hso.c:2366
  hso_create_net_device+0x76d/0x9c0 drivers/net/usb/hso.c:2554
  hso_probe+0x28d/0x1a46 drivers/net/usb/hso.c:2931
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
Kernel Offset: disabled
Rebooting in 86400 seconds..


---
This bug is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this bug report. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
syzbot can test patches for this bug, for details see:
https://goo.gl/tpsmEJ#testing-patches
