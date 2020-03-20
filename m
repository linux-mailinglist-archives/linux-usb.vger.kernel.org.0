Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B07A218D861
	for <lists+linux-usb@lfdr.de>; Fri, 20 Mar 2020 20:28:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726878AbgCTT2N (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 20 Mar 2020 15:28:13 -0400
Received: from mail-il1-f198.google.com ([209.85.166.198]:55313 "EHLO
        mail-il1-f198.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726738AbgCTT2M (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 20 Mar 2020 15:28:12 -0400
Received: by mail-il1-f198.google.com with SMTP id h10so521941ilq.22
        for <linux-usb@vger.kernel.org>; Fri, 20 Mar 2020 12:28:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=IC7SBWtDUx+Hn+x4CPlZ4Ff6cuKczHTmhUcgqcdLfT0=;
        b=HRi6l5t1J/qwJs4AuEoWo8wtMm5jyB5x2gWMCafrHnsWrGvCntItXaaPzIK4QgYQnc
         dYaROhUlQGLeNcY5Y8XEQ3Qc20n9THicoPJA5csOBjTZJEHH6q5GcpnSDL9FyTL1K+0W
         DbZXsqVFApF4Zb8A3vNeDZv0GS7TqYRULvsebpC7iz2/ebPMVzA5zd65PZs6l9Ws7ijp
         RkCdVmryKIWJxhsufLPNpWa1ACq4IhKME7kHZ0trKkak1k+gH6d9rjh9rXAAkYs+vQY2
         Vb6DEfYS9om7MxbS5q8j4cJbEeEWdd3zJffs0l3Z118DlhfmjU4pvuL39Px27H9NZkhb
         mo2A==
X-Gm-Message-State: ANhLgQ24BU4f1CZUcm5subVlBfKV5xrvALbY3YmcXsvzIFEVY+w3RE0q
        +cWHG1sH/3xwsvqKvSnaDiwnRspZFuWySL8oEDrSPHQ/R79J
X-Google-Smtp-Source: ADFU+vshQGpIPe+f5YUqnOztXbmAJK3N0mJriLYFrJwMptjJ/Po7dtedZ9IwVmzwuJzRl1E7QzVb4Ejc/j3MQB83/Gb+q/LeWYg7
MIME-Version: 1.0
X-Received: by 2002:a6b:5406:: with SMTP id i6mr9054995iob.188.1584732491562;
 Fri, 20 Mar 2020 12:28:11 -0700 (PDT)
Date:   Fri, 20 Mar 2020 12:28:11 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000039420505a14e4951@google.com>
Subject: KASAN: slab-out-of-bounds Read in hfa384x_usbin_callback
From:   syzbot <syzbot+7d42d68643a35f71ac8a@syzkaller.appspotmail.com>
To:     andreyknvl@google.com, devel@driverdev.osuosl.org,
        gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, nishkadg.linux@gmail.com,
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
console output: https://syzkaller.appspot.com/x/log.txt?x=11d74573e00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=5d64370c438bc60
dashboard link: https://syzkaller.appspot.com/bug?extid=7d42d68643a35f71ac8a
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=15fa561de00000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=15d74573e00000

IMPORTANT: if you fix the bug, please add the following tag to the commit:
Reported-by: syzbot+7d42d68643a35f71ac8a@syzkaller.appspotmail.com

==================================================================
BUG: KASAN: slab-out-of-bounds in memcpy include/linux/string.h:381 [inline]
BUG: KASAN: slab-out-of-bounds in skb_put_data include/linux/skbuff.h:2284 [inline]
BUG: KASAN: slab-out-of-bounds in hfa384x_int_rxmonitor drivers/staging/wlan-ng/hfa384x_usb.c:3412 [inline]
BUG: KASAN: slab-out-of-bounds in hfa384x_usbin_rx drivers/staging/wlan-ng/hfa384x_usb.c:3312 [inline]
BUG: KASAN: slab-out-of-bounds in hfa384x_usbin_callback+0x1993/0x2360 drivers/staging/wlan-ng/hfa384x_usb.c:3026
Read of size 19671 at addr ffff8881d226413c by task swapper/0/0

CPU: 0 PID: 0 Comm: swapper/0 Not tainted 5.6.0-rc5-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
Call Trace:
 <IRQ>
 __dump_stack lib/dump_stack.c:77 [inline]
 dump_stack+0xef/0x16e lib/dump_stack.c:118
 print_address_description.constprop.0.cold+0xd3/0x314 mm/kasan/report.c:374
 __kasan_report.cold+0x37/0x77 mm/kasan/report.c:506
 kasan_report+0xe/0x20 mm/kasan/common.c:641
 check_memory_region_inline mm/kasan/generic.c:185 [inline]
 check_memory_region+0x152/0x1c0 mm/kasan/generic.c:192
 memcpy+0x20/0x50 mm/kasan/common.c:127
 memcpy include/linux/string.h:381 [inline]
 skb_put_data include/linux/skbuff.h:2284 [inline]
 hfa384x_int_rxmonitor drivers/staging/wlan-ng/hfa384x_usb.c:3412 [inline]
 hfa384x_usbin_rx drivers/staging/wlan-ng/hfa384x_usb.c:3312 [inline]
 hfa384x_usbin_callback+0x1993/0x2360 drivers/staging/wlan-ng/hfa384x_usb.c:3026
 __usb_hcd_giveback_urb+0x29a/0x550 drivers/usb/core/hcd.c:1650
 usb_hcd_giveback_urb+0x368/0x420 drivers/usb/core/hcd.c:1716
 dummy_timer+0x1258/0x32ae drivers/usb/gadget/udc/dummy_hcd.c:1966
 call_timer_fn+0x195/0x6f0 kernel/time/timer.c:1404
 expire_timers kernel/time/timer.c:1449 [inline]
 __run_timers kernel/time/timer.c:1773 [inline]
 __run_timers kernel/time/timer.c:1740 [inline]
 run_timer_softirq+0x5f9/0x1500 kernel/time/timer.c:1786
 __do_softirq+0x21e/0x950 kernel/softirq.c:292
 invoke_softirq kernel/softirq.c:373 [inline]
 irq_exit+0x178/0x1a0 kernel/softirq.c:413
 exiting_irq arch/x86/include/asm/apic.h:546 [inline]
 smp_apic_timer_interrupt+0x141/0x540 arch/x86/kernel/apic/apic.c:1146
 apic_timer_interrupt+0xf/0x20 arch/x86/entry/entry_64.S:829
 </IRQ>
RIP: 0010:default_idle+0x28/0x300 arch/x86/kernel/process.c:696
Code: cc cc 41 56 41 55 65 44 8b 2d 44 77 72 7a 41 54 55 53 0f 1f 44 00 00 e8 b6 62 b5 fb e9 07 00 00 00 0f 00 2d ea 0c 53 00 fb f4 <65> 44 8b 2d 20 77 72 7a 0f 1f 44 00 00 5b 5d 41 5c 41 5d 41 5e c3
RSP: 0018:ffffffff87007d80 EFLAGS: 00000246 ORIG_RAX: ffffffffffffff13
RAX: 0000000000000007 RBX: ffffffff8702cc40 RCX: 0000000000000000
RDX: 0000000000000000 RSI: 0000000000000006 RDI: ffffffff8702d48c
RBP: fffffbfff0e05988 R08: ffffffff8702cc40 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000000 R12: 0000000000000000
R13: 0000000000000000 R14: ffffffff87e607c0 R15: 0000000000000000
 cpuidle_idle_call kernel/sched/idle.c:154 [inline]
 do_idle+0x3e0/0x500 kernel/sched/idle.c:269
 cpu_startup_entry+0x14/0x20 kernel/sched/idle.c:361
 start_kernel+0xe16/0xe5a init/main.c:998
 secondary_startup_64+0xb6/0xc0 arch/x86/kernel/head_64.S:242

The buggy address belongs to the page:
page:ffffea0007489800 refcount:32744 mapcount:0 mapping:0000000000000000 index:0x0 compound_mapcount: 0
flags: 0x200000000010000(head)
raw: 0200000000010000 dead000000000100 dead000000000122 0000000000000000
raw: 0000000000000000 0000000000000000 00007fe8ffffffff 0000000000000000
page dumped because: kasan: bad access detected

Memory state around the buggy address:
 ffff8881d2268000: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
 ffff8881d2268080: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>ffff8881d2268100: fc fc fc fc fc fc fc fc 00 00 00 00 00 00 00 00
                   ^
 ffff8881d2268180: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
 ffff8881d2268200: 00 00 00 00 00 00 00 00 fc fc fc fc fc fc fc fc
==================================================================


---
This bug is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this bug report. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
syzbot can test patches for this bug, for details see:
https://goo.gl/tpsmEJ#testing-patches
