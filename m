Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5BAD1A0080
	for <lists+linux-usb@lfdr.de>; Wed, 28 Aug 2019 13:12:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726432AbfH1LMB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 28 Aug 2019 07:12:01 -0400
Received: from mail-io1-f70.google.com ([209.85.166.70]:37971 "EHLO
        mail-io1-f70.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725991AbfH1LMB (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 28 Aug 2019 07:12:01 -0400
Received: by mail-io1-f70.google.com with SMTP id h7so3224603ioj.5
        for <linux-usb@vger.kernel.org>; Wed, 28 Aug 2019 04:12:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=lEu282v1wRe4gDFxPtFm5aZtmvQYMowBjm2lAQ9Lhnc=;
        b=pWdGyZ1TmmMYN1qNbuNDhf9oAaD9MS69V7XBU6o+/zOGZZqRgxSzL74MN9zX9GArTy
         nu6Xv62bwVLfmuHLCCRwzNNcaDZj7DClTLuj+utuI0ARpOA9yKjmz3I7jAnhfRM5U/6w
         Z9yCL1mxpM3O5BGkXTw/9mDQfKjBhoFIYkWZHnNnqZpz7qgPU9Iq+QlR5ASa0vOZF2qt
         J2LRtIkwjhn5GYDNttDRARxyHBpgmGrwGAk3nD0BX4mNuO1Z2EvFOLyKzuPRot9eV1rF
         oY+QYzEzfiVd2eyXbxMzR+aQuP+mHPMpNiqPZb4RzyUc8f2sz/2KiTHzBvqyEk8SO8UU
         vLBA==
X-Gm-Message-State: APjAAAWepQnJ0OSCYXoc68jxi9myFM+k2Ozu3yKDBlzzohtve5n7vBN9
        va2H+xHSswLH7WZBSRRzqNDs+K9o81FSYiWiYo2Ny1ohsz4X
X-Google-Smtp-Source: APXvYqxPKEpmCJwLjL/1/Rv5/QJU90kWAINaGTGTtIW14y5SBzO0RWkc6SY3dgHLAJAELC5oR1nvw1i5arV6VvWYABdlTXB340C+
MIME-Version: 1.0
X-Received: by 2002:a02:8794:: with SMTP id t20mr3741526jai.24.1566990720729;
 Wed, 28 Aug 2019 04:12:00 -0700 (PDT)
Date:   Wed, 28 Aug 2019 04:12:00 -0700
In-Reply-To: <1566989167.11732.2.camel@neukum.org>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000004689ee05912b7503@google.com>
Subject: Re: WARNING in mxl111sf_ctrl_msg
From:   syzbot <syzbot+48eb85867b8a4c16adf0@syzkaller.appspotmail.com>
To:     linux-usb@vger.kernel.org, oliver@neukum.org,
        syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,

syzbot has tested the proposed patch but the reproducer still triggered  
crash:
WARNING in mxl111sf_ctrl_msg

usb 6-1: selecting invalid altsetting 1
set interface failed
------------[ cut here ]------------
DEBUG_LOCKS_WARN_ON(lock->magic != lock)
WARNING: CPU: 0 PID: 12 at kernel/locking/mutex.c:912 __mutex_lock_common  
kernel/locking/mutex.c:912 [inline]
WARNING: CPU: 0 PID: 12 at kernel/locking/mutex.c:912  
__mutex_lock+0xd31/0x1360 kernel/locking/mutex.c:1077
Kernel panic - not syncing: panic_on_warn set ...
CPU: 0 PID: 12 Comm: kworker/0:1 Not tainted 5.3.0-rc2+ #1
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
  invalid_op+0x23/0x30 arch/x86/entry/entry_64.S:1026
RIP: 0010:__mutex_lock_common kernel/locking/mutex.c:912 [inline]
RIP: 0010:__mutex_lock+0xd31/0x1360 kernel/locking/mutex.c:1077
Code: d2 0f 85 f6 05 00 00 44 8b 05 bb 99 0a 02 45 85 c0 0f 85 0a f4 ff ff  
48 c7 c6 c0 86 a6 85 48 c7 c7 60 84 a6 85 e8 f4 24 b8 fb <0f> 0b e9 f0 f3  
ff ff 65 48 8b 1c 25 00 ef 01 00 be 08 00 00 00 48
RSP: 0018:ffff8881da206f40 EFLAGS: 00010282
RAX: 0000000000000000 RBX: 0000000000000000 RCX: 0000000000000000
RDX: 0000000000000000 RSI: ffffffff812830fd RDI: ffffed103b440dda
RBP: ffff8881da2070b0 R08: ffff8881da1f1800 R09: fffffbfff0d5eb25
R10: fffffbfff0d5eb24 R11: ffffffff86af5923 R12: 0000000000000000
R13: dffffc0000000000 R14: ffff8881d61e5cc8 R15: ffff8881d61e5cc8
  mxl111sf_ctrl_msg+0xb8/0x210 drivers/media/usb/dvb-usb-v2/mxl111sf.c:66
  mxl111sf_write_reg+0x8b/0x120 drivers/media/usb/dvb-usb-v2/mxl111sf.c:123
  mxl1x1sf_soft_reset+0x6b/0x190  
drivers/media/usb/dvb-usb-v2/mxl111sf-phy.c:47
  mxl111sf_lgdt3305_frontend_attach.constprop.0+0x23e/0x790  
drivers/media/usb/dvb-usb-v2/mxl111sf.c:446
  mxl111sf_frontend_attach_atsc_mh+0x13/0x70  
drivers/media/usb/dvb-usb-v2/mxl111sf.c:982
  dvb_usbv2_adapter_frontend_init  
drivers/media/usb/dvb-usb-v2/dvb_usb_core.c:641 [inline]
  dvb_usbv2_adapter_init drivers/media/usb/dvb-usb-v2/dvb_usb_core.c:804  
[inline]
  dvb_usbv2_init drivers/media/usb/dvb-usb-v2/dvb_usb_core.c:865 [inline]
  dvb_usbv2_probe.cold+0x1e04/0x2567  
drivers/media/usb/dvb-usb-v2/dvb_usb_core.c:980
  usb_probe_interface+0x305/0x7a0 drivers/usb/core/driver.c:361
  really_probe+0x281/0x650 drivers/base/dd.c:548
  driver_probe_device+0x101/0x1b0 drivers/base/dd.c:709
  __device_attach_driver+0x1c2/0x220 drivers/base/dd.c:816
  bus_for_each_drv+0x15c/0x1e0 drivers/base/bus.c:454
  __device_attach+0x217/0x360 drivers/base/dd.c:882
  bus_probe_device+0x1e4/0x290 drivers/base/bus.c:514
  device_add+0xae6/0x16f0 drivers/base/core.c:2114
  usb_set_configuration+0xdf6/0x1670 drivers/usb/core/message.c:2023
  generic_probe+0x9d/0xd5 drivers/usb/core/generic.c:210
  usb_probe_device+0x99/0x100 drivers/usb/core/driver.c:266
  really_probe+0x281/0x650 drivers/base/dd.c:548
  driver_probe_device+0x101/0x1b0 drivers/base/dd.c:709
  __device_attach_driver+0x1c2/0x220 drivers/base/dd.c:816
  bus_for_each_drv+0x15c/0x1e0 drivers/base/bus.c:454
  __device_attach+0x217/0x360 drivers/base/dd.c:882
  bus_probe_device+0x1e4/0x290 drivers/base/bus.c:514
  device_add+0xae6/0x16f0 drivers/base/core.c:2114
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


Tested on:

commit:         7f7867ff usb-fuzzer: main usb gadget fuzzer driver
git tree:       https://github.com/google/kasan.git
console output: https://syzkaller.appspot.com/x/log.txt?x=163ffebc600000
kernel config:  https://syzkaller.appspot.com/x/.config?x=792eb47789f57810
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
patch:          https://syzkaller.appspot.com/x/patch.diff?x=165b3066600000

