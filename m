Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 517366CE30
	for <lists+linux-usb@lfdr.de>; Thu, 18 Jul 2019 14:38:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727854AbfGRMiH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 18 Jul 2019 08:38:07 -0400
Received: from mail-io1-f72.google.com ([209.85.166.72]:34979 "EHLO
        mail-io1-f72.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726715AbfGRMiH (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 18 Jul 2019 08:38:07 -0400
Received: by mail-io1-f72.google.com with SMTP id w17so30796852iom.2
        for <linux-usb@vger.kernel.org>; Thu, 18 Jul 2019 05:38:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=u7HqfBYFoyBr31q/eDQJyFD96fdHNqTfO5d5+sMVgCY=;
        b=gnG1g+SrgqFtUCS2yv4M2sS01tpJP1cM9VEPrLnq/xKQbBiqeOC+s8WqatQzpW2TTA
         QFwiANM0K89pGhAoP/intkL0iPP3WTS58QF0E8Duw2QAx4qICB9Y8G9WHKt1SVtNvjCx
         DWvMSlWUG1wgHg6b48fk9LRUMDLfGXrfg46GVdtMmgA9mONEoQS3Bq6KT9C0G0kRhaoK
         oNxhFgmxsx1yDOj/4uVjxhoDAiLTxsY5TpoldJMbvNp0PDvkwnhS+3Gv8Wh/JV3DWlMS
         tLqB5tmNQ6+zqvp3GWQQw8bWeIrCCluTHIKean7f+foORDBTKv111Aabj7hOpWB62rTH
         ADjQ==
X-Gm-Message-State: APjAAAXWtbGfnCOM7srORlMwsXIk3T3rjQnJwfebFMXzbAkH70Dl42g3
        P3KJ7/D5yBdu8WufvGuNRd2ixqX8ugRYzxCHtat8UIpAobaV
X-Google-Smtp-Source: APXvYqzWVmLcMYtdAMQ5iTKIBQHmXwnaCwpV82M9lq3wT2Vd+53ncblD+sW79HU67FSwb9NtamBXJdMSsioTxYz69aacFN830XOy
MIME-Version: 1.0
X-Received: by 2002:a05:6638:63a:: with SMTP id h26mr47624454jar.92.1563453485607;
 Thu, 18 Jul 2019 05:38:05 -0700 (PDT)
Date:   Thu, 18 Jul 2019 05:38:05 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000a1f357058df3e10b@google.com>
Subject: WARNING in snd_usb_apply_boot_quirk/usb_submit_urb
From:   syzbot <syzbot+4dda1bca161e5d7690c5@syzkaller.appspotmail.com>
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
console output: https://syzkaller.appspot.com/x/log.txt?x=11a9bbe0600000
kernel config:  https://syzkaller.appspot.com/x/.config?x=700ca426ab83faae
dashboard link: https://syzkaller.appspot.com/bug?extid=4dda1bca161e5d7690c5
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=153009a4600000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=15e6f68fa00000

IMPORTANT: if you fix the bug, please add the following tag to the commit:
Reported-by: syzbot+4dda1bca161e5d7690c5@syzkaller.appspotmail.com

usb 1-1: config 6 interface 14 altsetting 0 bulk endpoint 0x5 has invalid  
maxpacket 4
usb 1-1: New USB device found, idVendor=133e, idProduct=0815,  
bcdDevice=a4.d4
usb 1-1: New USB device strings: Mfr=0, Product=0, SerialNumber=0
------------[ cut here ]------------
usb 1-1: BOGUS urb xfer, pipe 1 != type 3
WARNING: CPU: 0 PID: 12 at drivers/usb/core/urb.c:477  
usb_submit_urb+0x1188/0x13b0 /drivers/usb/core/urb.c:477
Kernel panic - not syncing: panic_on_warn set ...
CPU: 0 PID: 12 Comm: kworker/0:1 Not tainted 5.2.0-rc6+ #15
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS  
Google 01/01/2011
Workqueue: usb_hub_wq hub_event
Call Trace:
  __dump_stack /lib/dump_stack.c:77 [inline]
  dump_stack+0xca/0x13e /lib/dump_stack.c:113
  panic+0x292/0x6c9 /kernel/panic.c:219
  __warn.cold+0x20/0x4b /kernel/panic.c:576
  report_bug+0x262/0x2a0 /lib/bug.c:186
  fixup_bug /arch/x86/kernel/traps.c:179 [inline]
  fixup_bug /arch/x86/kernel/traps.c:174 [inline]
  do_error_trap+0x12b/0x1e0 /arch/x86/kernel/traps.c:272
  do_invalid_op+0x32/0x40 /arch/x86/kernel/traps.c:291
  invalid_op+0x14/0x20 /arch/x86/entry/entry_64.S:986
RIP: 0010:usb_submit_urb+0x1188/0x13b0 /drivers/usb/core/urb.c:477
Code: 4d 85 ed 74 2c e8 f8 d3 f4 fd 4c 89 f7 e8 a0 51 1c ff 41 89 d8 44 89  
e1 4c 89 ea 48 89 c6 48 c7 c7 00 0e f7 85 e8 83 98 ca fd <0f> 0b e9 20 f4  
ff ff e8 cc d3 f4 fd 4c 89 f2 48 b8 00 00 00 00 00
RSP: 0018:ffff8881d9e0ef00 EFLAGS: 00010282
RAX: 0000000000000000 RBX: 0000000000000003 RCX: 0000000000000000
RDX: 0000000000000000 RSI: ffffffff8127ef3d RDI: ffffed103b3c1dd2
RBP: ffff8881d39fdd00 R08: ffff8881d9df9800 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000000 R12: 0000000000000001
R13: ffff8881cdc57b40 R14: ffff8881cff78920 R15: ffff8881d4a84900
  usb_start_wait_urb+0x108/0x2b0 /drivers/usb/core/message.c:57
  usb_bulk_msg+0x228/0x550 /drivers/usb/core/message.c:253
  snd_usb_accessmusic_boot_quirk /sound/usb/quirks.c:838 [inline]
  snd_usb_apply_boot_quirk+0x99e/0xb30 /sound/usb/quirks.c:1255
  usb_audio_probe+0x2ec/0x2010 /sound/usb/card.c:576
  usb_probe_interface+0x305/0x7a0 /drivers/usb/core/driver.c:361
  really_probe+0x281/0x660 /drivers/base/dd.c:509
  driver_probe_device+0x104/0x210 /drivers/base/dd.c:670
  __device_attach_driver+0x1c2/0x220 /drivers/base/dd.c:777
  bus_for_each_drv+0x15c/0x1e0 /drivers/base/bus.c:454
  __device_attach+0x217/0x360 /drivers/base/dd.c:843
  bus_probe_device+0x1e4/0x290 /drivers/base/bus.c:514
  device_add+0xae6/0x16f0 /drivers/base/core.c:2111
  usb_set_configuration+0xdf6/0x1670 /drivers/usb/core/message.c:2023
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
