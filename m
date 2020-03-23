Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3BCA618F4CD
	for <lists+linux-usb@lfdr.de>; Mon, 23 Mar 2020 13:40:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728353AbgCWMkR (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 23 Mar 2020 08:40:17 -0400
Received: from mail-il1-f197.google.com ([209.85.166.197]:42978 "EHLO
        mail-il1-f197.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728304AbgCWMkR (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 23 Mar 2020 08:40:17 -0400
Received: by mail-il1-f197.google.com with SMTP id j88so12657368ilg.9
        for <linux-usb@vger.kernel.org>; Mon, 23 Mar 2020 05:40:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=sd5TWIKyh1qqWFF6KwpxYU67VG5X+U6rMqNnTsWSS9Y=;
        b=qly3NcXK4dGfIoaF2FkASc7ieXCQ+KKk2fUHFpXt1c5sl37oX4EA4xuqaxtFRAKeSK
         MmqxWkYRk4z7g+O4Lt3rV+zT33VsKWTQJs70/IxU76GLmC7XwnI7IT1E9vRXgxnlBVLZ
         g/pgCfirI4KklPVxcMzn2/TtJ4zOn8Z5D5H23zr3HWJ14gr8OZgQ2CTXuJKVzqp6ZWr8
         twLsM2p8VvjFNbrvUC70dBvjer0QowZZgXs0mS+iWbXtra74Ru+mdT8jrwHOre52G+Bj
         CAm11jJCLscCxbANvR6PeRdX6zDYLNSrMMpggCC0zSrYGEJdfcTngXZ88vYJLrZ4akkY
         mZjw==
X-Gm-Message-State: ANhLgQ2n0WnWONOYkgW9KO1sgUhXeav9bAyAGWoV0uySR+6PE+A7KxiO
        scQs2BzX4f2qhaiGn8uxXeW7Rr1OVTZWlD/C3WlZFa/iubH2
X-Google-Smtp-Source: ADFU+vvCsSOf70d5/8qdUtRuUFQKnuve4kAAYZvu+ttebpieoKpkKcU3BlgD4DKYP5VV2oGKkFpNExtbaqxAVXhsMvLkUCqFpw6f
MIME-Version: 1.0
X-Received: by 2002:a92:8312:: with SMTP id f18mr20145413ild.98.1584967214867;
 Mon, 23 Mar 2020 05:40:14 -0700 (PDT)
Date:   Mon, 23 Mar 2020 05:40:14 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000d2b60105a184ef30@google.com>
Subject: WARNING: ODEBUG bug in prism2sta_disconnect_usb
From:   syzbot <syzbot+6d2e7f6fa90e27be9d62@syzkaller.appspotmail.com>
To:     andreyknvl@google.com, devel@driverdev.osuosl.org,
        gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, osdevtc@gmail.com,
        syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,

syzbot found the following crash on:

HEAD commit:    e17994d1 usb: core: kcov: collect coverage from usb comple..
git tree:       https://github.com/google/kasan.git usb-fuzzer
console output: https://syzkaller.appspot.com/x/log.txt?x=1129afe3e00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=5d64370c438bc60
dashboard link: https://syzkaller.appspot.com/bug?extid=6d2e7f6fa90e27be9d62
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)

Unfortunately, I don't have any reproducer for this crash yet.

IMPORTANT: if you fix the bug, please add the following tag to the commit:
Reported-by: syzbot+6d2e7f6fa90e27be9d62@syzkaller.appspotmail.com

------------[ cut here ]------------
ODEBUG: free active (active state 0) object type: work_struct hint: hfa384x_usb_defer+0x0/0x430 include/linux/list.h:71
WARNING: CPU: 0 PID: 95 at lib/debugobjects.c:485 debug_print_object+0x160/0x250 lib/debugobjects.c:485
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
RIP: 0010:debug_print_object+0x160/0x250 lib/debugobjects.c:485
Code: dd 20 37 fc 85 48 89 fa 48 c1 ea 03 80 3c 02 00 0f 85 bf 00 00 00 48 8b 14 dd 20 37 fc 85 48 c7 c7 60 2b fc 85 e8 98 0b 29 ff <0f> 0b 83 05 0b 3a fb 05 01 48 83 c4 20 5b 5d 41 5c 41 5d c3 48 89
RSP: 0018:ffff8881d58c76b0 EFLAGS: 00010286
RAX: 0000000000000000 RBX: 0000000000000003 RCX: 0000000000000000
RDX: 0000000000040000 RSI: ffffffff812972fd RDI: ffffed103ab18ec8
RBP: 0000000000000001 R08: ffff8881d58b8000 R09: fffffbfff1266e8f
R10: fffffbfff1266e8e R11: ffffffff89337477 R12: ffffffff870d8b00
R13: ffffffff8119f700 R14: ffff8881d963cd20 R15: ffff8881d35b8e38
 __debug_check_no_obj_freed lib/debugobjects.c:967 [inline]
 debug_check_no_obj_freed+0x2e1/0x445 lib/debugobjects.c:998
 slab_free_hook mm/slub.c:1441 [inline]
 slab_free_freelist_hook mm/slub.c:1477 [inline]
 slab_free mm/slub.c:3024 [inline]
 kfree+0x18a/0x300 mm/slub.c:3976
 prism2sta_disconnect_usb+0x76e/0xc30 drivers/staging/wlan-ng/prism2usb.c:209
 usb_unbind_interface+0x1bd/0x8a0 drivers/usb/core/driver.c:436
 __device_release_driver drivers/base/dd.c:1137 [inline]
 device_release_driver_internal+0x42f/0x500 drivers/base/dd.c:1168
 bus_remove_device+0x2eb/0x5a0 drivers/base/bus.c:533
 device_del+0x481/0xd30 drivers/base/core.c:2677
 usb_disable_device+0x23d/0x790 drivers/usb/core/message.c:1237
 usb_disconnect+0x293/0x900 drivers/usb/core/hub.c:2211
 hub_port_connect drivers/usb/core/hub.c:5046 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5335 [inline]
 port_event drivers/usb/core/hub.c:5481 [inline]
 hub_event+0x1a1d/0x4300 drivers/usb/core/hub.c:5563
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
