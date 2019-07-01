Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BC18432EDB
	for <lists+linux-usb@lfdr.de>; Mon,  3 Jun 2019 13:41:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728513AbfFCLlH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 3 Jun 2019 07:41:07 -0400
Received: from mail-io1-f72.google.com ([209.85.166.72]:54026 "EHLO
        mail-io1-f72.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728179AbfFCLlH (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 3 Jun 2019 07:41:07 -0400
Received: by mail-io1-f72.google.com with SMTP id c16so13684053ioo.20
        for <linux-usb@vger.kernel.org>; Mon, 03 Jun 2019 04:41:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=N91KSbXFL4D6f5EV3/LMaDoKcjhMlnwNwiDJPNrQftM=;
        b=S+cuCJ5GL9rJ7froatsyiOHWCNdIiqgHaotBMK910dvthfYK0+YEPOjauRijDtEap7
         exQlBSxeu0/d0aVbKhInmDSnhArcgC3msYZDI2hF02O+lfekOWt0GsOrf9QympVRM2Hb
         KEKNDDhrQ48pIV1uuvCjtcJXHi4cI3TfvidOlQvCiP/f5g7J8/1wI5JrORNmZsN/HSPr
         RgxYvOiX1aB0XHawMoHP04JD9LyLzaVj2vLZooXVApX/BCqGHm+NrWbKnIVA3i0PLU5q
         zPYiOj6VkD858moOiCaZhX2SE4mUzpPmBmU2kCuqSfF+/rFYqYsD1u7PQQXi8BvdMc3O
         AHpA==
X-Gm-Message-State: APjAAAV3h2rwz8BUOyLTf00TWq9A8+8waA+BHtoh6DGlq5yPl6sDUxCg
        L2Gt5RbMdNhBj/+EC928Pa05nCrg/3sbHOjYN9bUscX0mvmq
X-Google-Smtp-Source: APXvYqxVt5603kIV3dbyyP2yrORye5uVEA9JV6csaPHMPlv0ZC4SPrw3M96VT2EhZBvYsmjXdXqNNES+eT4oCEXy5tnmueUpy6Ed
MIME-Version: 1.0
X-Received: by 2002:a24:7f14:: with SMTP id r20mr15997054itc.8.1559562066102;
 Mon, 03 Jun 2019 04:41:06 -0700 (PDT)
Date:   Mon, 03 Jun 2019 04:41:06 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000f4900f058a69d6c5@google.com>
Subject: WARNING in ar5523_submit_rx_cmd/usb_submit_urb
From:   syzbot <syzbot+6101b0c732dea13ea55b@syzkaller.appspotmail.com>
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

HEAD commit:    69bbe8c7 usb-fuzzer: main usb gadget fuzzer driver
git tree:       https://github.com/google/kasan.git usb-fuzzer
console output: https://syzkaller.appspot.com/x/log.txt?x=15d280f2a00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=193d8457178b3229
dashboard link: https://syzkaller.appspot.com/bug?extid=6101b0c732dea13ea55b
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=142c0e4aa00000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1097d286a00000

IMPORTANT: if you fix the bug, please add the following tag to the commit:
Reported-by: syzbot+6101b0c732dea13ea55b@syzkaller.appspotmail.com

usb 1-1: config 0 has no interface number 0
usb 1-1: config 0 interface 61 altsetting 0 endpoint 0x81 is Bulk; changing  
to Interrupt
usb 1-1: New USB device found, idVendor=1385, idProduct=5f02,  
bcdDevice=64.86
usb 1-1: New USB device strings: Mfr=0, Product=0, SerialNumber=0
usb 1-1: config 0 descriptor??
------------[ cut here ]------------
usb 1-1: BOGUS urb xfer, pipe 3 != type 1
WARNING: CPU: 0 PID: 12 at drivers/usb/core/urb.c:477  
usb_submit_urb+0x1188/0x13b0 drivers/usb/core/urb.c:477
Kernel panic - not syncing: panic_on_warn set ...
CPU: 0 PID: 12 Comm: kworker/0:1 Not tainted 5.2.0-rc1+ #10
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS  
Google 01/01/2011
Workqueue: usb_hub_wq hub_event
Call Trace:
  __dump_stack lib/dump_stack.c:77 [inline]
  dump_stack+0xca/0x13e lib/dump_stack.c:113
  panic+0x292/0x6c9 kernel/panic.c:218
  __warn.cold+0x20/0x4b kernel/panic.c:575
  report_bug+0x262/0x2a0 lib/bug.c:186
  fixup_bug arch/x86/kernel/traps.c:179 [inline]
  fixup_bug arch/x86/kernel/traps.c:174 [inline]
  do_error_trap+0x12b/0x1e0 arch/x86/kernel/traps.c:272
  do_invalid_op+0x32/0x40 arch/x86/kernel/traps.c:291
  invalid_op+0x14/0x20 arch/x86/entry/entry_64.S:986
RIP: 0010:usb_submit_urb+0x1188/0x13b0 drivers/usb/core/urb.c:477
Code: 4d 85 ed 74 2c e8 b8 06 e9 fd 4c 89 f7 e8 c0 44 13 ff 41 89 d8 44 89  
e1 4c 89 ea 48 89 c6 48 c7 c7 20 1c 1a 86 e8 03 db be fd <0f> 0b e9 20 f4  
ff ff e8 8c 06 e9 fd 4c 89 f2 48 b8 00 00 00 00 00
RSP: 0000:ffff8881d9e0f0c0 EFLAGS: 00010286
RAX: 0000000000000000 RBX: 0000000000000001 RCX: 0000000000000000
RDX: 0000000000000000 RSI: ffffffff8127e98d RDI: ffffed103b3c1e0a
RBP: ffff8881d266af00 R08: ffff8881d9df9800 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000000 R12: 0000000000000003
R13: ffff8881cd2d9870 R14: ffff8881d09455a0 R15: ffff8881d4affa00
  ar5523_submit_rx_cmd+0x1fa/0x310  
drivers/net/wireless/ath/ar5523/ar5523.c:208
  ar5523_probe+0xbae/0x1980 drivers/net/wireless/ath/ar5523/ar5523.c:1642
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
  usb_new_device.cold+0x8c1/0x1016 drivers/usb/core/hub.c:2534
  hub_port_connect drivers/usb/core/hub.c:5089 [inline]
  hub_port_connect_change drivers/usb/core/hub.c:5204 [inline]
  port_event drivers/usb/core/hub.c:5350 [inline]
  hub_event+0x1ada/0x3590 drivers/usb/core/hub.c:5432
  process_one_work+0x905/0x1570 kernel/workqueue.c:2268
  worker_thread+0x96/0xe20 kernel/workqueue.c:2414
  kthread+0x30b/0x410 kernel/kthread.c:254
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
