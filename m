Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 777CC7189C
	for <lists+linux-usb@lfdr.de>; Tue, 23 Jul 2019 14:48:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389902AbfGWMsb (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 23 Jul 2019 08:48:31 -0400
Received: from mail-io1-f71.google.com ([209.85.166.71]:33597 "EHLO
        mail-io1-f71.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389897AbfGWMsJ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 23 Jul 2019 08:48:09 -0400
Received: by mail-io1-f71.google.com with SMTP id 132so47068896iou.0
        for <linux-usb@vger.kernel.org>; Tue, 23 Jul 2019 05:48:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=t+YWD8TtbpdqccHCrrP62enFfLxTdbJeCf2c+ry+YR4=;
        b=SRbCsP3ciIOtJ07eX3M6EshPqntqrMRz8doChQMvxhYWW8Ns8Bk/ixQiAiPbDQeguE
         Rlji63J2LEtVq2P7+6YYKgiXV4QBG/3iheaZ7fUUdIdyu4DsTS/Fmvb10ABWv7uYJd+B
         2tik/GQKZ+VqWaPpLeL2oNpDkEI4YT4Payitpe4Dra6fDue7BHCmp83JydAU6qGN8oAZ
         MSEBaOMa6v/iMJhEwSpZnWgcZ3AqMSqOLzq8Qft9Bfy3rStJmcvqF/UvWGXgcz5oaWxZ
         TZxiHFbdVZm3G24WvYV657U8HRKAoS1TAFrXHqAVfdi1hrAN5EmIpuLi1oxGzXJ2EOi2
         BLVQ==
X-Gm-Message-State: APjAAAU/fdS5COPD0Xsw9X6FDFkzx4NagHgGS6Z4EHXYMxNXD/YXU1xh
        3AnSg5F5Mre37JwR+nM6RIEztxs/cFLiAAZC5xK1DCFux30r
X-Google-Smtp-Source: APXvYqyJvgapzmep02x2R/yw6+ozhJuRJ8ynEeOBtTNPKbuYXM0yIdE5zzc69CYIQHIUAKHY/YxLcPWwRIFEhI3F+YRS2nPtyjFg
MIME-Version: 1.0
X-Received: by 2002:a6b:6f09:: with SMTP id k9mr7633031ioc.223.1563886088898;
 Tue, 23 Jul 2019 05:48:08 -0700 (PDT)
Date:   Tue, 23 Jul 2019 05:48:08 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000cc4fbc058e589a10@google.com>
Subject: WARNING: ODEBUG bug in smsusb_term_device
From:   syzbot <syzbot+25ddf1bb485cd9400ca4@syzkaller.appspotmail.com>
To:     andreyknvl@google.com, linux-kernel@vger.kernel.org,
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
console output: https://syzkaller.appspot.com/x/log.txt?x=14d4a74c600000
kernel config:  https://syzkaller.appspot.com/x/.config?x=700ca426ab83faae
dashboard link: https://syzkaller.appspot.com/bug?extid=25ddf1bb485cd9400ca4
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=13fc4d34600000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=13e7b678600000

IMPORTANT: if you fix the bug, please add the following tag to the commit:
Reported-by: syzbot+25ddf1bb485cd9400ca4@syzkaller.appspotmail.com

smsusb:smsusb_init_device: smscore_start_device(...) failed
------------[ cut here ]------------
ODEBUG: free active (active state 0) object type: work_struct hint:  
do_submit_urb+0x0/0x60 /drivers/media/usb/siano/smsusb.c:155
WARNING: CPU: 1 PID: 22 at lib/debugobjects.c:325  
debug_print_object+0x160/0x250 /lib/debugobjects.c:325
Kernel panic - not syncing: panic_on_warn set ...
CPU: 1 PID: 22 Comm: kworker/1:1 Not tainted 5.2.0-rc6+ #15
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
RIP: 0010:debug_print_object+0x160/0x250 /lib/debugobjects.c:325
Code: dd e0 16 ba 85 48 89 fa 48 c1 ea 03 80 3c 02 00 0f 85 bf 00 00 00 48  
8b 14 dd e0 16 ba 85 48 c7 c7 c0 0c ba 85 e8 db c7 33 ff <0f> 0b 83 05 03  
6e 86 05 01 48 83 c4 20 5b 5d 41 5c 41 5d c3 48 89
RSP: 0018:ffff8881d9f8efb8 EFLAGS: 00010082
RAX: 0000000000000000 RBX: 0000000000000003 RCX: 0000000000000000
RDX: 0000000000000000 RSI: ffffffff8127ef3d RDI: ffffed103b3f1de9
RBP: 0000000000000001 R08: ffff8881d9f80000 R09: ffffed103b663ed7
R10: ffffed103b663ed6 R11: ffff8881db31f6b7 R12: ffffffff86ac9ea0
R13: ffffffff81187f60 R14: ffffffff88f0e3e8 R15: ffff8881cf581bc0
  __debug_check_no_obj_freed /lib/debugobjects.c:785 [inline]
  debug_check_no_obj_freed+0x2a3/0x42e /lib/debugobjects.c:817
  slab_free_hook /mm/slub.c:1418 [inline]
  slab_free_freelist_hook /mm/slub.c:1448 [inline]
  slab_free /mm/slub.c:2994 [inline]
  kfree+0x101/0x280 /mm/slub.c:3949
  smsusb_term_device+0xc2/0x120 /drivers/media/usb/siano/smsusb.c:350
  smsusb_init_device+0x987/0x9d5 /drivers/media/usb/siano/smsusb.c:487
  smsusb_probe+0x986/0xa24 /drivers/media/usb/siano/smsusb.c:566
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

======================================================


---
This bug is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this bug report. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
syzbot can test patches for this bug, for details see:
https://goo.gl/tpsmEJ#testing-patches
