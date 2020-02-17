Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2639F16134B
	for <lists+linux-usb@lfdr.de>; Mon, 17 Feb 2020 14:27:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728425AbgBQN1M (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 17 Feb 2020 08:27:12 -0500
Received: from mail-il1-f198.google.com ([209.85.166.198]:33970 "EHLO
        mail-il1-f198.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728124AbgBQN1L (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 17 Feb 2020 08:27:11 -0500
Received: by mail-il1-f198.google.com with SMTP id l13so14326643ils.1
        for <linux-usb@vger.kernel.org>; Mon, 17 Feb 2020 05:27:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=//Eikc+TfQoOfK+iblsjNCYJ0p+m9TlXlSpof67YNNw=;
        b=Moj6/29tb+I5+rL+k58LQvkTrgKypDdTsaM9F6f/R5j+pZvNFvNAKvs3XKyzuBiAv4
         rrIOyArMVaOh86VZ373u6EmeBGkR9GWXWPZ/TD0ak65IopPw3QjoZkz91SErkBIAKB/e
         z2YsJ773ubX/xIx0wZGbQSKK/LhnfnI0etQqkxAAbscJucmbT44iYlphgY+VWsl6aDTN
         DyE4wwfo5+8U26hfwzygO16J793BXv1nth+5R/jhg0TN1bnn4+6mYLrlh31036/ty8JA
         gSgmuOKTkHX0wJN0aE+BUhrJK4PtZJ31WPzxTuIby6af9PHasFyXQWMPOv2K5L13gqhn
         sSMw==
X-Gm-Message-State: APjAAAVG9EGNQQ6sh3N5ev6Ei1QwZ9c1FpZKs2eOu5z3kXn3TBQH5OXw
        I4AbTfl0KWfYrIhl9UzLfp+WYiP0QG1OkIncUHS+O0YIHwTI
X-Google-Smtp-Source: APXvYqwnpjMrbSljtR7Lav4RkYaw8FsWyzE9gfZXhRW3Att0YLAj9mEoaKfcS1mD94s1f6BhP1S5aoN629SA2yLXv0hdqcUHaRSp
MIME-Version: 1.0
X-Received: by 2002:a92:1a12:: with SMTP id a18mr14351032ila.10.1581946031115;
 Mon, 17 Feb 2020 05:27:11 -0800 (PST)
Date:   Mon, 17 Feb 2020 05:27:11 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000003d1365059ec583c5@google.com>
Subject: WARNING in chaoskey_disconnect
From:   syzbot <syzbot+a07cc2ec8430d5980aa1@syzkaller.appspotmail.com>
To:     alexandre.belloni@bootlin.com, andreyknvl@google.com,
        arnd@arndb.de, gregkh@linuxfoundation.org,
        herbert@gondor.apana.org.au, linux-crypto@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        lvivier@redhat.com, mchehab+samsung@kernel.org, mpm@selenic.com,
        swboyd@chromium.org, syzkaller-bugs@googlegroups.com, tytso@mit.edu
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,

syzbot found the following crash on:

HEAD commit:    7f0cd6c7 usb: gadget: add raw-gadget interface
git tree:       https://github.com/google/kasan.git usb-fuzzer
console output: https://syzkaller.appspot.com/x/log.txt?x=12445311e00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=f10b12ae04e03319
dashboard link: https://syzkaller.appspot.com/bug?extid=a07cc2ec8430d5980aa1
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)

Unfortunately, I don't have any reproducer for this crash yet.

IMPORTANT: if you fix the bug, please add the following tag to the commit:
Reported-by: syzbot+a07cc2ec8430d5980aa1@syzkaller.appspotmail.com

usb 6-1: USB disconnect, device number 67
------------[ cut here ]------------
WARNING: CPU: 1 PID: 4799 at kernel/kthread.c:75 to_kthread kernel/kthread.c:75 [inline]
WARNING: CPU: 1 PID: 4799 at kernel/kthread.c:75 kthread_stop+0x5f8/0x780 kernel/kthread.c:555
Kernel panic - not syncing: panic_on_warn set ...
CPU: 1 PID: 4799 Comm: kworker/1:8 Not tainted 5.6.0-rc1-syzkaller #0
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
RIP: 0010:to_kthread kernel/kthread.c:75 [inline]
RIP: 0010:kthread_stop+0x5f8/0x780 kernel/kthread.c:555
Code: 00 4c 89 e7 e8 79 4b cb 00 e9 f9 fa ff ff e8 5f 03 23 00 be 03 00 00 00 4c 89 e7 e8 62 4b cb 00 e9 0e fc ff ff e8 48 03 23 00 <0f> 0b e9 23 fb ff ff e8 3c 03 23 00 be 02 00 00 00 4c 89 e7 e8 3f
RSP: 0018:ffff8881cc3677f0 EFLAGS: 00010216
RAX: 0000000000040000 RBX: 0000000000000000 RCX: ffffc9000d782000
RDX: 00000000000040df RSI: ffffffff811c5ed8 RDI: 0000000000000005
RBP: ffff8881d4b50000 R08: ffff8881cbb54980 R09: ffffed103a96a005
R10: ffffed103a96a004 R11: ffff8881d4b50023 R12: ffff8881d4b50020
R13: ffff8881c8a1a930 R14: ffff8881c8a1a978 R15: ffffffff873764e0
 hwrng_unregister+0x24f/0x330 drivers/char/hw_random/core.c:556
 chaoskey_disconnect+0x216/0x290 drivers/usb/misc/chaoskey.c:232
 usb_unbind_interface+0x1bd/0x8a0 drivers/usb/core/driver.c:423
 __device_release_driver drivers/base/dd.c:1137 [inline]
 device_release_driver_internal+0x42f/0x500 drivers/base/dd.c:1168
 bus_remove_device+0x2eb/0x5a0 drivers/base/bus.c:533
 device_del+0x481/0xd30 drivers/base/core.c:2664
 usb_disable_device+0x23d/0x790 drivers/usb/core/message.c:1237
 usb_disconnect+0x293/0x900 drivers/usb/core/hub.c:2201
 hub_port_connect drivers/usb/core/hub.c:5036 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5325 [inline]
 port_event drivers/usb/core/hub.c:5471 [inline]
 hub_event+0x1a1d/0x4300 drivers/usb/core/hub.c:5553
 process_one_work+0x94b/0x1620 kernel/workqueue.c:2264
 process_scheduled_works kernel/workqueue.c:2326 [inline]
 worker_thread+0x7ab/0xe20 kernel/workqueue.c:2412
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
