Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A1B5771893
	for <lists+linux-usb@lfdr.de>; Tue, 23 Jul 2019 14:48:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389941AbfGWMsV (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 23 Jul 2019 08:48:21 -0400
Received: from mail-io1-f72.google.com ([209.85.166.72]:53406 "EHLO
        mail-io1-f72.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389903AbfGWMsK (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 23 Jul 2019 08:48:10 -0400
Received: by mail-io1-f72.google.com with SMTP id h3so47105478iob.20
        for <linux-usb@vger.kernel.org>; Tue, 23 Jul 2019 05:48:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=kQbHTv12UWJ75r48zbBLw3Y6lUFzP91zXHFCNF2crgY=;
        b=CGDsZFi70CGKrJeEsH5b4IeTQ094qSmEGcWtdJwZTw7KBTIouVsXahG3rDnuuF17m6
         jnc1Gra2HYyhcdk5wzmrxP/FjzpNplw8MUq0KWN9efbWQEmKeQyuo7bmkcZmPsdfWyfW
         VO6c0LxzH/OjftaKMqVzKMmtidt8PlFcSp00Ekjtus+1OsBkY9wrbTjuOFXR0VnBwmGa
         PDZ7qfyiGqAc54NEhEqt32IxERo8NTHcdDw79wckHrU7aqQHbxeR82NFcBh/xWvVf25Q
         660wGNb1TdyHHPHP7EElsw2u/Dev25v23KawsP40BoMh1I/61PQvqaQvXEKsMIOmphHK
         /4fg==
X-Gm-Message-State: APjAAAUvh0tkL9nmkcMWmq35tm6pkIMEPkVwgiF3XdX7YUMew0sy2Z7q
        SUBEa0fHDN4v0IksRE3UrZA6I1WpDFDD8dzX0DoqE+/buHkj
X-Google-Smtp-Source: APXvYqyHjYV9xpc7g0W38YsQCuopju9KIve1wsoLO+Nr624Nb4j2UPzeOYHu79ZXHFo0HDjVpFujRQ8Of9pknXJ4Am4c+Anp2r3A
MIME-Version: 1.0
X-Received: by 2002:a5d:9047:: with SMTP id v7mr3057021ioq.18.1563886089437;
 Tue, 23 Jul 2019 05:48:09 -0700 (PDT)
Date:   Tue, 23 Jul 2019 05:48:09 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000d48965058e589a94@google.com>
Subject: kernel BUG at drivers/usb/wusbcore/wusbhc.c:LINE!
From:   syzbot <syzbot+fd2bd7df88c606eea4ef@syzkaller.appspotmail.com>
To:     andreyknvl@google.com, gregkh@linuxfoundation.org, joe@perches.com,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        louis@kragniz.eu, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,

syzbot found the following crash on:

HEAD commit:    6a3599ce usb-fuzzer: main usb gadget fuzzer driver
git tree:       https://github.com/google/kasan.git usb-fuzzer
console output: https://syzkaller.appspot.com/x/log.txt?x=1417be94600000
kernel config:  https://syzkaller.appspot.com/x/.config?x=700ca426ab83faae
dashboard link: https://syzkaller.appspot.com/bug?extid=fd2bd7df88c606eea4ef
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=15d5d25c600000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=15c29358600000

IMPORTANT: if you fix the bug, please add the following tag to the commit:
Reported-by: syzbot+fd2bd7df88c606eea4ef@syzkaller.appspotmail.com

usb 1-1: BUG? WUSB host has no security descriptors
hwa-hc 1-1:0.66: Wireless USB HWA host controller
hwa-hc 1-1:0.66: new USB bus registered, assigned bus number 11
hwa-hc 1-1:0.66: Cannot set WUSB Cluster ID to 0xfe: -71
hwa-hc 1-1:0.66: Wireless USB Cluster ID set to 0xfe
------------[ cut here ]------------
kernel BUG at drivers/usb/wusbcore/wusbhc.c:385!
invalid opcode: 0000 [#1] SMP KASAN
CPU: 1 PID: 21 Comm: kworker/1:1 Not tainted 5.2.0-rc6+ #15
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS  
Google 01/01/2011
Workqueue: usb_hub_wq hub_event
RIP: 0010:wusb_cluster_id_put+0x6b/0x80 /drivers/usb/wusbcore/wusbhc.c:385
Code: 7b 9d ce fd 40 84 ed 74 23 e8 41 9c ce fd f0 48 0f b3 1d e8 d6 0e 06  
5b 48 c7 c7 60 1b 06 87 5d e9 8a 3c e9 01 e8 25 9c ce fd <0f> 0b e8 1e 9c  
ce fd 0f 0b eb d4 66 2e 0f 1f 84 00 00 00 00 00 41
RSP: 0018:ffff8881d9eff0e8 EFLAGS: 00010293
RAX: ffff8881d9e36000 RBX: 00000000ffffffff RCX: ffffffff836e3f37
RDX: 0000000000000000 RSI: ffffffff836e3f8b RDI: 0000000000000001
RBP: 00000000000000fe R08: ffff8881d9e36000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000000 R12: 00000000ffffffb9
R13: ffff8881d4a52600 R14: ffff8881d0b5d530 R15: 00000000000000fe
FS:  0000000000000000(0000) GS:ffff8881db300000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007efcea69e000 CR3: 00000001d4f3a000 CR4: 00000000001406e0
Call Trace:
  hwahc_op_start.cold+0x159/0x183 /drivers/usb/host/hwa-hc.c:162
  usb_add_hcd.cold+0xaac/0x15a1 /drivers/usb/core/hcd.c:2887
  hwahc_probe.cold+0xef/0x48b /drivers/usb/host/hwa-hc.c:810
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
Modules linked in:
---[ end trace 328f1b9a8fbb35b6 ]---
RIP: 0010:wusb_cluster_id_put+0x6b/0x80 /drivers/usb/wusbcore/wusbhc.c:385
Code: 7b 9d ce fd 40 84 ed 74 23 e8 41 9c ce fd f0 48 0f b3 1d e8 d6 0e 06  
5b 48 c7 c7 60 1b 06 87 5d e9 8a 3c e9 01 e8 25 9c ce fd <0f> 0b e8 1e 9c  
ce fd 0f 0b eb d4 66 2e 0f 1f 84 00 00 00 00 00 41
RSP: 0018:ffff8881d9eff0e8 EFLAGS: 00010293
RAX: ffff8881d9e36000 RBX: 00000000ffffffff RCX: ffffffff836e3f37
RDX: 0000000000000000 RSI: ffffffff836e3f8b RDI: 0000000000000001
RBP: 00000000000000fe R08: ffff8881d9e36000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000000 R12: 00000000ffffffb9
R13: ffff8881d4a52600 R14: ffff8881d0b5d530 R15: 00000000000000fe
FS:  0000000000000000(0000) GS:ffff8881db300000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007efcea69e000 CR3: 00000001d4f3a000 CR4: 00000000001406e0


---
This bug is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this bug report. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
syzbot can test patches for this bug, for details see:
https://goo.gl/tpsmEJ#testing-patches
