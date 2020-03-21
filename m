Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C574718E1D3
	for <lists+linux-usb@lfdr.de>; Sat, 21 Mar 2020 15:29:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727273AbgCUO3S (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 21 Mar 2020 10:29:18 -0400
Received: from mail-io1-f69.google.com ([209.85.166.69]:39726 "EHLO
        mail-io1-f69.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726961AbgCUO3S (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 21 Mar 2020 10:29:18 -0400
Received: by mail-io1-f69.google.com with SMTP id v13so4943734iox.6
        for <linux-usb@vger.kernel.org>; Sat, 21 Mar 2020 07:29:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=+0C+BS0h1x1M3bgLFevyE/Hyim/L16vOi1m2yvEXErw=;
        b=GyluxX1d7bJhj1/T4TUfXmh/MJPgSgo6Yg4kwQKyCgcAk8ULBlD/TI9/Y/TxBC6/+7
         qt0XEKHcyhKwfARxUmFoAJBpn4Tt011EXiODeLrPYbX/L8UmvS4OAZ0eC3mQYe7meCpb
         FLb0jgRxDpwxfVFsd43uFKKMBkqakUv++qtQYO0kcLKcQdAK+mv7Z7poXfYlnA+MIcZJ
         D9wzpB64UHqLq1hUN5kcp4motA7wwdEklXTQL+rLAr6xRjoMxyojJVoNMaKgL4mWsQzb
         8uEbeJJU8EXYYyq721SPitzC520HHPFfN5/haoUMy5JZ7LzlncYorQLFqFLLPKjpzXz/
         q2oQ==
X-Gm-Message-State: ANhLgQ32ysUbCftyaqomBhyzS/NJ3gow4Q6G36A9+fhgeZN6ELrPKIIo
        93WJd1zHBdUCDHhdt+pPI1wd9jt73ivdLcL69vLBwVSLQk8N
X-Google-Smtp-Source: ADFU+vv6MVIwdTe7nx6daaLhb5yBGUc7wIq+Gx93IxbvGpgnVAZCtbcIL5ggGkk8wyR95yIjTwu3q1gq4FX3RVF9vozQx04r6NYo
MIME-Version: 1.0
X-Received: by 2002:a02:c8cd:: with SMTP id q13mr12867621jao.66.1584800957332;
 Sat, 21 Mar 2020 07:29:17 -0700 (PDT)
Date:   Sat, 21 Mar 2020 07:29:17 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000001a033405a15e3acb@google.com>
Subject: WARNING in hwahc_probe
From:   syzbot <syzbot+df767d588771697b0433@syzkaller.appspotmail.com>
To:     andreyknvl@google.com, devel@driverdev.osuosl.org,
        gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com,
        tranmanphong@gmail.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,

syzbot found the following crash on:

HEAD commit:    e17994d1 usb: core: kcov: collect coverage from usb comple..
git tree:       https://github.com/google/kasan.git usb-fuzzer
console output: https://syzkaller.appspot.com/x/log.txt?x=12d170ade00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=5d64370c438bc60
dashboard link: https://syzkaller.appspot.com/bug?extid=df767d588771697b0433
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=14ac8b91e00000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1010e223e00000

IMPORTANT: if you fix the bug, please add the following tag to the commit:
Reported-by: syzbot+df767d588771697b0433@syzkaller.appspotmail.com

pl2303 1-1:31.37: required endpoints missing
hwa-hc 1-1:31.37: Wire Adapter v219.213 newer than groked v1.0
hwa-hc 1-1:31.37: FIXME: USB_MAXCHILDREN too low for WUSB adapter (62 ports)
------------[ cut here ]------------
WARNING: CPU: 0 PID: 95 at lib/vsprintf.c:2512 vsnprintf+0xf46/0x14f0 lib/vsprintf.c:2512
Kernel panic - not syncing: panic_on_warn set ...
CPU: 0 PID: 95 Comm: kworker/0:2 Not tainted 5.6.0-rc5-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
Workqueue: usb_hub_wq hub_event
Call Trace:
 __dump_stack lib/dump_stack.c:77 [inline]
 dump_stack+0xef/0x16e lib/dump_stack.c:118
 panic+0x2aa/0x6e1 kernel/panic.c:221
 __warn.cold+0x2f/0x30 kernel/panic.c:582
 report_bug+0x27b/0x2f0 lib/bug.c:195
 fixup_bug arch/x86/kernel/traps.c:174 [inline]
 fixup_bug arch/x86/kernel/traps.c:169 [inline]
 do_error_trap+0x12b/0x1e0 arch/x86/kernel/traps.c:267
 do_invalid_op+0x32/0x40 arch/x86/kernel/traps.c:286
 invalid_op+0x23/0x30 arch/x86/entry/entry_64.S:1027
RIP: 0010:vsnprintf+0xf46/0x14f0 lib/vsprintf.c:2512
Code: 10 83 c5 08 41 89 2f e8 f8 34 b3 fb 4c 89 f0 48 c1 e8 03 80 3c 18 00 0f 85 38 04 00 00 4d 8b 36 e9 bb f2 ff ff e8 da 34 b3 fb <0f> 0b 45 31 ed e9 71 f3 ff ff e8 cb 34 b3 fb 4c 89 e8 4c 89 ea 48
RSP: 0018:ffff8881d58c6fc8 EFLAGS: 00010293
RAX: ffff8881d7976200 RBX: fffffffffffffff7 RCX: ffffffff858c1258
RDX: 0000000000000000 RSI: ffffffff858c2106 RDI: 0000000000000007
RBP: ffffffff86881480 R08: ffff8881d7976200 R09: ffffed103ab18e4e
R10: ffffed103ab18e4d R11: ffff8881d58c7269 R12: ffff8881d58c7279
R13: fffffffffffffff7 R14: ffffffff86881480 R15: ffff8881d58c70c8
 snprintf+0xbb/0xf0 lib/vsprintf.c:2707
 hwahc_security_create drivers/staging/wusbcore/host/hwa-hc.c:683 [inline]
 hwahc_create drivers/staging/wusbcore/host/hwa-hc.c:738 [inline]
 hwahc_probe+0xfd6/0x1490 drivers/staging/wusbcore/host/hwa-hc.c:805
 usb_probe_interface+0x310/0x800 drivers/usb/core/driver.c:374
 really_probe+0x290/0xac0 drivers/base/dd.c:551
 driver_probe_device+0x223/0x350 drivers/base/dd.c:724
 __device_attach_driver+0x1d1/0x290 drivers/base/dd.c:831
 bus_for_each_drv+0x162/0x1e0 drivers/base/bus.c:431
 __device_attach+0x217/0x390 drivers/base/dd.c:897
 bus_probe_device+0x1e4/0x290 drivers/base/bus.c:491
 device_add+0x1459/0x1bf0 drivers/base/core.c:2500
 usb_set_configuration+0xe47/0x17d0 drivers/usb/core/message.c:2023
 usb_generic_driver_probe+0x9d/0xe0 drivers/usb/core/generic.c:241
 usb_probe_device+0xd9/0x230 drivers/usb/core/driver.c:272
 really_probe+0x290/0xac0 drivers/base/dd.c:551
 driver_probe_device+0x223/0x350 drivers/base/dd.c:724
 __device_attach_driver+0x1d1/0x290 drivers/base/dd.c:831
 bus_for_each_drv+0x162/0x1e0 drivers/base/bus.c:431
 __device_attach+0x217/0x390 drivers/base/dd.c:897
 bus_probe_device+0x1e4/0x290 drivers/base/bus.c:491
 device_add+0x1459/0x1bf0 drivers/base/core.c:2500
 usb_new_device.cold+0x540/0xcd0 drivers/usb/core/hub.c:2548
 hub_port_connect drivers/usb/core/hub.c:5195 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5335 [inline]
 port_event drivers/usb/core/hub.c:5481 [inline]
 hub_event+0x21cb/0x4300 drivers/usb/core/hub.c:5563
 process_one_work+0x94b/0x1620 kernel/workqueue.c:2264
 worker_thread+0x96/0xe20 kernel/workqueue.c:2410
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
