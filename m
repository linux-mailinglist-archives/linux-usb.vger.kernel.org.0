Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6897797941
	for <lists+linux-usb@lfdr.de>; Wed, 21 Aug 2019 14:28:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728120AbfHUM0j (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 21 Aug 2019 08:26:39 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:46336 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727464AbfHUM0h (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 21 Aug 2019 08:26:37 -0400
Received: by mail-pf1-f194.google.com with SMTP id q139so1319331pfc.13
        for <linux-usb@vger.kernel.org>; Wed, 21 Aug 2019 05:26:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mBPrXb3UDdbm3CoEXQdhCYSOHrVU+FZw+SQtuMGxSyU=;
        b=BIk3Z6Zf7fRqULogFt5PPbBoreckgl3MiQE0hOq9wzollLhAk0D6Re3ZqseDBxWW+P
         dVDE4r9DQ9r/VN2dS0XgOShl0O91/z5TnGrH3gc5pIFlASRt4ZFlMMnPAsPoZ3QXDALj
         1yRnbmpGqh7oUKFFI3eTs5PJD7IvQx32g7aW1xo3YQ24+ZtHlsBpxdJJTS3qStZoaiKx
         wh2zv5QbToW6uCtzBLH7cKa1+epmTA1kLRhaEWVBwAH6D01IMJ8tjc5AiTWQr80vq/e5
         HKM5g+75v9usaiAoL1EH4/yKfZgeAihew+lMn6S+nwwRik/WMGgcEt3vFaxAXnYSD8tk
         4TKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mBPrXb3UDdbm3CoEXQdhCYSOHrVU+FZw+SQtuMGxSyU=;
        b=VejaLpilAHksLv+WUo0rOEwsroy8Kv3cAQAXFhLtGRK1cjWgZ6wGzrr8QugE7yVP39
         jqTZ0U5xQtco7soPPOBIyOF58J/oRLFOjlkXs34P4xp51702dAvJ738PwgfkFFxDqY/l
         0cdukRL2JXzURBaXJVu+yov1ma5IODDASDe7Krc/hBRP6mqyGA4K/kduKUh7Wj5bTlzf
         0I1361aLtO2w9/NsPGpCTlToNsnsdgWPU1ca0t7lY44ibvUAlq5NKeu/uP9dEhNBz598
         9cuzMtcydVbNhkeJo8d74sBCS2DLYhS/PpCR0IVnP1rBQ/YkD43bvrUKi0RHRjgz2YFP
         PZ+Q==
X-Gm-Message-State: APjAAAVIk3uxIeQkP1x+KRXxf7yhl47+9T21k1Md6BetuA2kVjXK0M0b
        4rhlEM1LEPY+dXEUwhujXtummVBo34lpqRyxanI6gg==
X-Google-Smtp-Source: APXvYqyGr5pDcaz22D5vkrZtTFIIekaYeeS/A32HvaxHb7oB4GQugKbdc1MsOdxidoCa3trS/VigZeE0WUzzQ21cPvw=
X-Received: by 2002:a17:90a:6581:: with SMTP id k1mr4937424pjj.47.1566390395596;
 Wed, 21 Aug 2019 05:26:35 -0700 (PDT)
MIME-Version: 1.0
References: <000000000000ede4ad058d3ead9e@google.com>
In-Reply-To: <000000000000ede4ad058d3ead9e@google.com>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Wed, 21 Aug 2019 14:26:24 +0200
Message-ID: <CAAeHK+yswWnJeNQYvc=oT6M1LatT6PWxHFWMmftFRVmzF_jmPg@mail.gmail.com>
Subject: Re: KASAN: use-after-free Write in usb_anchor_resume_wakeups
To:     syzbot <syzbot+6c355f8d5f11884fa38e@syzkaller.appspotmail.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        LKML <linux-kernel@vger.kernel.org>,
        USB list <linux-usb@vger.kernel.org>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Jul 9, 2019 at 2:27 PM syzbot
<syzbot+6c355f8d5f11884fa38e@syzkaller.appspotmail.com> wrote:
>
> Hello,
>
> syzbot found the following crash on:
>
> HEAD commit:    7829a896 usb-fuzzer: main usb gadget fuzzer driver
> git tree:       https://github.com/google/kasan.git usb-fuzzer
> console output: https://syzkaller.appspot.com/x/log.txt?x=160b9e93a00000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=f6d4561982f71f63
> dashboard link: https://syzkaller.appspot.com/bug?extid=6c355f8d5f11884fa38e
> compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
>
> Unfortunately, I don't have any reproducer for this crash yet.
>
> IMPORTANT: if you fix the bug, please add the following tag to the commit:
> Reported-by: syzbot+6c355f8d5f11884fa38e@syzkaller.appspotmail.com
>
> dummy_hcd dummy_hcd.4: no ep configured for urb 0000000001b02d23
> xpad 5-1:0.169: xpad_irq_out - usb_submit_urb failed with result -19
> ==================================================================
> BUG: KASAN: use-after-free in register_lock_class+0xeb7/0x1240
> kernel/locking/lockdep.c:1156
> Write of size 8 at addr ffff8881c7e89b78 by task kworker/0:4/2785
>
> CPU: 0 PID: 2785 Comm: kworker/0:4 Not tainted 5.2.0-rc6+ #13
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS
> Google 01/01/2011
> Workqueue: usb_hub_wq hub_event
> Call Trace:
>   <IRQ>
>   __dump_stack lib/dump_stack.c:77 [inline]
>   dump_stack+0xca/0x13e lib/dump_stack.c:113
>   print_address_description+0x67/0x231 mm/kasan/report.c:188
>   __kasan_report.cold+0x1a/0x32 mm/kasan/report.c:317
>   kasan_report+0xe/0x20 mm/kasan/common.c:614
>   register_lock_class+0xeb7/0x1240 kernel/locking/lockdep.c:1156
>   __lock_acquire+0x11d/0x5340 kernel/locking/lockdep.c:3674
>   lock_acquire+0x100/0x2b0 kernel/locking/lockdep.c:4303
>   __raw_spin_lock_irqsave include/linux/spinlock_api_smp.h:110 [inline]
>   _raw_spin_lock_irqsave+0x32/0x50 kernel/locking/spinlock.c:159
>   __wake_up_common_lock+0xb0/0x170 kernel/sched/wait.c:121
>   __usb_unanchor_urb drivers/usb/core/urb.c:154 [inline]
>   usb_anchor_resume_wakeups+0xbe/0xe0 drivers/usb/core/urb.c:148
>   __usb_hcd_giveback_urb+0x1fa/0x470 drivers/usb/core/hcd.c:1760
>   usb_hcd_giveback_urb+0x34a/0x400 drivers/usb/core/hcd.c:1823
>   dummy_timer+0x1022/0x2df4 drivers/usb/gadget/udc/dummy_hcd.c:1965
>   call_timer_fn+0x15e/0x5e0 kernel/time/timer.c:1322
>   expire_timers kernel/time/timer.c:1366 [inline]
>   __run_timers kernel/time/timer.c:1685 [inline]
>   __run_timers kernel/time/timer.c:1653 [inline]
>   run_timer_softirq+0x597/0x1410 kernel/time/timer.c:1698
>   __do_softirq+0x219/0x8b0 kernel/softirq.c:292
>   invoke_softirq kernel/softirq.c:373 [inline]
>   irq_exit+0x17c/0x1a0 kernel/softirq.c:413
>   exiting_irq arch/x86/include/asm/apic.h:536 [inline]
>   smp_apic_timer_interrupt+0xe2/0x480 arch/x86/kernel/apic/apic.c:1068
>   apic_timer_interrupt+0xf/0x20 arch/x86/entry/entry_64.S:806
>   </IRQ>
> RIP: 0010:arch_local_irq_restore arch/x86/include/asm/irqflags.h:85 [inline]
> RIP: 0010:console_unlock+0x9db/0xbf0 kernel/printk/printk.c:2471
> Code: 00 89 ee 48 c7 c7 e0 eb f2 86 e8 50 a4 03 00 65 ff 0d 51 56 da 7e e9
> 11 fa ff ff e8 af 43 15 00 e8 ba 69 1a 00 ff 74 24 30 9d <e9> 31 fe ff ff
> e8 9b 43 15 00 48 8b bc 24 80 00 00 00 c7 05 d9 e6
> RSP: 0018:ffff8881aeeff148 EFLAGS: 00000216 ORIG_RAX: ffffffffffffff13
> RAX: 0000000000000007 RBX: 0000000000000200 RCX: 1ffff11035dc8a24
> RDX: 0000000000000000 RSI: ffff8881aee45100 RDI: ffff8881aee45034
> RBP: 0000000000000000 R08: ffff8881aee44800 R09: 0000000000000000
> R10: 0000000000000000 R11: 0000000000000000 R12: 000000000000004e
> R13: ffffffff828cb580 R14: ffffffff8726a520 R15: dffffc0000000000
>   vprintk_emit+0x171/0x3e0 kernel/printk/printk.c:1986
>   vprintk_func+0x75/0x113 kernel/printk/printk_safe.c:386
>   printk+0xba/0xed kernel/printk/printk.c:2046
>   really_probe.cold+0x69/0x122 drivers/base/dd.c:577
>   driver_probe_device+0x104/0x210 drivers/base/dd.c:670
>   __device_attach_driver+0x1c2/0x220 drivers/base/dd.c:777
>   bus_for_each_drv+0x15c/0x1e0 drivers/base/bus.c:454
>   __device_attach+0x217/0x360 drivers/base/dd.c:843
>   bus_probe_device+0x1e4/0x290 drivers/base/bus.c:514
>   device_add+0xae6/0x16f0 drivers/base/core.c:2111
>   usb_set_configuration+0xdf6/0x1670 drivers/usb/core/message.c:2023
>   generic_probe+0x9d/0xd5 drivers/usb/core/generic.c:210
>   usb_probe_device+0x99/0x100 drivers/usb/core/driver.c:266
>   really_probe+0x281/0x660 drivers/base/dd.c:509
>   driver_probe_device+0x104/0x210 drivers/base/dd.c:670
>   __device_attach_driver+0x1c2/0x220 drivers/base/dd.c:777
>   bus_for_each_drv+0x15c/0x1e0 drivers/base/bus.c:454
>   __device_attach+0x217/0x360 drivers/base/dd.c:843
>   bus_probe_device+0x1e4/0x290 drivers/base/bus.c:514
>   device_add+0xae6/0x16f0 drivers/base/core.c:2111
>   usb_new_device.cold+0x8c1/0x1016 drivers/usb/core/hub.c:2534
>   hub_port_connect drivers/usb/core/hub.c:5089 [inline]
>   hub_port_connect_change drivers/usb/core/hub.c:5204 [inline]
>   port_event drivers/usb/core/hub.c:5350 [inline]
>   hub_event+0x1ada/0x3590 drivers/usb/core/hub.c:5432
>   process_one_work+0x905/0x1570 kernel/workqueue.c:2269
>   worker_thread+0x96/0xe20 kernel/workqueue.c:2415
>   kthread+0x30b/0x410 kernel/kthread.c:255
>   ret_from_fork+0x24/0x30 arch/x86/entry/entry_64.S:352
>
> Allocated by task 2853:
>   save_stack+0x1b/0x80 mm/kasan/common.c:71
>   set_track mm/kasan/common.c:79 [inline]
>   __kasan_kmalloc mm/kasan/common.c:489 [inline]
>   __kasan_kmalloc.constprop.0+0xbf/0xd0 mm/kasan/common.c:462
>   kmalloc include/linux/slab.h:547 [inline]
>   kzalloc include/linux/slab.h:742 [inline]
>   xpad_probe+0x24b/0x1b20 drivers/input/joystick/xpad.c:1717
>   usb_probe_interface+0x305/0x7a0 drivers/usb/core/driver.c:361
>   really_probe+0x281/0x660 drivers/base/dd.c:509
>   driver_probe_device+0x104/0x210 drivers/base/dd.c:670
>   __device_attach_driver+0x1c2/0x220 drivers/base/dd.c:777
>   bus_for_each_drv+0x15c/0x1e0 drivers/base/bus.c:454
>   __device_attach+0x217/0x360 drivers/base/dd.c:843
>   bus_probe_device+0x1e4/0x290 drivers/base/bus.c:514
>   device_add+0xae6/0x16f0 drivers/base/core.c:2111
>   usb_set_configuration+0xdf6/0x1670 drivers/usb/core/message.c:2023
>   generic_probe+0x9d/0xd5 drivers/usb/core/generic.c:210
>   usb_probe_device+0x99/0x100 drivers/usb/core/driver.c:266
>   really_probe+0x281/0x660 drivers/base/dd.c:509
>   driver_probe_device+0x104/0x210 drivers/base/dd.c:670
>   __device_attach_driver+0x1c2/0x220 drivers/base/dd.c:777
>   bus_for_each_drv+0x15c/0x1e0 drivers/base/bus.c:454
>   __device_attach+0x217/0x360 drivers/base/dd.c:843
>   bus_probe_device+0x1e4/0x290 drivers/base/bus.c:514
>   device_add+0xae6/0x16f0 drivers/base/core.c:2111
>   usb_new_device.cold+0x8c1/0x1016 drivers/usb/core/hub.c:2534
>   hub_port_connect drivers/usb/core/hub.c:5089 [inline]
>   hub_port_connect_change drivers/usb/core/hub.c:5204 [inline]
>   port_event drivers/usb/core/hub.c:5350 [inline]
>   hub_event+0x1ada/0x3590 drivers/usb/core/hub.c:5432
>   process_one_work+0x905/0x1570 kernel/workqueue.c:2269
>   process_scheduled_works kernel/workqueue.c:2331 [inline]
>   worker_thread+0x7ab/0xe20 kernel/workqueue.c:2417
>   kthread+0x30b/0x410 kernel/kthread.c:255
>   ret_from_fork+0x24/0x30 arch/x86/entry/entry_64.S:352
>
> Freed by task 107:
>   save_stack+0x1b/0x80 mm/kasan/common.c:71
>   set_track mm/kasan/common.c:79 [inline]
>   __kasan_slab_free+0x130/0x180 mm/kasan/common.c:451
>   slab_free_hook mm/slub.c:1421 [inline]
>   slab_free_freelist_hook mm/slub.c:1448 [inline]
>   slab_free mm/slub.c:2994 [inline]
>   kfree+0xd7/0x280 mm/slub.c:3949
>   xpad_disconnect+0x1cb/0x4a3 drivers/input/joystick/xpad.c:1865
>   usb_unbind_interface+0x1bd/0x8a0 drivers/usb/core/driver.c:423
>   __device_release_driver drivers/base/dd.c:1081 [inline]
>   device_release_driver_internal+0x404/0x4c0 drivers/base/dd.c:1112
>   bus_remove_device+0x2dc/0x4a0 drivers/base/bus.c:556
>   device_del+0x460/0xb80 drivers/base/core.c:2274
>   usb_disable_device+0x211/0x690 drivers/usb/core/message.c:1237
>   usb_disconnect+0x284/0x830 drivers/usb/core/hub.c:2197
>   hub_port_connect drivers/usb/core/hub.c:4940 [inline]
>   hub_port_connect_change drivers/usb/core/hub.c:5204 [inline]
>   port_event drivers/usb/core/hub.c:5350 [inline]
>   hub_event+0x1409/0x3590 drivers/usb/core/hub.c:5432
>   process_one_work+0x905/0x1570 kernel/workqueue.c:2269
>   worker_thread+0x96/0xe20 kernel/workqueue.c:2415
>   kthread+0x30b/0x410 kernel/kthread.c:255
>   ret_from_fork+0x24/0x30 arch/x86/entry/entry_64.S:352
>
> The buggy address belongs to the object at ffff8881c7e89b00
>   which belongs to the cache kmalloc-1k of size 1024
> The buggy address is located 120 bytes inside of
>   1024-byte region [ffff8881c7e89b00, ffff8881c7e89f00)
> The buggy address belongs to the page:
> page:ffffea00071fa200 refcount:1 mapcount:0 mapping:ffff8881dac02a00
> index:0x0 compound_mapcount: 0
> flags: 0x200000000010200(slab|head)
> raw: 0200000000010200 dead000000000100 dead000000000200 ffff8881dac02a00
> raw: 0000000000000000 00000000000e000e 00000001ffffffff 0000000000000000
> page dumped because: kasan: bad access detected
>
> Memory state around the buggy address:
>   ffff8881c7e89a00: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>   ffff8881c7e89a80: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
> > ffff8881c7e89b00: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>                                                                  ^
>   ffff8881c7e89b80: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>   ffff8881c7e89c00: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
> ==================================================================
>
>
> ---
> This bug is generated by a bot. It may contain errors.
> See https://goo.gl/tpsmEJ for more information about syzbot.
> syzbot engineers can be reached at syzkaller@googlegroups.com.
>
> syzbot will keep track of this bug report. See:
> https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

#syz dup: KASAN: use-after-free Read in usb_anchor_resume_wakeups
