Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D6942BDE69
	for <lists+linux-usb@lfdr.de>; Wed, 25 Sep 2019 14:59:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405869AbfIYM7H (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 25 Sep 2019 08:59:07 -0400
Received: from mail-io1-f69.google.com ([209.85.166.69]:54773 "EHLO
        mail-io1-f69.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405798AbfIYM7H (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 25 Sep 2019 08:59:07 -0400
Received: by mail-io1-f69.google.com with SMTP id w8so9178729iod.21
        for <linux-usb@vger.kernel.org>; Wed, 25 Sep 2019 05:59:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=5qiNyHZbMyKRqH8Nio0UCX3CiqGMR2A3xvoM516d77s=;
        b=rLhl8S5NMtvAN1Fl1GTxcOyt2orLzz4n9QBDg1t5zIKsx1CRdlt7NdtZ7CGUdkxv4b
         efauO50MVYzqx93YILn9ceufjW25iYyRoSbh9dn5aAp14G9C2RjybaanqktzQbNUT45H
         3mK75vy1sZser7ILTakaEQ42yFx56qCncZ2z8BCbHy61Db0l7WGyO1p+k4mZUBjNlQ3v
         kJS2Qp2lGNJ2BKyd/AhhQYwXg7xex1gzVPmNYoNg2/7AUiAMW698vVU4/x5WWbzp9IPA
         Ud9HHPgXIH/tj/oSR6zKxYG2hG6nwwUMvbAeLJz+PrZlKKIAZXIlpdKCfMwXPq/DRQPh
         eAIg==
X-Gm-Message-State: APjAAAXf1CFDj5P+pZNSoyPF5k6yz24NZHn7zKujahQdtMrsfZW0eQg/
        TY2jvnr/Op0ZfeGlZrUvkZw6SnchJYEfuZzrUyTNJl03xZvg
X-Google-Smtp-Source: APXvYqwLTXPnU03fA5yRe2SlfsUGs8TMP9ytYWETKqrmcRNa4Z46e5by33isaUsBeNblYFKQ+jx21dvlvDPou8lItbiCzvhtZUeO
MIME-Version: 1.0
X-Received: by 2002:a02:3786:: with SMTP id r128mr5119360jar.76.1569416345215;
 Wed, 25 Sep 2019 05:59:05 -0700 (PDT)
Date:   Wed, 25 Sep 2019 05:59:05 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000c2ee6a059360376e@google.com>
Subject: WARNING in pvr2_i2c_core_done
From:   syzbot <syzbot+e74a998ca8f1df9cc332@syzkaller.appspotmail.com>
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

HEAD commit:    d9e63adc usb-fuzzer: main usb gadget fuzzer driver
git tree:       https://github.com/google/kasan.git usb-fuzzer
console output: https://syzkaller.appspot.com/x/log.txt?x=16b5fcd5600000
kernel config:  https://syzkaller.appspot.com/x/.config?x=f4fa60e981ee8e6a
dashboard link: https://syzkaller.appspot.com/bug?extid=e74a998ca8f1df9cc332
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=16ec07b1600000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=13ff0871600000

IMPORTANT: if you fix the bug, please add the following tag to the commit:
Reported-by: syzbot+e74a998ca8f1df9cc332@syzkaller.appspotmail.com

pvrusb2: Device being rendered inoperable
cx25840 0-0044: Unable to detect h/w, assuming cx23887
cx25840 0-0044: cx23887 A/V decoder found @ 0x88 (pvrusb2_a)
pvrusb2: Attached sub-driver cx25840
pvrusb2: ***WARNING*** pvrusb2 device hardware appears to be jammed and I  
can't clear it.
pvrusb2: You might need to power cycle the pvrusb2 device in order to  
recover.
------------[ cut here ]------------
sysfs group 'power' not found for kobject 'i2c-0'
WARNING: CPU: 0 PID: 102 at fs/sysfs/group.c:278 sysfs_remove_group  
fs/sysfs/group.c:278 [inline]
WARNING: CPU: 0 PID: 102 at fs/sysfs/group.c:278  
sysfs_remove_group+0x155/0x1b0 fs/sysfs/group.c:269
Kernel panic - not syncing: panic_on_warn set ...
CPU: 0 PID: 102 Comm: pvrusb2-context Not tainted 5.3.0+ #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS  
Google 01/01/2011
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
  invalid_op+0x23/0x30 arch/x86/entry/entry_64.S:1028
RIP: 0010:sysfs_remove_group fs/sysfs/group.c:278 [inline]
RIP: 0010:sysfs_remove_group+0x155/0x1b0 fs/sysfs/group.c:269
Code: 48 89 d9 49 8b 14 24 48 b8 00 00 00 00 00 fc ff df 48 c1 e9 03 80 3c  
01 00 75 41 48 8b 33 48 c7 c7 a0 dc d0 85 e8 e0 67 8a ff <0f> 0b eb 95 e8  
72 c4 db ff e9 d2 fe ff ff 48 89 df e8 65 c4 db ff
RSP: 0018:ffff8881d5857c40 EFLAGS: 00010282
RAX: 0000000000000000 RBX: ffffffff85f33f80 RCX: 0000000000000000
RDX: 0000000000000000 RSI: ffffffff8128d3fd RDI: ffffed103ab0af7a
RBP: 0000000000000000 R08: ffff8881d5e11800 R09: ffffed103b643ee7
R10: ffffed103b643ee6 R11: ffff8881db21f737 R12: ffff8881d2e68338
R13: ffffffff85f34520 R14: ffff8881d2e68900 R15: ffff8881d5e11800
  dpm_sysfs_remove+0x97/0xb0 drivers/base/power/sysfs.c:741
  device_del+0x12a/0xb10 drivers/base/core.c:2352
  device_unregister+0x11/0x30 drivers/base/core.c:2407
  i2c_del_adapter drivers/i2c/i2c-core-base.c:1596 [inline]
  i2c_del_adapter+0x42b/0x590 drivers/i2c/i2c-core-base.c:1535
  pvr2_i2c_core_done+0x69/0xb6  
drivers/media/usb/pvrusb2/pvrusb2-i2c-core.c:652
  pvr2_hdw_destroy+0x179/0x370 drivers/media/usb/pvrusb2/pvrusb2-hdw.c:2680
  pvr2_context_destroy+0x84/0x230  
drivers/media/usb/pvrusb2/pvrusb2-context.c:70
  pvr2_context_check drivers/media/usb/pvrusb2/pvrusb2-context.c:137 [inline]
  pvr2_context_thread_func+0x657/0x860  
drivers/media/usb/pvrusb2/pvrusb2-context.c:158
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
