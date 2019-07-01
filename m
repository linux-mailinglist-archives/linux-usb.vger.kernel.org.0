Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8F8451884D
	for <lists+linux-usb@lfdr.de>; Thu,  9 May 2019 12:27:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726576AbfEIK1G (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 9 May 2019 06:27:06 -0400
Received: from mail-it1-f200.google.com ([209.85.166.200]:37729 "EHLO
        mail-it1-f200.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725869AbfEIK1G (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 9 May 2019 06:27:06 -0400
Received: by mail-it1-f200.google.com with SMTP id d140so1715100itc.2
        for <linux-usb@vger.kernel.org>; Thu, 09 May 2019 03:27:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=FWnqg6sX3r1817LO9gnC9fDXXV3wsSjf0w4i8zX7O4Y=;
        b=ToCeG23jV/2USAu2agURhrkOiUsm98nG+2LeA0W/9DdbLhmYTR7B8EVUaAKhSTZMJv
         VIUClBqblWYH/Is/sLSzXhkpSHQc7xiP4d7gkJ+0SGcYwZXbdRk3fvECRjP9mTEKPT2c
         6JWejokkklTd43j465CEMZg83SdkAgoJwRz68CbHoNyrZzEaDynKbQXg8ORk/TpDdPtO
         /Z2qGYGqEEkd3u4US/bL7L0RMPFbgzYgASCrg6zmQdBaVU9jjEm0DA54Qo0XJB1NxQuD
         1bktojGrpYpZu/o9QSC42Y6rWmX5eABslkw0Vq86w0LMN3Hh+gnOET5t3ss77Z9b/Q86
         RRvw==
X-Gm-Message-State: APjAAAVpDTwekHJnlypkcZZRwfZGya23JSG/9EkVT03Cjs3P72JsPLj7
        kr0HXhak1l26i/0M7qji5D9CzAIcEyp+tIZTT5pirRnO8kcY
X-Google-Smtp-Source: APXvYqx2VnF7yyuNGUSk3cxaOTHyGBLkTV43ZkhuqH93/8SOoZZ0mfjGitcdq9IOtJxvf69LPaewIOxJs6g25zGuPu0ioh6o8c0a
MIME-Version: 1.0
X-Received: by 2002:a24:d941:: with SMTP id p62mr2114471itg.174.1557397625396;
 Thu, 09 May 2019 03:27:05 -0700 (PDT)
Date:   Thu, 09 May 2019 03:27:05 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000003c6794058871e40a@google.com>
Subject: general protection fault in sisusb_probe
From:   syzbot <syzbot+a0cbdbd6d169020c8959@syzkaller.appspotmail.com>
To:     andreyknvl@google.com, gregkh@linuxfoundation.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        rafael@kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,

syzbot found the following crash on:

HEAD commit:    43151d6c usb-fuzzer: main usb gadget fuzzer driver
git tree:       https://github.com/google/kasan.git usb-fuzzer
console output: https://syzkaller.appspot.com/x/log.txt?x=10e18c00a00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=4183eeef650d1234
dashboard link: https://syzkaller.appspot.com/bug?extid=a0cbdbd6d169020c8959
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)

Unfortunately, I don't have any reproducer for this crash yet.

IMPORTANT: if you fix the bug, please add the following tag to the commit:
Reported-by: syzbot+a0cbdbd6d169020c8959@syzkaller.appspotmail.com

  hub_port_connect drivers/usb/core/hub.c:5089 [inline]
  hub_port_connect_change drivers/usb/core/hub.c:5204 [inline]
  port_event drivers/usb/core/hub.c:5350 [inline]
  hub_event+0x138e/0x3b00 drivers/usb/core/hub.c:5432
  process_one_work+0x90f/0x1580 kernel/workqueue.c:2269
  worker_thread+0x9b/0xe20 kernel/workqueue.c:2415
  kthread+0x313/0x420 kernel/kthread.c:253
  ret_from_fork+0x3a/0x50 arch/x86/entry/entry_64.S:352
kasan: CONFIG_KASAN_INLINE enabled
kasan: GPF could be caused by NULL-ptr deref or user memory access
general protection fault: 0000 [#1] SMP KASAN PTI
CPU: 0 PID: 5666 Comm: kworker/0:4 Not tainted 5.1.0-rc3-319004-g43151d6 #6
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS  
Google 01/01/2011
Workqueue: usb_hub_wq hub_event
RIP: 0010:dev_name include/linux/device.h:1087 [inline]
RIP: 0010:__dev_printk+0x3f/0x215 drivers/base/core.c:3208
Code: 89 f5 53 e8 8e 53 1c fc 48 85 ed 0f 84 c9 01 00 00 e8 80 53 1c fc 48  
8d 7d 50 b8 ff ff 37 00 48 89 fa 48 c1 e0 2a 48 c1 ea 03 <80> 3c 02 00 74  
05 e8 41 68 53 fc 4c 8b 7d 50 4d 85 ff 75 28 e8 53
RSP: 0018:ffff8880994cf1c8 EFLAGS: 00010206
RAX: dffffc0000000000 RBX: ffffed1013299e40 RCX: ffffc900117a8000
RDX: 000000000000001e RSI: ffffffff855576f0 RDI: 00000000000000f0
RBP: 00000000000000a0 R08: ffff88808f13b100 R09: 0000000000000006
R10: ffff88808f13ba08 R11: ffff88808f13b100 R12: ffffffff8f031080
R13: ffff8880994cf220 R14: ffff888092c23300 R15: ffff88808e3e4c80
FS:  0000000000000000(0000) GS:ffff8880ad000000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007fd141d55000 CR3: 00000000995ae000 CR4: 00000000001406f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
  _dev_err+0xdc/0x10e drivers/base/core.c:3251
  sisusb_probe+0x1c8/0xbd6 drivers/usb/misc/sisusbvga/sisusb.c:3035
  usb_probe_interface+0x31d/0x820 drivers/usb/core/driver.c:361
  really_probe+0x2da/0xb10 drivers/base/dd.c:509
  driver_probe_device+0x21d/0x350 drivers/base/dd.c:671
  __device_attach_driver+0x1d8/0x290 drivers/base/dd.c:778
  bus_for_each_drv+0x163/0x1e0 drivers/base/bus.c:454
  __device_attach+0x223/0x3a0 drivers/base/dd.c:844
  bus_probe_device+0x1f1/0x2a0 drivers/base/bus.c:514
  device_add+0xad2/0x16e0 drivers/base/core.c:2106
  usb_set_configuration+0xdf7/0x1740 drivers/usb/core/message.c:2023
  generic_probe+0xa2/0xda drivers/usb/core/generic.c:210
  usb_probe_device+0xc0/0x150 drivers/usb/core/driver.c:266
  really_probe+0x2da/0xb10 drivers/base/dd.c:509
  driver_probe_device+0x21d/0x350 drivers/base/dd.c:671
  __device_attach_driver+0x1d8/0x290 drivers/base/dd.c:778
  bus_for_each_drv+0x163/0x1e0 drivers/base/bus.c:454
  __device_attach+0x223/0x3a0 drivers/base/dd.c:844
  bus_probe_device+0x1f1/0x2a0 drivers/base/bus.c:514
  device_add+0xad2/0x16e0 drivers/base/core.c:2106
  usb_new_device.cold+0x537/0xccf drivers/usb/core/hub.c:2534
  hub_port_connect drivers/usb/core/hub.c:5089 [inline]
  hub_port_connect_change drivers/usb/core/hub.c:5204 [inline]
  port_event drivers/usb/core/hub.c:5350 [inline]
  hub_event+0x138e/0x3b00 drivers/usb/core/hub.c:5432
  process_one_work+0x90f/0x1580 kernel/workqueue.c:2269
  worker_thread+0x9b/0xe20 kernel/workqueue.c:2415
  kthread+0x313/0x420 kernel/kthread.c:253
  ret_from_fork+0x3a/0x50 arch/x86/entry/entry_64.S:352
Modules linked in:
---[ end trace ad8f42e42c90866c ]---
RIP: 0010:dev_name include/linux/device.h:1087 [inline]
RIP: 0010:__dev_printk+0x3f/0x215 drivers/base/core.c:3208
Code: 89 f5 53 e8 8e 53 1c fc 48 85 ed 0f 84 c9 01 00 00 e8 80 53 1c fc 48  
8d 7d 50 b8 ff ff 37 00 48 89 fa 48 c1 e0 2a 48 c1 ea 03 <80> 3c 02 00 74  
05 e8 41 68 53 fc 4c 8b 7d 50 4d 85 ff 75 28 e8 53
RSP: 0018:ffff8880994cf1c8 EFLAGS: 00010206
RAX: dffffc0000000000 RBX: ffffed1013299e40 RCX: ffffc900117a8000
RDX: 000000000000001e RSI: ffffffff855576f0 RDI: 00000000000000f0
RBP: 00000000000000a0 R08: ffff88808f13b100 R09: 0000000000000006
R10: ffff88808f13ba08 R11: ffff88808f13b100 R12: ffffffff8f031080
R13: ffff8880994cf220 R14: ffff888092c23300 R15: ffff88808e3e4c80
FS:  0000000000000000(0000) GS:ffff8880ad000000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007fd141d55000 CR3: 00000000995ae000 CR4: 00000000001406f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400


---
This bug is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this bug report. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
