Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2D1041F48A
	for <lists+linux-usb@lfdr.de>; Wed, 15 May 2019 14:37:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726510AbfEOMhG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 15 May 2019 08:37:06 -0400
Received: from mail-it1-f197.google.com ([209.85.166.197]:56252 "EHLO
        mail-it1-f197.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726381AbfEOMhG (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 15 May 2019 08:37:06 -0400
Received: by mail-it1-f197.google.com with SMTP id o126so2159744itc.5
        for <linux-usb@vger.kernel.org>; Wed, 15 May 2019 05:37:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=uWofTGBeiWicnl5I7LcLm/ABzPoEtoYKfX7ix2xtrFo=;
        b=OrXxyIMFTmXhe1yggdrkiTh66mZsCX1dr4RvrUYGtX7Kzf1l3L85BwckSgDmrvUKMs
         no1qi9VHmk5nsBk6LSaviX88JZTrqZdmsmRwRyrktc0GKnpEch0m1Hr8QhtkP0ykne+a
         /z/HtWS6NAQAnCh1RFXROVG3TKPrbdWSfxOFOJ/SbqW5nhS16eKr4C9bJdKNF4itS7PK
         PMJgNWUa+4K4u2tYFVsUtk83TrlnFf5BZnwqNApvItLTKtv9TLAtRWJd3A5xrC8lAmCs
         EHrrRn8SeTKGXtqgunL8vPL1exexGpQIMVMfQP8P/NETHA+rEZZmUJALouJkKcGACAJy
         y/vA==
X-Gm-Message-State: APjAAAXCPq/uiEWYmNxOFuw4VHiolohXBNuBlXL97ZJHcWW2lmht0ReA
        WhwslfawFd8DKNS58rutiJ6wa02Jc7xetZayi9pZICUT59OC
X-Google-Smtp-Source: APXvYqxoxjSDy+zCxrI7zm6w+WGuVdKbJNPnaX0p6oR5eKeCZ4casRotuQY7BQAbCgE6Suj7yMgXTK/IvKTtcpoJ85C49EFRNR2t
MIME-Version: 1.0
X-Received: by 2002:a6b:8b56:: with SMTP id n83mr22549105iod.33.1557923825359;
 Wed, 15 May 2019 05:37:05 -0700 (PDT)
Date:   Wed, 15 May 2019 05:37:05 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000032a1d60588ec68dd@google.com>
Subject: general protection fault in device_del (3)
From:   syzbot <syzbot+d7f6a4fd149fcdaf780b@syzkaller.appspotmail.com>
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
console output: https://syzkaller.appspot.com/x/log.txt?x=16a000a0a00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=95aff7278e7ff25e
dashboard link: https://syzkaller.appspot.com/bug?extid=d7f6a4fd149fcdaf780b
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=17605e22a00000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1045a49ca00000

IMPORTANT: if you fix the bug, please add the following tag to the commit:
Reported-by: syzbot+d7f6a4fd149fcdaf780b@syzkaller.appspotmail.com

usb 1-1: string descriptor 0 read error: -71
usb 1-1: claimed gadget: Vendor=0424 ProdID=c001 Bus=01 Device=02
usb 1-1: device path: /sys/bus/usb/devices/1-1:0.133
most_core: registered new device mdev0 (usb_device 1-1:0.133)
usb 1-1: USB disconnect, device number 2
kasan: CONFIG_KASAN_INLINE enabled
kasan: GPF could be caused by NULL-ptr deref or user memory access
general protection fault: 0000 [#1] SMP KASAN PTI
CPU: 1 PID: 17 Comm: kworker/1:0 Not tainted 5.1.0-rc3+ #8
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS  
Google 01/01/2011
Workqueue: usb_hub_wq hub_event
RIP: 0010:device_del+0x76/0xb90 drivers/base/core.c:2224
Code: f1 f1 f1 f1 c7 40 04 00 07 f3 f3 65 48 8b 04 25 28 00 00 00 48 89 84  
24 88 00 00 00 31 c0 e8 c1 ce d7 fe 48 89 d8 48 c1 e8 03 <80> 3c 28 00 0f  
85 82 0a 00 00 48 8b 03 4c 8d 63 60 31 f6 4c 8d 7b
RSP: 0018:ffff8881d9e4f7c0 EFLAGS: 00010246
RAX: 0000000000000000 RBX: 0000000000000000 RCX: 0000000000000000
RDX: 0000000000000000 RSI: ffffffff8264999f RDI: 0000000000000000
RBP: dffffc0000000000 R08: ffff8881d9e33000 R09: ffffed1039951b26
R10: ffffed1039951b25 R11: ffff8881cca8d92f R12: ffff8881cde8f828
R13: ffff8881cca8d860 R14: ffff8881cde8f730 R15: 0000000000000000
FS:  0000000000000000(0000) GS:ffff8881db300000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f77df136000 CR3: 00000001cf00a000 CR4: 00000000001406e0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
  device_unregister+0x11/0x30 drivers/base/core.c:2301
  hdm_disconnect+0xdf/0x200 drivers/staging/most/usb/usb.c:1208
  usb_unbind_interface+0x1c4/0x8b0 drivers/usb/core/driver.c:423
  __device_release_driver drivers/base/dd.c:1082 [inline]
  device_release_driver_internal+0x431/0x4f0 drivers/base/dd.c:1113
  bus_remove_device+0x2ee/0x4c0 drivers/base/bus.c:556
  device_del+0x462/0xb90 drivers/base/core.c:2269
  usb_disable_device+0x211/0x690 drivers/usb/core/message.c:1237
  usb_disconnect+0x284/0x840 drivers/usb/core/hub.c:2197
  hub_port_connect drivers/usb/core/hub.c:4940 [inline]
  hub_port_connect_change drivers/usb/core/hub.c:5204 [inline]
  port_event drivers/usb/core/hub.c:5350 [inline]
  hub_event+0x13f8/0x35a0 drivers/usb/core/hub.c:5432
  process_one_work+0x90a/0x1580 kernel/workqueue.c:2269
  process_scheduled_works kernel/workqueue.c:2331 [inline]
  worker_thread+0x7ab/0xe20 kernel/workqueue.c:2417
  kthread+0x30e/0x420 kernel/kthread.c:253
  ret_from_fork+0x3a/0x50 arch/x86/entry/entry_64.S:352
Modules linked in:
---[ end trace d819a3b977ff54ad ]---
RIP: 0010:device_del+0x76/0xb90 drivers/base/core.c:2224
Code: f1 f1 f1 f1 c7 40 04 00 07 f3 f3 65 48 8b 04 25 28 00 00 00 48 89 84  
24 88 00 00 00 31 c0 e8 c1 ce d7 fe 48 89 d8 48 c1 e8 03 <80> 3c 28 00 0f  
85 82 0a 00 00 48 8b 03 4c 8d 63 60 31 f6 4c 8d 7b
RSP: 0018:ffff8881d9e4f7c0 EFLAGS: 00010246
RAX: 0000000000000000 RBX: 0000000000000000 RCX: 0000000000000000
RDX: 0000000000000000 RSI: ffffffff8264999f RDI: 0000000000000000
RBP: dffffc0000000000 R08: ffff8881d9e33000 R09: ffffed1039951b26
R10: ffffed1039951b25 R11: ffff8881cca8d92f R12: ffff8881cde8f828
R13: ffff8881cca8d860 R14: ffff8881cde8f730 R15: 0000000000000000
FS:  0000000000000000(0000) GS:ffff8881db300000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f77df136000 CR3: 00000001cf00a000 CR4: 00000000001406e0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400


---
This bug is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this bug report. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
syzbot can test patches for this bug, for details see:
https://goo.gl/tpsmEJ#testing-patches
