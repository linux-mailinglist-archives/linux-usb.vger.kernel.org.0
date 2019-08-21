Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E675497A14
	for <lists+linux-usb@lfdr.de>; Wed, 21 Aug 2019 14:58:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728617AbfHUM6H (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 21 Aug 2019 08:58:07 -0400
Received: from mail-io1-f70.google.com ([209.85.166.70]:33803 "EHLO
        mail-io1-f70.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728115AbfHUM6H (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 21 Aug 2019 08:58:07 -0400
Received: by mail-io1-f70.google.com with SMTP id u84so2563322iod.1
        for <linux-usb@vger.kernel.org>; Wed, 21 Aug 2019 05:58:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=aV3bT5uZ46Z7VDX544VCGQ0p1IXFNMJP6Dbo7okYtRE=;
        b=tBZZIreoT5Jy/Kwj04CrtQS7ep69r0d8dhCD190mrkQuhBwBLQaOvzse9x93Viip3k
         +WlR9ZZCJT1DmoLjNabQeq9ctabVyskiXDuH7m8FCrdmHDOguJcw/1DXCKzLG+FkNRaX
         cyO3Nd131po18R4bHsj5+YjdKmbUq74SEpiU9i1PzRuCrWtXmEg05GseB+e/Z9eJI3SA
         2CT/Rw9Ig0fMm6kF3VjpcwyUjBvO2EXcTbNfs0eOI49SMc5EhbMGyOYyTAKY4pDaHgvw
         BS5IZPzdccSEwpEO4SaLfM1nBzUPo98WvXS7jU5MTxt6cWOgMjkNE30fmU1y7Po//93J
         L/DQ==
X-Gm-Message-State: APjAAAWi+wBvEFsDZi9njBm6pY9eqknzppgusi6uos4yntUr0UWSkdrA
        BioPCrtl3JSqbYQ28F9jPfl/kWCT+O2GC/6ZiEGwAdDVHHr6
X-Google-Smtp-Source: APXvYqxpPgnmiHnS/9kNbl9Gd4tX4rvLKqgBWuaSeEGH6tVVE5Izm7P3VTRDAq/fh1rrCVFzWRImlxKARAAs8ogFjl9D5yuSd2kt
MIME-Version: 1.0
X-Received: by 2002:a6b:fd10:: with SMTP id c16mr4436529ioi.217.1566392286780;
 Wed, 21 Aug 2019 05:58:06 -0700 (PDT)
Date:   Wed, 21 Aug 2019 05:58:06 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000d529bc0590a01f5f@google.com>
Subject: WARNING in smsusb_start_streaming/usb_submit_urb
From:   syzbot <syzbot+12002a39b8c60510f8fb@syzkaller.appspotmail.com>
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

HEAD commit:    eea39f24 usb-fuzzer: main usb gadget fuzzer driver
git tree:       https://github.com/google/kasan.git usb-fuzzer
console output: https://syzkaller.appspot.com/x/log.txt?x=139ec19c600000
kernel config:  https://syzkaller.appspot.com/x/.config?x=d0c62209eedfd54e
dashboard link: https://syzkaller.appspot.com/bug?extid=12002a39b8c60510f8fb
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=11a632ac600000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=10ed88b6600000

IMPORTANT: if you fix the bug, please add the following tag to the commit:
Reported-by: syzbot+12002a39b8c60510f8fb@syzkaller.appspotmail.com

usb 1-1: New USB device found, idVendor=2040, idProduct=c000,  
bcdDevice=b1.e9
usb 1-1: New USB device strings: Mfr=0, Product=0, SerialNumber=0
usb 1-1: config 0 descriptor??
smsusb:smsusb_probe: board id=8, interface number 0
smsusb:siano_media_device_register: media controller created
------------[ cut here ]------------
usb 1-1: BOGUS urb xfer, pipe 3 != type 1
WARNING: CPU: 1 PID: 21 at drivers/usb/core/urb.c:477  
usb_submit_urb+0x1188/0x13b0 drivers/usb/core/urb.c:477
Kernel panic - not syncing: panic_on_warn set ...
CPU: 1 PID: 21 Comm: kworker/1:1 Not tainted 5.3.0-rc5+ #28
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
RIP: 0010:usb_submit_urb+0x1188/0x13b0 drivers/usb/core/urb.c:477
Code: 4d 85 ed 74 2c e8 88 ba ef fd 4c 89 f7 e8 70 bf 1c ff 41 89 d8 44 89  
e1 4c 89 ea 48 89 c6 48 c7 c7 00 69 18 86 e8 6d a0 c5 fd <0f> 0b e9 20 f4  
ff ff e8 5c ba ef fd 4c 89 f2 48 b8 00 00 00 00 00
RSP: 0018:ffff8881da2f7018 EFLAGS: 00010282
RAX: 0000000000000000 RBX: 0000000000000001 RCX: 0000000000000000
RDX: 0000000000000000 RSI: ffffffff81288cfd RDI: ffffed103b45edf5
RBP: ffff8881d50e0550 R08: ffff8881da236000 R09: ffffed103b665d58
R10: ffffed103b665d57 R11: ffff8881db32eabf R12: 0000000000000003
R13: ffff8881d2a2cd50 R14: ffff8881d67533a0 R15: ffff8881d297c430
  smsusb_submit_urb+0x26d/0x390 drivers/media/usb/siano/smsusb.c:173
  smsusb_start_streaming+0x1f/0x87 drivers/media/usb/siano/smsusb.c:195
  smsusb_init_device+0x8aa/0x9d5 drivers/media/usb/siano/smsusb.c:475
  smsusb_probe+0x986/0xa24 drivers/media/usb/siano/smsusb.c:566
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
