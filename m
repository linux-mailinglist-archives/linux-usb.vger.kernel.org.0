Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (unknown [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E0C5B1A5F65
	for <lists+linux-usb@lfdr.de>; Sun, 12 Apr 2020 18:45:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727080AbgDLQpG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 12 Apr 2020 12:45:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.18]:54770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726955AbgDLQpG (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 12 Apr 2020 12:45:06 -0400
X-Greylist: delayed 472 seconds by postgrey-1.27 at vger.kernel.org; Sun, 12 Apr 2020 12:45:05 EDT
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com [209.85.166.197])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09866C0A3BF0
        for <linux-usb@vger.kernel.org>; Sun, 12 Apr 2020 09:37:12 -0700 (PDT)
Received: by mail-il1-f197.google.com with SMTP id a15so8223372ilh.20
        for <linux-usb@vger.kernel.org>; Sun, 12 Apr 2020 09:37:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=iBeLWEg3JewxNPvL/C5sH9BDMOUFqd0KG+vfqhDo/KE=;
        b=AHigjBgN1sWKKeWF9OVCzQG69VS0zoI0kEjieLBbXXdiysBjUt7b7Jru0dpqv5+YaX
         QQkSZlJ9P1sBmWBW+mwU5GtRA1LVVd3S9+qu9dFzNbudhNt5eOKCIMicP0scfOrqDxEU
         VY94eVjnKYuCvxIEJL7FQtI2qpsol4f2atyWoR/1FiermCRoEFFviATx11mAzEQQE/1C
         /rmlXA5sZu01452j/PnHKqbMcNhrnaza4JljCHFJVa/NUWrivToe2Tpg7ztCNdAaS+ir
         /imhn1HdnkFlr0tLmq/MjUmtO9mSCrJk99wMrTwir6n3lnGRwq7HfDtqizh4zFr1W5cf
         D+NA==
X-Gm-Message-State: AGi0PuYhyoCqeJ7yCcDIpDDYWcKzAiAk0ObZGov0rjNmjPAMsnbX1nvh
        9MWugWxm/LhY1QkKU0RPL4zULAXd8piK2fCN2fuAFc7+EtWr
X-Google-Smtp-Source: APiQypJlaIjvzqOz5zaO6UKt6BV3T5zO/Avexeqd5ioU9LZxVj/mXdqPzFZBUS+J6H1sz+48qrMIfHAF5SxqLwNgWCUCUHlFQ9QY
MIME-Version: 1.0
X-Received: by 2002:a92:c011:: with SMTP id q17mr14407906ild.301.1586709431239;
 Sun, 12 Apr 2020 09:37:11 -0700 (PDT)
Date:   Sun, 12 Apr 2020 09:37:11 -0700
In-Reply-To: <000000000000222c4905a2b50102@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000002c98f05a31a949a@google.com>
Subject: Re: KASAN: use-after-free Read in usbhid_close (3)
From:   syzbot <syzbot+7bf5a7b0f0a1f9446f4c@syzkaller.appspotmail.com>
To:     andreyknvl@google.com, gregkh@linuxfoundation.org,
        ingrassia@epigenesys.com, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

syzbot has found a reproducer for the following crash on:

HEAD commit:    0fa84af8 Merge tag 'usb-serial-5.7-rc1' of https://git.ker..
git tree:       https://github.com/google/kasan.git usb-fuzzer
console output: https://syzkaller.appspot.com/x/log.txt?x=14453a8be00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=6b9c154b0c23aecf
dashboard link: https://syzkaller.appspot.com/bug?extid=7bf5a7b0f0a1f9446f4c
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=140c644fe00000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=163fb28be00000

IMPORTANT: if you fix the bug, please add the following tag to the commit:
Reported-by: syzbot+7bf5a7b0f0a1f9446f4c@syzkaller.appspotmail.com

==================================================================
BUG: KASAN: use-after-free in atomic_read include/asm-generic/atomic-instrumented.h:26 [inline]
BUG: KASAN: use-after-free in usb_kill_urb drivers/usb/core/urb.c:696 [inline]
BUG: KASAN: use-after-free in usb_kill_urb+0x24b/0x2c0 drivers/usb/core/urb.c:688
Read of size 4 at addr ffff8881c6d6e210 by task systemd-udevd/1137

CPU: 0 PID: 1137 Comm: systemd-udevd Not tainted 5.6.0-rc7-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
Call Trace:
 __dump_stack lib/dump_stack.c:77 [inline]
 dump_stack+0xef/0x16e lib/dump_stack.c:118
 print_address_description.constprop.0.cold+0xd3/0x314 mm/kasan/report.c:374
 __kasan_report.cold+0x37/0x77 mm/kasan/report.c:506
 kasan_report+0xe/0x20 mm/kasan/common.c:641
 check_memory_region_inline mm/kasan/generic.c:185 [inline]
 check_memory_region+0x152/0x1c0 mm/kasan/generic.c:192
 atomic_read include/asm-generic/atomic-instrumented.h:26 [inline]
 usb_kill_urb drivers/usb/core/urb.c:696 [inline]
 usb_kill_urb+0x24b/0x2c0 drivers/usb/core/urb.c:688
 usbhid_close+0x15c/0x210 drivers/hid/usbhid/hid-core.c:750
 hid_hw_close+0xa8/0xd0 drivers/hid/hid-core.c:2100
 wacom_close+0x66/0x80 drivers/hid/wacom_sys.c:192
 input_close_device+0x110/0x1a0 drivers/input/input.c:682
 evdev_close_device drivers/input/evdev.c:428 [inline]
 evdev_release+0x188/0x1c0 drivers/input/evdev.c:466
 __fput+0x2d7/0x840 fs/file_table.c:280
 task_work_run+0x13f/0x1c0 kernel/task_work.c:113
 tracehook_notify_resume include/linux/tracehook.h:188 [inline]
 exit_to_usermode_loop+0x1d2/0x200 arch/x86/entry/common.c:164
 prepare_exit_to_usermode arch/x86/entry/common.c:195 [inline]
 syscall_return_slowpath arch/x86/entry/common.c:278 [inline]
 do_syscall_64+0x4e0/0x5a0 arch/x86/entry/common.c:304
 entry_SYSCALL_64_after_hwframe+0x49/0xbe
RIP: 0033:0x7fed9d0bf270
Code: 73 01 c3 48 8b 0d 38 7d 20 00 f7 d8 64 89 01 48 83 c8 ff c3 66 0f 1f 44 00 00 83 3d 59 c1 20 00 00 75 10 b8 03 00 00 00 0f 05 <48> 3d 01 f0 ff ff 73 31 c3 48 83 ec 08 e8 ee fb ff ff 48 89 04 24
RSP: 002b:00007fff038ab128 EFLAGS: 00000246 ORIG_RAX: 0000000000000003
RAX: 0000000000000000 RBX: 0000000000000007 RCX: 00007fed9d0bf270
RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000007
RBP: 00007fed9df78710 R08: 0000557eb19b2f3b R09: 0000000000000078
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000016
R13: 0000000000000000 R14: 00007fff038ab1d4 R15: 0000000000000000

Allocated by task 418:
 save_stack+0x1b/0x80 mm/kasan/common.c:72
 set_track mm/kasan/common.c:80 [inline]
 __kasan_kmalloc mm/kasan/common.c:515 [inline]
 __kasan_kmalloc.constprop.0+0xbf/0xd0 mm/kasan/common.c:488
 kmalloc include/linux/slab.h:560 [inline]
 usb_alloc_urb+0x65/0xb0 drivers/usb/core/urb.c:74
 usbhid_start+0xb26/0x22f0 drivers/hid/usbhid/hid-core.c:1121
 hid_hw_start+0x5d/0x130 drivers/hid/hid-core.c:2030
 wacom_parse_and_register+0x28f3/0x5260 drivers/hid/wacom_sys.c:2365
 wacom_probe+0x94d/0xba0 drivers/hid/wacom_sys.c:2748
 hid_device_probe+0x2be/0x3f0 drivers/hid/hid-core.c:2263
 really_probe+0x290/0xac0 drivers/base/dd.c:551
 driver_probe_device+0x223/0x350 drivers/base/dd.c:724
 __device_attach_driver+0x1d1/0x290 drivers/base/dd.c:831
 bus_for_each_drv+0x162/0x1e0 drivers/base/bus.c:431
 __device_attach+0x217/0x390 drivers/base/dd.c:897
 bus_probe_device+0x1e4/0x290 drivers/base/bus.c:491
 device_add+0x1459/0x1bf0 drivers/base/core.c:2500
 hid_add_device drivers/hid/hid-core.c:2419 [inline]
 hid_add_device+0x33c/0x9a0 drivers/hid/hid-core.c:2368
 usbhid_probe+0xa81/0xfa0 drivers/hid/usbhid/hid-core.c:1386
 usb_probe_interface+0x310/0x800 drivers/usb/core/driver.c:374
 really_probe+0x290/0xac0 drivers/base/dd.c:551
 driver_probe_device+0x223/0x350 drivers/base/dd.c:724
 __device_attach_driver+0x1d1/0x290 drivers/base/dd.c:831
 bus_for_each_drv+0x162/0x1e0 drivers/base/bus.c:431
 __device_attach+0x217/0x390 drivers/base/dd.c:897
 bus_probe_device+0x1e4/0x290 drivers/base/bus.c:491
 device_add+0x1459/0x1bf0 drivers/base/core.c:2500
 usb_set_configuration+0xece/0x1840 drivers/usb/core/message.c:2025
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
 process_one_work+0x94b/0x1620 kernel/workqueue.c:2266
 worker_thread+0x96/0xe20 kernel/workqueue.c:2412
 kthread+0x318/0x420 kernel/kthread.c:255
 ret_from_fork+0x24/0x30 arch/x86/entry/entry_64.S:352

Freed by task 95:
 save_stack+0x1b/0x80 mm/kasan/common.c:72
 set_track mm/kasan/common.c:80 [inline]
 kasan_set_free_info mm/kasan/common.c:337 [inline]
 __kasan_slab_free+0x117/0x160 mm/kasan/common.c:476
 slab_free_hook mm/slub.c:1444 [inline]
 slab_free_freelist_hook mm/slub.c:1477 [inline]
 slab_free mm/slub.c:3034 [inline]
 kfree+0xd5/0x300 mm/slub.c:3995
 urb_destroy drivers/usb/core/urb.c:26 [inline]
 kref_put include/linux/kref.h:65 [inline]
 usb_free_urb.part.0+0xaf/0x110 drivers/usb/core/urb.c:96
 usb_free_urb+0x1b/0x30 drivers/usb/core/urb.c:95
 usbhid_stop+0x1d4/0x460 drivers/hid/usbhid/hid-core.c:1217
 wacom_remove+0x88/0x3b0 drivers/hid/wacom_sys.c:2772
 hid_device_remove+0xed/0x240 drivers/hid/hid-core.c:2296
 __device_release_driver drivers/base/dd.c:1135 [inline]
 device_release_driver_internal+0x231/0x500 drivers/base/dd.c:1168
 bus_remove_device+0x2eb/0x5a0 drivers/base/bus.c:533
 device_del+0x481/0xd30 drivers/base/core.c:2677
 hid_remove_device drivers/hid/hid-core.c:2467 [inline]
 hid_destroy_device+0xe1/0x150 drivers/hid/hid-core.c:2486
 usbhid_disconnect+0x9f/0xe0 drivers/hid/usbhid/hid-core.c:1413
 usb_unbind_interface+0x1bd/0x8a0 drivers/usb/core/driver.c:436
 __device_release_driver drivers/base/dd.c:1137 [inline]
 device_release_driver_internal+0x42f/0x500 drivers/base/dd.c:1168
 bus_remove_device+0x2eb/0x5a0 drivers/base/bus.c:533
 device_del+0x481/0xd30 drivers/base/core.c:2677
 usb_disable_device+0x23d/0x790 drivers/usb/core/message.c:1238
 usb_disconnect+0x293/0x900 drivers/usb/core/hub.c:2211
 hub_port_connect drivers/usb/core/hub.c:5046 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5335 [inline]
 port_event drivers/usb/core/hub.c:5481 [inline]
 hub_event+0x1a1d/0x4300 drivers/usb/core/hub.c:5563
 process_one_work+0x94b/0x1620 kernel/workqueue.c:2266
 worker_thread+0x96/0xe20 kernel/workqueue.c:2412
 kthread+0x318/0x420 kernel/kthread.c:255
 ret_from_fork+0x24/0x30 arch/x86/entry/entry_64.S:352

The buggy address belongs to the object at ffff8881c6d6e200
 which belongs to the cache kmalloc-192 of size 192
The buggy address is located 16 bytes inside of
 192-byte region [ffff8881c6d6e200, ffff8881c6d6e2c0)
The buggy address belongs to the page:
page:ffffea00071b5b80 refcount:1 mapcount:0 mapping:ffff8881da002a00 index:0x0
flags: 0x200000000000200(slab)
raw: 0200000000000200 ffffea00071c2e40 0000000500000005 ffff8881da002a00
raw: 0000000000000000 0000000000100010 00000001ffffffff 0000000000000000
page dumped because: kasan: bad access detected

Memory state around the buggy address:
 ffff8881c6d6e100: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff8881c6d6e180: fb fb fb fb fb fb fb fb fc fc fc fc fc fc fc fc
>ffff8881c6d6e200: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                         ^
 ffff8881c6d6e280: fb fb fb fb fb fb fb fb fc fc fc fc fc fc fc fc
 ffff8881c6d6e300: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
==================================================================

