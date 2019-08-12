Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C640789DE5
	for <lists+linux-usb@lfdr.de>; Mon, 12 Aug 2019 14:18:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728455AbfHLMSI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 12 Aug 2019 08:18:08 -0400
Received: from mail-ot1-f72.google.com ([209.85.210.72]:43612 "EHLO
        mail-ot1-f72.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728239AbfHLMSI (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 12 Aug 2019 08:18:08 -0400
Received: by mail-ot1-f72.google.com with SMTP id o1so14356538otp.10
        for <linux-usb@vger.kernel.org>; Mon, 12 Aug 2019 05:18:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=n2GUKNPtpAtxwVyB5n8In8jpX4NTZoKa/5Y4SPkWOjk=;
        b=iNeBF9YEAweYxSJl2HQTHAdhqto/HS5HwJDnTNHSy+OtAPCXeukBJsxgRAhqCLc9Re
         xr7OXafaoHDF5jL18+XQPm9+zm27XPeVce6SXl9RiienC0KF9UcBx8A8NZo0fd5JMWwa
         0VH+UBKxe6WjN3DMuPf3QrzdMW0cdNUBBNHNjiPXoe+1ubltqkLnve6GzjyxnAw7oCuc
         nolgkSXvB4rDs9ILFDXIXFxrP206CCBpKDU38i5TC3Zxc6fhEEEdobIluSQjYfrye7kb
         9b2x6w7AI/v3bFYEglozGRWQx+fzrAmzPkUxhc08bK7glCvCGUNOu4BbiB6yd9vK4rcn
         KBtA==
X-Gm-Message-State: APjAAAWx6AtsWdw2ubJ0qD6oW/e77e8eEe1N23FwBrnKvTia0ZazXbOa
        A6LCL5Dcyita1Kl+8q6Dr1PVvraMgsHANnoswi2rhlHKd5xk
X-Google-Smtp-Source: APXvYqyYvjwT6v+QUNUQUQd5TXb+JIoQBEkj+jjls18nJEVKjnHmYRH/jndWYzbPcAp3X5A2AkU48kvFaCtZI0l9bPWjoaldGfzf
MIME-Version: 1.0
X-Received: by 2002:a05:6602:144:: with SMTP id v4mr33343910iot.202.1565612286894;
 Mon, 12 Aug 2019 05:18:06 -0700 (PDT)
Date:   Mon, 12 Aug 2019 05:18:06 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000376a50058fea84b7@google.com>
Subject: KASAN: use-after-free Write in ld_usb_interrupt_in_callback
From:   syzbot <syzbot+a4b088ebfbadf5f82150@syzkaller.appspotmail.com>
To:     alexandre.belloni@bootlin.com, andreyknvl@google.com,
        enric.balletbo@collabora.com, gregkh@linuxfoundation.org,
        kirr@nexedi.com, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, linux@roeck-us.net, logang@deltatee.com,
        syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,

syzbot found the following crash on:

HEAD commit:    e96407b4 usb-fuzzer: main usb gadget fuzzer driver
git tree:       https://github.com/google/kasan.git usb-fuzzer
console output: https://syzkaller.appspot.com/x/log.txt?x=1327f2ee600000
kernel config:  https://syzkaller.appspot.com/x/.config?x=cfa2c18fb6a8068e
dashboard link: https://syzkaller.appspot.com/bug?extid=a4b088ebfbadf5f82150
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=128acc6a600000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1082c8e2600000

IMPORTANT: if you fix the bug, please add the following tag to the commit:
Reported-by: syzbot+a4b088ebfbadf5f82150@syzkaller.appspotmail.com

==================================================================
BUG: KASAN: use-after-free in ld_usb_interrupt_in_callback+0x40c/0x4c0  
drivers/usb/misc/ldusb.c:276
Write of size 4 at addr ffff8881cdf0b55c by task udevd/238

CPU: 1 PID: 238 Comm: udevd Not tainted 5.3.0-rc2+ #25
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS  
Google 01/01/2011
Call Trace:
  <IRQ>
  __dump_stack lib/dump_stack.c:77 [inline]
  dump_stack+0xca/0x13e lib/dump_stack.c:113
  print_address_description+0x6a/0x32c mm/kasan/report.c:351
  __kasan_report.cold+0x1a/0x33 mm/kasan/report.c:482
  kasan_report+0xe/0x12 mm/kasan/common.c:612
  ld_usb_interrupt_in_callback+0x40c/0x4c0 drivers/usb/misc/ldusb.c:276
  __usb_hcd_giveback_urb+0x1f2/0x470 drivers/usb/core/hcd.c:1757
  usb_hcd_giveback_urb+0x368/0x420 drivers/usb/core/hcd.c:1822
  dummy_timer+0x120f/0x2fa2 drivers/usb/gadget/udc/dummy_hcd.c:1965
  call_timer_fn+0x179/0x650 kernel/time/timer.c:1322
  expire_timers kernel/time/timer.c:1366 [inline]
  __run_timers kernel/time/timer.c:1685 [inline]
  __run_timers kernel/time/timer.c:1653 [inline]
  run_timer_softirq+0x5cc/0x14b0 kernel/time/timer.c:1698
  __do_softirq+0x221/0x912 kernel/softirq.c:292
  invoke_softirq kernel/softirq.c:373 [inline]
  irq_exit+0x178/0x1a0 kernel/softirq.c:413
  exiting_irq arch/x86/include/asm/apic.h:537 [inline]
  smp_apic_timer_interrupt+0x12f/0x500 arch/x86/kernel/apic/apic.c:1095
  apic_timer_interrupt+0xf/0x20 arch/x86/entry/entry_64.S:828
  </IRQ>
RIP: 0010:preempt_count arch/x86/include/asm/preempt.h:26 [inline]
RIP: 0010:check_kcov_mode kernel/kcov.c:140 [inline]
RIP: 0010:__sanitizer_cov_trace_pc+0x9/0x50 kernel/kcov.c:174
Code: 25 8c c4 cf 07 41 bc f4 ff ff ff e8 8a a0 ea ff 48 c7 05 76 c4 cf 07  
00 00 00 00 e9 ee eb ff ff 90 65 48 8b 04 25 00 ef 01 00 <65> 8b 15 e8 ff  
c3 7e 81 e2 00 01 1f 00 48 8b 34 24 75 2b 8b 90 20
RSP: 0018:ffff8881d391fd80 EFLAGS: 00000246 ORIG_RAX: ffffffffffffff13
RAX: ffff8881d38b9800 RBX: dffffc0000000000 RCX: ffffffff815ab382
RDX: 00007fefa32f1000 RSI: 00007fefa32f1000 RDI: 0000000000000006
RBP: ffff8881d3822b20 R08: ffff8881d38b9800 R09: ffffed103a7f68a7
R10: ffffed103a7f68a6 R11: ffff8881d3fb4533 R12: 00007fefa32f1000
R13: 00007fefa32f1000 R14: ffff8881d3822b00 R15: ffff8881d3822b20
  browse_rb mm/mmap.c:346 [inline]
  validate_mm+0x2f0/0x610 mm/mmap.c:418
  remove_vma_list mm/mmap.c:2592 [inline]
  __do_munmap+0x847/0xf90 mm/mmap.c:2833
  __vm_munmap+0xe6/0x170 mm/mmap.c:2853
  __do_sys_munmap mm/mmap.c:2878 [inline]
  __se_sys_munmap mm/mmap.c:2875 [inline]
  __x64_sys_munmap+0x62/0x80 mm/mmap.c:2875
  do_syscall_64+0xb7/0x580 arch/x86/entry/common.c:296
  entry_SYSCALL_64_after_hwframe+0x49/0xbe
RIP: 0033:0x7fefa33ccd37
Code: f0 ff ff 73 01 c3 48 8b 0d fe c0 2a 00 31 d2 48 29 c2 64 89 11 48 83  
c8 ff eb ea 90 90 90 90 90 90 90 90 b8 0b 00 00 00 0f 05 <48> 3d 01 f0 ff  
ff 73 01 c3 48 8b 0d d1 c0 2a 00 31 d2 48 29 c2 64
RSP: 002b:00007ffc17b3cfe8 EFLAGS: 00000206 ORIG_RAX: 000000000000000b
RAX: ffffffffffffffda RBX: 0000000000ffdd10 RCX: 00007fefa33ccd37
RDX: 0000000000000000 RSI: 0000000000001000 RDI: 00007fefa3cc2000
RBP: 0000000000000000 R08: 00007fefa3cbc7a0 R09: 0000000000000000
R10: 5f4344555f425355 R11: 0000000000000206 R12: 0000000000000000
R13: 0000000000ffdd10 R14: 0000000000000006 R15: 0000000000000000

Allocated by task 1757:
  save_stack+0x1b/0x80 mm/kasan/common.c:69
  set_track mm/kasan/common.c:77 [inline]
  __kasan_kmalloc mm/kasan/common.c:487 [inline]
  __kasan_kmalloc.constprop.0+0xbf/0xd0 mm/kasan/common.c:460
  kmalloc include/linux/slab.h:552 [inline]
  kzalloc include/linux/slab.h:748 [inline]
  ld_usb_probe+0x6e/0xa65 drivers/usb/misc/ldusb.c:661
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

Freed by task 1757:
  save_stack+0x1b/0x80 mm/kasan/common.c:69
  set_track mm/kasan/common.c:77 [inline]
  __kasan_slab_free+0x130/0x180 mm/kasan/common.c:449
  slab_free_hook mm/slub.c:1423 [inline]
  slab_free_freelist_hook mm/slub.c:1470 [inline]
  slab_free mm/slub.c:3012 [inline]
  kfree+0xe4/0x2f0 mm/slub.c:3953
  ld_usb_probe+0x728/0xa65 drivers/usb/misc/ldusb.c:744
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

The buggy address belongs to the object at ffff8881cdf0b400
  which belongs to the cache kmalloc-512 of size 512
The buggy address is located 348 bytes inside of
  512-byte region [ffff8881cdf0b400, ffff8881cdf0b600)
The buggy address belongs to the page:
page:ffffea000737c280 refcount:1 mapcount:0 mapping:ffff8881da002500  
index:0x0 compound_mapcount: 0
flags: 0x200000000010200(slab|head)
raw: 0200000000010200 ffffea00072c5400 0000000200000002 ffff8881da002500
raw: 0000000000000000 00000000800c000c 00000001ffffffff 0000000000000000
page dumped because: kasan: bad access detected

Memory state around the buggy address:
  ffff8881cdf0b400: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
  ffff8881cdf0b480: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
> ffff8881cdf0b500: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                                                     ^
  ffff8881cdf0b580: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
  ffff8881cdf0b600: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
==================================================================


---
This bug is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this bug report. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
syzbot can test patches for this bug, for details see:
https://goo.gl/tpsmEJ#testing-patches
