Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C7FD06A6A5
	for <lists+linux-usb@lfdr.de>; Tue, 16 Jul 2019 12:38:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733148AbfGPKiH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 16 Jul 2019 06:38:07 -0400
Received: from mail-io1-f70.google.com ([209.85.166.70]:33341 "EHLO
        mail-io1-f70.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732081AbfGPKiG (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 16 Jul 2019 06:38:06 -0400
Received: by mail-io1-f70.google.com with SMTP id 132so22995561iou.0
        for <linux-usb@vger.kernel.org>; Tue, 16 Jul 2019 03:38:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=oW/HWWjjYHHi5wFF5o9/pG7QsieQMhoWbLKzyHk0u8o=;
        b=tmXrivAqfu2cYUiNeM5dgi2ALlBB1yvvqdAjYvIKkSU0z4TGe6kIuTUPrXbn1lZKDj
         JVej23SZ+CGqRPERMeIZY1c9SXemaX6v0Ec2RW69RuHy+DI5iEhd8EE0Id0dvNzq9+1F
         TLAf99tdjBHl9U7Y/azsmRG9GVwjJDhcM5Qp03zZ8niUHQD0d0ehvEFKHg1t+Wv1kCre
         TuVSlLHDdzLqIx9WgH1Zos6eA6gFa5AXjdXSXTQ93CynGtLDpL6iKWPHS3sEb0m0NmAV
         r0DNbGuVpH9Ec32+gq4DFGS8oQcaK/NVLs0CqjkrUpE1xumo/EjkUW1HNFbvDevqKCQg
         VFzQ==
X-Gm-Message-State: APjAAAV1FOsUfPQolBLAaI+bh80WZxO/bBVZbDtSGnOOlrFshrcAYNOY
        SCzO6f/Y7XiO5rTT5QmAX7MYtFo40+rXbNcN+uqRKJsVdTI2
X-Google-Smtp-Source: APXvYqyqmz3/2jnkLJY2+Cc9UahCylxmUvu5/sL8Jh+77UHF8agMxF5fOSvKau9bcWkyeTZ/7TWyPfLGMoHKsrO//vFLTwUHnmzm
MIME-Version: 1.0
X-Received: by 2002:a02:9a03:: with SMTP id b3mr34355376jal.0.1563273485901;
 Tue, 16 Jul 2019 03:38:05 -0700 (PDT)
Date:   Tue, 16 Jul 2019 03:38:05 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000d06dc2058dc9f8f2@google.com>
Subject: WARNING in shark_write_reg/usb_submit_urb
From:   syzbot <syzbot+4b3f8190f6e13b3efd74@syzkaller.appspotmail.com>
To:     andreyknvl@google.com, gregkh@linuxfoundation.org,
        gustavo@embeddedor.com, linux-kernel@vger.kernel.org,
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
console output: https://syzkaller.appspot.com/x/log.txt?x=111fc400600000
kernel config:  https://syzkaller.appspot.com/x/.config?x=d90745bdf884fc0a
dashboard link: https://syzkaller.appspot.com/bug?extid=4b3f8190f6e13b3efd74
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=10784148600000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=10d826a4600000

IMPORTANT: if you fix the bug, please add the following tag to the commit:
Reported-by: syzbot+4b3f8190f6e13b3efd74@syzkaller.appspotmail.com

usb 1-1: string descriptor 0 read error: -22
usb 1-1: New USB device found, idVendor=077d, idProduct=627a, bcdDevice=  
0.10
usb 1-1: New USB device strings: Mfr=63, Product=5, SerialNumber=1
------------[ cut here ]------------
usb 1-1: BOGUS urb xfer, pipe 1 != type 3
WARNING: CPU: 1 PID: 22 at drivers/usb/core/urb.c:477  
usb_submit_urb+0x1188/0x13b0 drivers/usb/core/urb.c:477
Kernel panic - not syncing: panic_on_warn set ...
CPU: 1 PID: 22 Comm: kworker/1:1 Not tainted 5.2.0-rc6+ #14
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS  
Google 01/01/2011
Workqueue: usb_hub_wq hub_event
Call Trace:
  __dump_stack lib/dump_stack.c:77 [inline]
  dump_stack+0xca/0x13e lib/dump_stack.c:113
  panic+0x292/0x6c9 kernel/panic.c:219
  __warn.cold+0x20/0x4b kernel/panic.c:576
  report_bug+0x262/0x2a0 lib/bug.c:186
  fixup_bug arch/x86/kernel/traps.c:179 [inline]
  fixup_bug arch/x86/kernel/traps.c:174 [inline]
  do_error_trap+0x12b/0x1e0 arch/x86/kernel/traps.c:272
  do_invalid_op+0x32/0x40 arch/x86/kernel/traps.c:291
  invalid_op+0x14/0x20 arch/x86/entry/entry_64.S:986
RIP: 0010:usb_submit_urb+0x1188/0x13b0 drivers/usb/core/urb.c:477
Code: 4d 85 ed 74 2c e8 c8 69 e8 fd 4c 89 f7 e8 f0 c4 12 ff 41 89 d8 44 89  
e1 4c 89 ea 48 89 c6 48 c7 c7 60 3a 1a 86 e8 53 2e be fd <0f> 0b e9 20 f4  
ff ff e8 9c 69 e8 fd 4c 89 f2 48 b8 00 00 00 00 00
RSP: 0018:ffff8881d9f96f58 EFLAGS: 00010282
RAX: 0000000000000000 RBX: 0000000000000003 RCX: 0000000000000000
RDX: 0000000000000000 RSI: ffffffff8127ef3d RDI: ffffed103b3f2ddd
RBP: ffff8881cf557590 R08: ffff8881d9f88000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000000 R12: 0000000000000001
R13: ffff8881d0c77000 R14: ffff8881d553cd20 R15: ffff8881d5123b00
  usb_start_wait_urb+0x108/0x2b0 drivers/usb/core/message.c:57
  usb_bulk_msg+0x228/0x550 drivers/usb/core/message.c:253
  shark_write_reg+0x1ef/0x2b0 drivers/media/radio/radio-shark2.c:88
  radio_tea5777_set_freq+0x1ed/0x470 drivers/media/radio/radio-tea5777.c:213
  radio_tea5777_init+0xb7/0x600 drivers/media/radio/radio-tea5777.c:544
  usb_shark_probe+0x5b9/0x740 drivers/media/radio/radio-shark2.c:318
  usb_probe_interface+0x305/0x7a0 drivers/usb/core/driver.c:361
  really_probe+0x281/0x660 drivers/base/dd.c:509
  driver_probe_device+0x104/0x210 drivers/base/dd.c:670
  __device_attach_driver+0x1c2/0x220 drivers/base/dd.c:777
  bus_for_each_drv+0x15c/0x1e0 drivers/base/bus.c:454
  __device_attach+0x217/0x360 drivers/base/dd.c:843
  bus_probe_device+0x1e4/0x290 drivers/base/bus.c:514
  device_add+0xae6/0x16f0 drivers/base/core.c:2111
  usb_set_configuration+0xdf6/0x1670 drivers/usb/core/message.c:2023
  generic_probe+0x9d/0xd5 drivers/usb/core/generic.c:210
  usb_probe_device+0x99/0x100 drivers/usb/core/driver.c:266
  really_probe+0x281/0x660 drivers/base/dd.c:509
  driver_probe_device+0x104/0x210 drivers/base/dd.c:670
  __device_attach_driver+0x1c2/0x220 drivers/base/dd.c:777
  bus_for_each_drv+0x15c/0x1e0 drivers/base/bus.c:454
  __device_attach+0x217/0x360 drivers/base/dd.c:843
  bus_probe_device+0x1e4/0x290 drivers/base/bus.c:514
  device_add+0xae6/0x16f0 drivers/base/core.c:2111
  usb_new_device.cold+0x8c1/0x1016 drivers/usb/core/hub.c:2536
  hub_port_connect drivers/usb/core/hub.c:5098 [inline]
  hub_port_connect_change drivers/usb/core/hub.c:5213 [inline]
  port_event drivers/usb/core/hub.c:5359 [inline]
  hub_event+0x1b3d/0x35f0 drivers/usb/core/hub.c:5441
  process_one_work+0x905/0x1570 kernel/workqueue.c:2269
  worker_thread+0x96/0xe20 kernel/workqueue.c:2415
  kthread+0x30b/0x410 kernel/kthread.c:255
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
