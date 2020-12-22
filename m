Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D01242DDD3F
	for <lists+linux-usb@lfdr.de>; Fri, 18 Dec 2020 04:23:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732169AbgLRDVw (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 17 Dec 2020 22:21:52 -0500
Received: from mail-il1-f198.google.com ([209.85.166.198]:39998 "EHLO
        mail-il1-f198.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729463AbgLRDVw (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 17 Dec 2020 22:21:52 -0500
Received: by mail-il1-f198.google.com with SMTP id g1so803934ilq.7
        for <linux-usb@vger.kernel.org>; Thu, 17 Dec 2020 19:21:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=A/Ab5VH6csyzSSUnH09GzLQ2Jq2udhjrrzzU6OdP+e4=;
        b=LYlTxFDyzE52P1GX1ef/9EP/LE1rYMzeb2aJMguMiCGRz23so3M27p4JaFYj9cnWmX
         H5URVkX7Nrc+Zb+RTaLPOLkZru2COqhbA59/HDBvWGugskHTdsm+q/gkooQvTYeKEM5A
         kGbOAU/PaqS+9+vWYUlYaPCaJSpbS2GMtgj3yLZEeVB2JeUK9mIrGxNmYaCk8HKDZ0ZS
         7/b46G8zl5e+CFvhi/A1gCYg1rQIMBk78CFvPJ8xgU4hrfeVxed1J8BeYdFIyyBJp/Oe
         dAn3AerMJqi8c8yo/vJg7rMhnPoat9i806hWy30mcsCeheQqjMITI3oqe32z3ymtmUqj
         N9fQ==
X-Gm-Message-State: AOAM530HwmhoQZzAuIlAn4rD7mf3eTJsIhKJ7cUIV32M+Nz/aO20Re1k
        IwVjaLwi2BDr+uRyKr2NmfLxWVwPRJHPvIL39XBKb7rSXetR
X-Google-Smtp-Source: ABdhPJx/f981y5lTlUaJ4AtBGxBxXG0ry+c3jqdhMpFPQnHvxtAK2RNQBOXv0IK3E0a9qfI1G5dqovZNhlxeGdpivg8fQlbn6Lrv
MIME-Version: 1.0
X-Received: by 2002:a05:6638:b16:: with SMTP id a22mr1887819jab.56.1608261670880;
 Thu, 17 Dec 2020 19:21:10 -0800 (PST)
Date:   Thu, 17 Dec 2020 19:21:10 -0800
In-Reply-To: <000000000000105ec205ac489d59@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000994d2a05b6b49959@google.com>
Subject: Re: KASAN: use-after-free Read in service_outstanding_interrupt
From:   syzbot <syzbot+9e04e2df4a32fb661daf@syzkaller.appspotmail.com>
To:     andreyknvl@google.com, gregkh@linuxfoundation.org,
        gustavoars@kernel.org, ingrassia@epigenesys.com,
        lee.jones@linaro.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, oneukum@suse.com,
        penguin-kernel@I-love.SAKURA.ne.jp, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

syzbot has found a reproducer for the following issue on:

HEAD commit:    5e60366d Merge tag 'fallthrough-fixes-clang-5.11-rc1' of g..
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
console output: https://syzkaller.appspot.com/x/log.txt?x=12c5b623500000
kernel config:  https://syzkaller.appspot.com/x/.config?x=5cea7506b7139727
dashboard link: https://syzkaller.appspot.com/bug?extid=9e04e2df4a32fb661daf
compiler:       gcc (GCC) 10.1.0-syz 20200507
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=175adf07500000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1672680f500000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+9e04e2df4a32fb661daf@syzkaller.appspotmail.com

==================================================================
BUG: KASAN: use-after-free in usb_submit_urb+0x1210/0x1560 drivers/usb/core/urb.c:383
Read of size 4 at addr ffff888101d21018 by task syz-executor166/4405

CPU: 0 PID: 4405 Comm: syz-executor166 Not tainted 5.10.0-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
Call Trace:
 __dump_stack lib/dump_stack.c:79 [inline]
 dump_stack+0x107/0x163 lib/dump_stack.c:120
 print_address_description.constprop.0.cold+0xae/0x4c8 mm/kasan/report.c:385
 __kasan_report mm/kasan/report.c:545 [inline]
 kasan_report.cold+0x1f/0x37 mm/kasan/report.c:562
 usb_submit_urb+0x1210/0x1560 drivers/usb/core/urb.c:383
 service_outstanding_interrupt.part.0+0x5f/0xa0 drivers/usb/class/cdc-wdm.c:470
 service_outstanding_interrupt drivers/usb/class/cdc-wdm.c:465 [inline]
 wdm_read+0x9a0/0xbd0 drivers/usb/class/cdc-wdm.c:583
 vfs_read+0x1b5/0x570 fs/read_write.c:494
 ksys_read+0x12d/0x250 fs/read_write.c:634
 do_syscall_64+0x2d/0x40 arch/x86/entry/common.c:46
 entry_SYSCALL_64_after_hwframe+0x44/0xa9
RIP: 0033:0x44b529
Code: e8 bc b4 02 00 48 83 c4 18 c3 0f 1f 80 00 00 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 0f 83 8b cb fb ff c3 66 2e 0f 1f 84 00 00 00 00
RSP: 002b:00007f2dfcb6ed98 EFLAGS: 00000246 ORIG_RAX: 0000000000000000
RAX: ffffffffffffffda RBX: 00000000006dcc38 RCX: 000000000044b529
RDX: 0000000000001000 RSI: 0000000020001000 RDI: 0000000000000004
RBP: 00000000006dcc30 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 00000000006dcc3c
R13: 0142006002090100 R14: 04010040a4157d25 R15: 4000000200000112

Allocated by task 2632:
 kasan_save_stack+0x1b/0x40 mm/kasan/common.c:48
 kasan_set_track mm/kasan/common.c:56 [inline]
 __kasan_kmalloc.constprop.0+0xc2/0xd0 mm/kasan/common.c:461
 kmalloc include/linux/slab.h:552 [inline]
 kzalloc include/linux/slab.h:682 [inline]
 usb_alloc_dev+0x51/0xef0 drivers/usb/core/usb.c:582
 hub_port_connect drivers/usb/core/hub.c:5129 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5363 [inline]
 port_event drivers/usb/core/hub.c:5509 [inline]
 hub_event+0x1def/0x42d0 drivers/usb/core/hub.c:5591
 process_one_work+0x98d/0x15c0 kernel/workqueue.c:2275
 worker_thread+0x64c/0x1120 kernel/workqueue.c:2421
 kthread+0x38c/0x460 kernel/kthread.c:292
 ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:296

Freed by task 2181:
 kasan_save_stack+0x1b/0x40 mm/kasan/common.c:48
 kasan_set_track+0x1c/0x30 mm/kasan/common.c:56
 kasan_set_free_info+0x1b/0x30 mm/kasan/generic.c:352
 __kasan_slab_free+0x102/0x140 mm/kasan/common.c:422
 slab_free_hook mm/slub.c:1544 [inline]
 slab_free_freelist_hook+0x5d/0x150 mm/slub.c:1577
 slab_free mm/slub.c:3140 [inline]
 kfree+0xdb/0x3a0 mm/slub.c:4122
 device_release+0x9f/0x240 drivers/base/core.c:1962
 kobject_cleanup lib/kobject.c:705 [inline]
 kobject_release lib/kobject.c:736 [inline]
 kref_put include/linux/kref.h:65 [inline]
 kobject_put+0x1c8/0x540 lib/kobject.c:753
 put_device+0x1b/0x30 drivers/base/core.c:3190
 hub_port_connect drivers/usb/core/hub.c:5074 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5363 [inline]
 port_event drivers/usb/core/hub.c:5509 [inline]
 hub_event+0x1c8a/0x42d0 drivers/usb/core/hub.c:5591
 process_one_work+0x98d/0x15c0 kernel/workqueue.c:2275
 worker_thread+0x64c/0x1120 kernel/workqueue.c:2421
 kthread+0x38c/0x460 kernel/kthread.c:292
 ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:296

The buggy address belongs to the object at ffff888101d21000
 which belongs to the cache kmalloc-2k of size 2048
The buggy address is located 24 bytes inside of
 2048-byte region [ffff888101d21000, ffff888101d21800)
The buggy address belongs to the page:
page:0000000019761127 refcount:1 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x101d20
head:0000000019761127 order:3 compound_mapcount:0 compound_pincount:0
flags: 0x200000000010200(slab|head)
raw: 0200000000010200 dead000000000100 dead000000000122 ffff888100042000
raw: 0000000000000000 0000000080080008 00000001ffffffff 0000000000000000
page dumped because: kasan: bad access detected

Memory state around the buggy address:
 ffff888101d20f00: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
 ffff888101d20f80: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
>ffff888101d21000: fa fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                            ^
 ffff888101d21080: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff888101d21100: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
==================================================================

