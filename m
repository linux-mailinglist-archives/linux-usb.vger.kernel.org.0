Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0B865C93AC
	for <lists+linux-usb@lfdr.de>; Wed,  2 Oct 2019 23:50:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727252AbfJBVuN (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 2 Oct 2019 17:50:13 -0400
Received: from mail-io1-f70.google.com ([209.85.166.70]:37361 "EHLO
        mail-io1-f70.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726462AbfJBVuN (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 2 Oct 2019 17:50:13 -0400
Received: by mail-io1-f70.google.com with SMTP id u18so1392366ioc.4
        for <linux-usb@vger.kernel.org>; Wed, 02 Oct 2019 14:50:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=FVFfSQ1N4e8sms9/3nhKCOCc7RVTElQVbWRSDR4Lz+w=;
        b=P7DKMmivBLfn6QNwqrfIkpnBbIR4g7iHEP/hIn9XpuleehS3U+stBIBkMUEhsuJ8Ro
         ZoKqF3dqupUEJTeh2ge/9SvW28ribAOD3Bralf0CY0fF2LbZ08U6kVqDMDFrinDeGoUl
         GLQaHgDFY9YMnHGR0NTEeteKnrWQabnhYTv6T+JUxuaNQCcm4/ymYGX9WB7Jz5xGVw0L
         JrQhl7SST28jR4CkoAQD9H/lHq4ZeRy4g/VUtqMdieX2jg8UpQ+DUiG45cq7RPBL3VnP
         NUo+VtEHpwv4OvHHEydM7Q7oZecXMyz4br43xy7eDB98r6pFIMiqQqRNvdzlXnuaFJhh
         mRTQ==
X-Gm-Message-State: APjAAAWtl8yZjs+tiIQX/IXuVpxNXheBZ0rxhGwiFAfHHGSHZMq0j7ri
        VcoaN4q3NPtdVt3k1ZfGMw/lJbPAgEJG94HRODIjMVQ2O7ei
X-Google-Smtp-Source: APXvYqy5U8vEk6m4PI9O3uAMPgUs+AjruWPqkT+uB7XC8rwgLIBqxdvCaMjkxb0GRLWGttlC7FJchJHWsKQgGspmxvME0KMoeaXE
MIME-Version: 1.0
X-Received: by 2002:a92:c530:: with SMTP id m16mr6570416ili.44.1570053011937;
 Wed, 02 Oct 2019 14:50:11 -0700 (PDT)
Date:   Wed, 02 Oct 2019 14:50:11 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000000e235d0593f474ba@google.com>
Subject: KMSAN: uninit-value in mts_usb_probe
From:   syzbot <syzbot+5630ca7c3b2be5c9da5e@syzkaller.appspotmail.com>
To:     glider@google.com, gregkh@linuxfoundation.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        oliver@neukum.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,

syzbot found the following crash on:

HEAD commit:    fe36eb20 kmsan: rework SLUB hooks
git tree:       https://github.com/google/kmsan.git master
console output: https://syzkaller.appspot.com/x/log.txt?x=17605b6fa00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=40511ad0c5945201
dashboard link: https://syzkaller.appspot.com/bug?extid=5630ca7c3b2be5c9da5e
compiler:       clang version 9.0.0 (/home/glider/llvm/clang  
80fee25776c2fb61e74c1ecb1a523375c2500b69)
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=11305710600000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1506787fa00000

IMPORTANT: if you fix the bug, please add the following tag to the commit:
Reported-by: syzbot+5630ca7c3b2be5c9da5e@syzkaller.appspotmail.com

usb 1-1: config 0 interface 235 altsetting 0 bulk endpoint 0x5 has invalid  
maxpacket 0
usb 1-1: New USB device found, idVendor=05da, idProduct=009a,  
bcdDevice=46.6b
usb 1-1: New USB device strings: Mfr=0, Product=0, SerialNumber=0
usb 1-1: config 0 descriptor??
microtek usb (rev 0.4.3): can only deal with bulk endpoints; endpoint 15 is  
not bulk.
microtek usb (rev 0.4.3): can only deal with bulk endpoints; endpoint 10 is  
not bulk.
microtek usb (rev 0.4.3): will this work? Command EP is not usually 5
==================================================================
BUG: KMSAN: uninit-value in mts_usb_probe+0xd1d/0xfb0  
drivers/usb/image/microtek.c:754
CPU: 1 PID: 33 Comm: kworker/1:1 Not tainted 5.2.0-rc4+ #11
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS  
Google 01/01/2011
Workqueue: usb_hub_wq hub_event
Call Trace:
  __dump_stack lib/dump_stack.c:77 [inline]
  dump_stack+0x191/0x1f0 lib/dump_stack.c:113
  kmsan_report+0x162/0x2d0 mm/kmsan/kmsan_report.c:109
  __msan_warning+0x75/0xe0 mm/kmsan/kmsan_instr.c:294
  mts_usb_probe+0xd1d/0xfb0 drivers/usb/image/microtek.c:754
  usb_probe_interface+0xd19/0x1310 drivers/usb/core/driver.c:361
  really_probe+0x1344/0x1d90 drivers/base/dd.c:513
  driver_probe_device+0x1ba/0x510 drivers/base/dd.c:670
  __device_attach_driver+0x5b8/0x790 drivers/base/dd.c:777
  bus_for_each_drv+0x28e/0x3b0 drivers/base/bus.c:454
  __device_attach+0x489/0x750 drivers/base/dd.c:843
  device_initial_probe+0x4a/0x60 drivers/base/dd.c:890
  bus_probe_device+0x131/0x390 drivers/base/bus.c:514
  device_add+0x25b5/0x2df0 drivers/base/core.c:2111
  usb_set_configuration+0x309f/0x3710 drivers/usb/core/message.c:2027
  generic_probe+0xe7/0x280 drivers/usb/core/generic.c:210
  usb_probe_device+0x146/0x200 drivers/usb/core/driver.c:266
  really_probe+0x1344/0x1d90 drivers/base/dd.c:513
  driver_probe_device+0x1ba/0x510 drivers/base/dd.c:670
  __device_attach_driver+0x5b8/0x790 drivers/base/dd.c:777
  bus_for_each_drv+0x28e/0x3b0 drivers/base/bus.c:454
  __device_attach+0x489/0x750 drivers/base/dd.c:843
  device_initial_probe+0x4a/0x60 drivers/base/dd.c:890
  bus_probe_device+0x131/0x390 drivers/base/bus.c:514
  device_add+0x25b5/0x2df0 drivers/base/core.c:2111
  usb_new_device+0x23e5/0x2fb0 drivers/usb/core/hub.c:2534
  hub_port_connect drivers/usb/core/hub.c:5089 [inline]
  hub_port_connect_change drivers/usb/core/hub.c:5204 [inline]
  port_event drivers/usb/core/hub.c:5350 [inline]
  hub_event+0x5853/0x7320 drivers/usb/core/hub.c:5432
  process_one_work+0x1572/0x1f00 kernel/workqueue.c:2269
  worker_thread+0x111b/0x2460 kernel/workqueue.c:2415
  kthread+0x4b5/0x4f0 kernel/kthread.c:256
  ret_from_fork+0x35/0x40 arch/x86/entry/entry_64.S:355

Uninit was stored to memory at:
  kmsan_save_stack_with_flags mm/kmsan/kmsan.c:187 [inline]
  kmsan_internal_chain_origin+0xcc/0x150 mm/kmsan/kmsan.c:349
  __msan_chain_origin+0x6b/0xe0 mm/kmsan/kmsan_instr.c:190
  mts_usb_probe+0xcf7/0xfb0 drivers/usb/image/microtek.c:748
  usb_probe_interface+0xd19/0x1310 drivers/usb/core/driver.c:361
  really_probe+0x1344/0x1d90 drivers/base/dd.c:513
  driver_probe_device+0x1ba/0x510 drivers/base/dd.c:670
  __device_attach_driver+0x5b8/0x790 drivers/base/dd.c:777
  bus_for_each_drv+0x28e/0x3b0 drivers/base/bus.c:454
  __device_attach+0x489/0x750 drivers/base/dd.c:843
  device_initial_probe+0x4a/0x60 drivers/base/dd.c:890
  bus_probe_device+0x131/0x390 drivers/base/bus.c:514
  device_add+0x25b5/0x2df0 drivers/base/core.c:2111
  usb_set_configuration+0x309f/0x3710 drivers/usb/core/message.c:2027
  generic_probe+0xe7/0x280 drivers/usb/core/generic.c:210
  usb_probe_device+0x146/0x200 drivers/usb/core/driver.c:266
  really_probe+0x1344/0x1d90 drivers/base/dd.c:513
  driver_probe_device+0x1ba/0x510 drivers/base/dd.c:670
  __device_attach_driver+0x5b8/0x790 drivers/base/dd.c:777
  bus_for_each_drv+0x28e/0x3b0 drivers/base/bus.c:454
  __device_attach+0x489/0x750 drivers/base/dd.c:843
  device_initial_probe+0x4a/0x60 drivers/base/dd.c:890
  bus_probe_device+0x131/0x390 drivers/base/bus.c:514
  device_add+0x25b5/0x2df0 drivers/base/core.c:2111
  usb_new_device+0x23e5/0x2fb0 drivers/usb/core/hub.c:2534
  hub_port_connect drivers/usb/core/hub.c:5089 [inline]
  hub_port_connect_change drivers/usb/core/hub.c:5204 [inline]
  port_event drivers/usb/core/hub.c:5350 [inline]
  hub_event+0x5853/0x7320 drivers/usb/core/hub.c:5432
  process_one_work+0x1572/0x1f00 kernel/workqueue.c:2269
  worker_thread+0x111b/0x2460 kernel/workqueue.c:2415
  kthread+0x4b5/0x4f0 kernel/kthread.c:256
  ret_from_fork+0x35/0x40 arch/x86/entry/entry_64.S:355

Local variable description: ----ep_in_set@mts_usb_probe
Variable was created at:
  mts_usb_probe+0x53/0xfb0 drivers/usb/image/microtek.c:666
  usb_probe_interface+0xd19/0x1310 drivers/usb/core/driver.c:361
==================================================================


---
This bug is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this bug report. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
syzbot can test patches for this bug, for details see:
https://goo.gl/tpsmEJ#testing-patches
