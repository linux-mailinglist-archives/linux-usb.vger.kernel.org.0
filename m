Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4AEBB1F850
	for <lists+linux-usb@lfdr.de>; Wed, 15 May 2019 18:17:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726672AbfEOQRG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 15 May 2019 12:17:06 -0400
Received: from mail-it1-f200.google.com ([209.85.166.200]:42372 "EHLO
        mail-it1-f200.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726084AbfEOQRG (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 15 May 2019 12:17:06 -0400
Received: by mail-it1-f200.google.com with SMTP id t196so496630ita.7
        for <linux-usb@vger.kernel.org>; Wed, 15 May 2019 09:17:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=/kDWjBB0jCL1YtbOqkI5qZw4O964lNtmlxXi0fZixK4=;
        b=grmGZEAPyjwyljTToAZOGg702J79VeN5FMsfmIho/r2pHGlGI5ByubFt0PSGrdZh67
         5pVqHYT26i5gCQv67PFinPjoe/Cm/asz95DKz8WH4g+JXpePUaUbvDrY6RqFFhW910Cs
         ssF5ba+d4xmKZhIHgJMo8MoHrLkqFysw+pS/DwOHGx1c2me300jVehlSPHo2dG2gBqAs
         CfbdfThORkwrw3uDrG52FkskZBdiInZYjjMpsbhCjr4uzP9MCmUci4CCa59aubufEg2x
         LSe2xwutgzF4oyEQMg+56VCRoLqpTE+mEzoMUlRd3YlWVgNMqBsbwbSufSW4EPDCGEzW
         VJtw==
X-Gm-Message-State: APjAAAVcrZqEUiLTX9kq6OStTkx0x2V1BmjCoswKX97/C+zHP+FbZFd4
        BsYvtgOtPmwtTuZKEy2GtIuf9qaGmYUNpb1j/4KPGN/3SjvI
X-Google-Smtp-Source: APXvYqykB3D2KbCA7ppkwMbMaz0GBUsa4he0CqdKkR9zOB32utCtFaO9CnEDA1gWJIHqbSHQyKnO4IeewHu+FyaoAvArH2q7TINb
MIME-Version: 1.0
X-Received: by 2002:a24:edcb:: with SMTP id r194mr8724352ith.164.1557937025379;
 Wed, 15 May 2019 09:17:05 -0700 (PDT)
Date:   Wed, 15 May 2019 09:17:05 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000faf6000588ef7a11@google.com>
Subject: KASAN: slab-out-of-bounds Read in au0828_rc_unregister (2)
From:   syzbot <syzbot+357d86bcb4cca1a2f572@syzkaller.appspotmail.com>
To:     andreyknvl@google.com, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-usb@vger.kernel.org,
        mchehab@kernel.org, sean@mess.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,

syzbot found the following crash on:

HEAD commit:    43151d6c usb-fuzzer: main usb gadget fuzzer driver
git tree:       https://github.com/google/kasan.git usb-fuzzer
console output: https://syzkaller.appspot.com/x/log.txt?x=162ca944a00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=95aff7278e7ff25e
dashboard link: https://syzkaller.appspot.com/bug?extid=357d86bcb4cca1a2f572
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)

Unfortunately, I don't have any reproducer for this crash yet.

IMPORTANT: if you fix the bug, please add the following tag to the commit:
Reported-by: syzbot+357d86bcb4cca1a2f572@syzkaller.appspotmail.com

au0828: recv_control_msg() Failed receiving control message, error -71.
au0828: recv_control_msg() Failed receiving control message, error -71.
au0828: recv_control_msg() Failed receiving control message, error -71.
au8522_writereg: writereg error (reg == 0x106, val == 0x0001, ret == -5)
usb 4-1: selecting invalid altsetting 5
au0828: Failure setting usb interface0 to as5
au0828: au0828_usb_probe() au0828_analog_register failed to register on V4L2
==================================================================
BUG: KASAN: slab-out-of-bounds in au0828_rc_unregister+0x9a/0xb0  
drivers/media/usb/au0828/au0828-input.c:353
Read of size 8 at addr ffff8881cb76f308 by task kworker/1:5/5626

CPU: 1 PID: 5626 Comm: kworker/1:5 Not tainted 5.1.0-rc3+ #8
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS  
Google 01/01/2011
Workqueue: usb_hub_wq hub_event
Call Trace:
  __dump_stack lib/dump_stack.c:77 [inline]
  dump_stack+0xca/0x13e lib/dump_stack.c:113
  print_address_description+0x67/0x231 mm/kasan/report.c:187
  kasan_report.cold+0x1a/0x35 mm/kasan/report.c:317
  au0828_rc_unregister+0x9a/0xb0 drivers/media/usb/au0828/au0828-input.c:353
  au0828_usb_disconnect+0x6a/0x130 drivers/media/usb/au0828/au0828-core.c:189
  au0828_usb_probe.cold+0x111/0x16e  
drivers/media/usb/au0828/au0828-core.c:661
  usb_probe_interface+0x30d/0x7b0 drivers/usb/core/driver.c:361
  really_probe+0x296/0x680 drivers/base/dd.c:509
  driver_probe_device+0xf9/0x200 drivers/base/dd.c:671
  __device_attach_driver+0x1c4/0x230 drivers/base/dd.c:778
  bus_for_each_drv+0x15e/0x1e0 drivers/base/bus.c:454
  __device_attach+0x21e/0x360 drivers/base/dd.c:844
  bus_probe_device+0x1ec/0x2a0 drivers/base/bus.c:514
  device_add+0xaf4/0x1700 drivers/base/core.c:2106
  usb_set_configuration+0xdf2/0x1670 drivers/usb/core/message.c:2023
  generic_probe+0x9d/0xd5 drivers/usb/core/generic.c:210
  usb_probe_device+0xa8/0x110 drivers/usb/core/driver.c:266
  really_probe+0x296/0x680 drivers/base/dd.c:509
  driver_probe_device+0xf9/0x200 drivers/base/dd.c:671
  __device_attach_driver+0x1c4/0x230 drivers/base/dd.c:778
  bus_for_each_drv+0x15e/0x1e0 drivers/base/bus.c:454
  __device_attach+0x21e/0x360 drivers/base/dd.c:844
  bus_probe_device+0x1ec/0x2a0 drivers/base/bus.c:514
  device_add+0xaf4/0x1700 drivers/base/core.c:2106
  usb_new_device.cold+0x8b8/0x1030 drivers/usb/core/hub.c:2534
  hub_port_connect drivers/usb/core/hub.c:5089 [inline]
  hub_port_connect_change drivers/usb/core/hub.c:5204 [inline]
  port_event drivers/usb/core/hub.c:5350 [inline]
  hub_event+0x1ac9/0x35a0 drivers/usb/core/hub.c:5432
  process_one_work+0x90a/0x1580 kernel/workqueue.c:2269
  worker_thread+0x96/0xe20 kernel/workqueue.c:2415
  kthread+0x30e/0x420 kernel/kthread.c:253
  ret_from_fork+0x3a/0x50 arch/x86/entry/entry_64.S:352

The buggy address belongs to the page:
page:ffffea00072ddb00 count:1 mapcount:0 mapping:0000000000000000 index:0x0  
compound_mapcount: 0
flags: 0x200000000010000(head)
raw: 0200000000010000 dead000000000100 dead000000000200 0000000000000000
raw: 0000000000000000 0000000000000000 00000001ffffffff 0000000000000000
page dumped because: kasan: bad access detected

Memory state around the buggy address:
  ffff8881cb76f200: fe fe fe fe fe fe fe fe fe fe fe fe fe fe fe fe
  ffff8881cb76f280: fe fe fe fe fe fe fe fe fe fe fe fe fe fe fe fe
> ffff8881cb76f300: fe fe fe fe fe fe fe fe fe fe fe fe fe fe fe fe
                       ^
  ffff8881cb76f380: fe fe fe fe fe fe fe fe fe fe fe fe fe fe fe fe
  ffff8881cb76f400: fe fe fe fe fe fe fe fe fe fe fe fe fe fe fe fe
==================================================================


---
This bug is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this bug report. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
