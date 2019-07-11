Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0F29F64626
	for <lists+linux-usb@lfdr.de>; Wed, 10 Jul 2019 14:27:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726105AbfGJM1H (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 10 Jul 2019 08:27:07 -0400
Received: from mail-io1-f69.google.com ([209.85.166.69]:52122 "EHLO
        mail-io1-f69.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725956AbfGJM1H (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 10 Jul 2019 08:27:07 -0400
Received: by mail-io1-f69.google.com with SMTP id c5so2628231iom.18
        for <linux-usb@vger.kernel.org>; Wed, 10 Jul 2019 05:27:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=cbPNdpQzJQPTb9HVJLsYy4CtPaAMZo5y7btz9Zpm/eg=;
        b=B4AnKLTvhz5JeCe4qcP7nczKWJ4nDog5fNdkgw1P7EpS+GnKPkqocI1TSS7bKHG4lk
         Kg1AIjsldRWXVij39UWxidRqmsE9k3v5VlubajIf5T8hjdxcJ+8F/3gQSV0HNUkRPpNs
         PO+wSev2nzFy/0I/RZrxLRabfTP6FV7xKuxbc1mCPk7LgKfI1BT2+WSUU52nGjIvLv0G
         oZ4bLURHxOfG7BhYTcLJqKb27cH8SLTd4TFK+FCwCsEHXBlWVhwle1vRfFdKfBdVZjT0
         F/QHtEi7lFycydOfhg+W7MfcqRdB2JAwhDbRICgmQhEj5LPj2w/zxJ4sM42GeAS6FBST
         N0HQ==
X-Gm-Message-State: APjAAAX2MdBLnL6+0ek1XtvwahNlU/GEzQGZXS88CMUmm4gxtj5wueyR
        TlT1Q+wWLYoazN8pUlwupuXLzrCHB0Ie+ojiJnEFu/CvUIgb
X-Google-Smtp-Source: APXvYqxC2WOJ+cMECsMY6rhDnMnZuVe8xq6CgMdJNzgdj0lXOR81S2XqmvUD1obUIH9M7EPQw9pjCYi/1HOGKe0PWWB6pykne2b2
MIME-Version: 1.0
X-Received: by 2002:a5e:a708:: with SMTP id b8mr32636747iod.25.1562761626213;
 Wed, 10 Jul 2019 05:27:06 -0700 (PDT)
Date:   Wed, 10 Jul 2019 05:27:06 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000996786058d52cb39@google.com>
Subject: WARNING in mcba_usb_probe/usb_submit_urb
From:   syzbot <syzbot+3bc1dce0cc0052d60fde@syzkaller.appspotmail.com>
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

HEAD commit:    7829a896 usb-fuzzer: main usb gadget fuzzer driver
git tree:       https://github.com/google/kasan.git usb-fuzzer
console output: https://syzkaller.appspot.com/x/log.txt?x=16519490600000
kernel config:  https://syzkaller.appspot.com/x/.config?x=f6d4561982f71f63
dashboard link: https://syzkaller.appspot.com/bug?extid=3bc1dce0cc0052d60fde
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=13354217a00000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1071b7bfa00000

IMPORTANT: if you fix the bug, please add the following tag to the commit:
Reported-by: syzbot+3bc1dce0cc0052d60fde@syzkaller.appspotmail.com

usb 1-1: New USB device found, idVendor=04d8, idProduct=0a30,  
bcdDevice=e4.81
usb 1-1: New USB device strings: Mfr=0, Product=0, SerialNumber=0
usb 1-1: config 0 descriptor??
usb 1-1: string descriptor 0 read error: -71
------------[ cut here ]------------
usb 1-1: BOGUS urb xfer, pipe 3 != type 1
WARNING: CPU: 1 PID: 21 at drivers/usb/core/urb.c:477  
usb_submit_urb+0x1188/0x13b0 drivers/usb/core/urb.c:477
Kernel panic - not syncing: panic_on_warn set ...
CPU: 1 PID: 21 Comm: kworker/1:1 Not tainted 5.2.0-rc6+ #13
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
Code: 4d 85 ed 74 2c e8 78 db e8 fd 4c 89 f7 e8 a0 36 13 ff 41 89 d8 44 89  
e1 4c 89 ea 48 89 c6 48 c7 c7 80 23 1a 86 e8 03 a0 be fd <0f> 0b e9 20 f4  
ff ff e8 4c db e8 fd 4c 89 f2 48 b8 00 00 00 00 00
RSP: 0018:ffff8881d9eff140 EFLAGS: 00010282
RAX: 0000000000000000 RBX: 0000000000000001 RCX: 0000000000000000
RDX: 0000000000000000 RSI: ffffffff8127ef3d RDI: ffffed103b3dfe1a
RBP: ffff8881d1450700 R08: ffff8881d9e36000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000000 R12: 0000000000000003
R13: ffff8881d7f83a08 R14: ffff8881d0c5d5a0 R15: ffff8881d56ed200
  mcba_usb_start drivers/net/can/usb/mcba_usb.c:660 [inline]
  mcba_usb_probe+0x83a/0xbca drivers/net/can/usb/mcba_usb.c:846
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
