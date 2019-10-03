Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D7B16CAFAE
	for <lists+linux-usb@lfdr.de>; Thu,  3 Oct 2019 21:59:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388076AbfJCT7L (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 3 Oct 2019 15:59:11 -0400
Received: from mail-io1-f71.google.com ([209.85.166.71]:50479 "EHLO
        mail-io1-f71.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388067AbfJCT7K (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 3 Oct 2019 15:59:10 -0400
Received: by mail-io1-f71.google.com with SMTP id f5so6992254iob.17
        for <linux-usb@vger.kernel.org>; Thu, 03 Oct 2019 12:59:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=JEuIBFRKOYSaCm47uiBoRRTJNID9dTGxtLXD6DzuDZY=;
        b=eDoNx1Orc/Y+KibSpIwSXp2dquHcXnNiSKCTunuHVmYFMHUmu9Cf71iHZMeTJ04vDx
         B+4PLU3I9PfusFsB496NfrlI1XhOq0XARiF4yvBrre5wpTTsm7VMquynEMZenkjTBpu0
         8G/PTeXPc3VFnbavlMM4XpuumNTQ1viBDRVUlzi7zoAA+rEuLPrMnMYJrR/w12uH2DJe
         rrRo2gedljJGEcxP3nO4m6k2ZlSfNUnsDu84uIZaubMplzLme1e9uzhscrqYL4SHZON9
         I8th3v7b+Uxin72qDxTYrXNALd3ogYmky7tu0K68uJgPNYoI84PerEwNVPZLo+EnwnFI
         SUFw==
X-Gm-Message-State: APjAAAWYYq+RRat47lzSsCoCT5OjOso9pwOeyIqBmoicY9dEzHLDxLzj
        d/rG79JZucsnQLEx3B8beKxu2Y7Y1B53fx6PUhJ82z9uRbVR
X-Google-Smtp-Source: APXvYqy+RxsZP3ma9cwKHBKOlLQeJwioBfJmorc3/irw9xRcpPg1SmLigkk1KVDYmTwYI7Byg3cM1SFi2oKLTtXT4jTkVZxSuUxb
MIME-Version: 1.0
X-Received: by 2002:a92:874e:: with SMTP id d14mr11664979ilm.143.1570132748472;
 Thu, 03 Oct 2019 12:59:08 -0700 (PDT)
Date:   Thu, 03 Oct 2019 12:59:08 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000b91acc05940704bc@google.com>
Subject: KMSAN: uninit-value in pegasus_probe
From:   syzbot <syzbot+02c9f70f3afae308464a@syzkaller.appspotmail.com>
To:     glider@google.com, gregkh@linuxfoundation.org,
        kai.heng.feng@canonical.com, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, stern@rowland.harvard.edu,
        syzkaller-bugs@googlegroups.com, yuehaibing@huawei.com
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,

syzbot found the following crash on:

HEAD commit:    124037e0 kmsan: drop inlines, rename do_kmsan_task_create()
git tree:       https://github.com/google/kmsan.git master
console output: https://syzkaller.appspot.com/x/log.txt?x=11d1ff6d600000
kernel config:  https://syzkaller.appspot.com/x/.config?x=f03c659d0830ab8d
dashboard link: https://syzkaller.appspot.com/bug?extid=02c9f70f3afae308464a
compiler:       clang version 9.0.0 (/home/glider/llvm/clang  
80fee25776c2fb61e74c1ecb1a523375c2500b69)
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1115ed6b600000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=144964cb600000

IMPORTANT: if you fix the bug, please add the following tag to the commit:
Reported-by: syzbot+02c9f70f3afae308464a@syzkaller.appspotmail.com

usb 1-1: New USB device strings: Mfr=1, Product=2, SerialNumber=3
usb 1-1: Product: syz
usb 1-1: Manufacturer: syz
usb 1-1: SerialNumber: syz
usb 1-1: config 0 descriptor??
(unnamed net_device) (uninitialized): read_eprom_word failed
=====================================================
BUG: KMSAN: uninit-value in usb_probe_interface+0xd19/0x1310  
drivers/usb/core/driver.c:361
CPU: 1 PID: 17 Comm: kworker/1:0 Not tainted 5.3.0-rc7+ #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS  
Google 01/01/2011
Workqueue: usb_hub_wq hub_event
Call Trace:
  __dump_stack lib/dump_stack.c:77 [inline]
  dump_stack+0x191/0x1f0 lib/dump_stack.c:113
  kmsan_report+0x13a/0x2b0 mm/kmsan/kmsan_report.c:108
  __msan_warning+0x73/0xe0 mm/kmsan/kmsan_instr.c:250
  get_interrupt_interval drivers/net/usb/pegasus.c:758 [inline]
  pegasus_probe+0x10b7/0x4be0 drivers/net/usb/pegasus.c:1189
  usb_probe_interface+0xd19/0x1310 drivers/usb/core/driver.c:361
  really_probe+0x1373/0x1dc0 drivers/base/dd.c:552
  driver_probe_device+0x1ba/0x510 drivers/base/dd.c:709
  __device_attach_driver+0x5b8/0x790 drivers/base/dd.c:816
  bus_for_each_drv+0x28e/0x3b0 drivers/base/bus.c:454
  __device_attach+0x489/0x750 drivers/base/dd.c:882
  device_initial_probe+0x4a/0x60 drivers/base/dd.c:929
  bus_probe_device+0x131/0x390 drivers/base/bus.c:514
  device_add+0x25b5/0x2df0 drivers/base/core.c:2165
  usb_set_configuration+0x309f/0x3710 drivers/usb/core/message.c:2027
  generic_probe+0xe7/0x280 drivers/usb/core/generic.c:210
  usb_probe_device+0x146/0x200 drivers/usb/core/driver.c:266
  really_probe+0x1373/0x1dc0 drivers/base/dd.c:552
  driver_probe_device+0x1ba/0x510 drivers/base/dd.c:709
  __device_attach_driver+0x5b8/0x790 drivers/base/dd.c:816
  bus_for_each_drv+0x28e/0x3b0 drivers/base/bus.c:454
  __device_attach+0x489/0x750 drivers/base/dd.c:882
  device_initial_probe+0x4a/0x60 drivers/base/dd.c:929
  bus_probe_device+0x131/0x390 drivers/base/bus.c:514
  device_add+0x25b5/0x2df0 drivers/base/core.c:2165
  usb_new_device+0x23e5/0x2fb0 drivers/usb/core/hub.c:2536
  hub_port_connect drivers/usb/core/hub.c:5098 [inline]
  hub_port_connect_change drivers/usb/core/hub.c:5213 [inline]
  port_event drivers/usb/core/hub.c:5359 [inline]
  hub_event+0x581d/0x72f0 drivers/usb/core/hub.c:5441
  process_one_work+0x1572/0x1ef0 kernel/workqueue.c:2269
  worker_thread+0x111b/0x2460 kernel/workqueue.c:2415
  kthread+0x4b5/0x4f0 kernel/kthread.c:256
  ret_from_fork+0x35/0x40 arch/x86/entry/entry_64.S:355

Local variable description: ----data.i@pegasus_probe
Variable was created at:
  get_interrupt_interval drivers/net/usb/pegasus.c:1188 [inline]
  pegasus_probe+0xef3/0x4be0 drivers/net/usb/pegasus.c:1189
  usb_probe_interface+0xd19/0x1310 drivers/usb/core/driver.c:361
=====================================================


---
This bug is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this bug report. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
syzbot can test patches for this bug, for details see:
https://goo.gl/tpsmEJ#testing-patches
