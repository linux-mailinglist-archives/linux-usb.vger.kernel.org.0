Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CCAA62B4C36
	for <lists+linux-usb@lfdr.de>; Mon, 16 Nov 2020 18:10:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732541AbgKPRJ0 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 16 Nov 2020 12:09:26 -0500
Received: from mail-io1-f72.google.com ([209.85.166.72]:56721 "EHLO
        mail-io1-f72.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728047AbgKPRJV (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 16 Nov 2020 12:09:21 -0500
Received: by mail-io1-f72.google.com with SMTP id i9so11134677iom.23
        for <linux-usb@vger.kernel.org>; Mon, 16 Nov 2020 09:09:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=lBJQbOAh6i2WBvCJMXMiPAb3dDWe0Trv0gZBtEfcpmI=;
        b=MJ1dRLGGogYhC2jr3WwGZ2Gp9fALxRGmHeTeA99IkVLcgH4h1IOA+0VVaNzbknQgu2
         H7dxXgoV+pvWeFDgNfnLjoPnnWqRfQPURqGyULmwqF2FTDtf8+CVBpHR5xbKtqH+ibGa
         ntnTIVXRhaF4LpO/k0Tcg5m2Sj1mxDRB9kr1IZSXIiVmSwmHmZ8XXCZTdncb5t9nrc0I
         td+CRcC33uuV/QiM6JgZKEkQHEbulYM/N6Z2GDYlSE45JJuGY2u/J01kof93qR8rpc5A
         yLoxBRxhYqRiKdPSeC7vlu2t4Mn3KGiS5ppSx2KXlE4IH4bBIbpxcCPHaShTmZOPmQs3
         fXUw==
X-Gm-Message-State: AOAM531PYU/XtQS/+1wksR8XNzWg8w8jiLZ9qNMvG8lsviYlT6cIFoAS
        uB+rFEu8B3iHR+7+U61S6/6mEEPwjzNunmj+JPF+JvKJjFT/
X-Google-Smtp-Source: ABdhPJzJv3VV2gbL2bJQ1qM0eBoDDYOB4B9keJ+V59mgVpv1v/RM/C/Bn6TWiWfLb0qxYsF7+xIkUn4COXeO21BGDevfeZq+aFws
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:89:: with SMTP id l9mr6882057ilm.193.1605546559221;
 Mon, 16 Nov 2020 09:09:19 -0800 (PST)
Date:   Mon, 16 Nov 2020 09:09:19 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000055348705b43c701d@google.com>
Subject: KASAN: use-after-free Read in ath9k_hif_usb_rx_cb (2)
From:   syzbot <syzbot+03110230a11411024147@syzkaller.appspotmail.com>
To:     andreyknvl@google.com, ath9k-devel@qca.qualcomm.com,
        davem@davemloft.net, kuba@kernel.org, kvalo@codeaurora.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
        syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,

syzbot found the following issue on:

HEAD commit:    0fb2c41f Merge 5.10-rc4 into here.
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
console output: https://syzkaller.appspot.com/x/log.txt?x=15746da1500000
kernel config:  https://syzkaller.appspot.com/x/.config?x=b99cde3c953e8f6e
dashboard link: https://syzkaller.appspot.com/bug?extid=03110230a11411024147
compiler:       gcc (GCC) 10.1.0-syz 20200507
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=12cc9bba500000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=120b1cc2500000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+03110230a11411024147@syzkaller.appspotmail.com

==================================================================
BUG: KASAN: use-after-free in memcpy include/linux/string.h:399 [inline]
BUG: KASAN: use-after-free in ath9k_hif_usb_rx_stream drivers/net/wireless/ath/ath9k/hif_usb.c:562 [inline]
BUG: KASAN: use-after-free in ath9k_hif_usb_rx_cb+0x3ab/0x1020 drivers/net/wireless/ath/ath9k/hif_usb.c:680
Read of size 49146 at addr ffff888113938000 by task swapper/1/0

CPU: 1 PID: 0 Comm: swapper/1 Not tainted 5.10.0-rc4-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
Call Trace:
 <IRQ>
 __dump_stack lib/dump_stack.c:77 [inline]
 dump_stack+0x107/0x163 lib/dump_stack.c:118
 print_address_description.constprop.0.cold+0xae/0x4c8 mm/kasan/report.c:385
 __kasan_report mm/kasan/report.c:545 [inline]
 kasan_report.cold+0x1f/0x37 mm/kasan/report.c:562
 check_memory_region_inline mm/kasan/generic.c:186 [inline]
 check_memory_region+0x13d/0x180 mm/kasan/generic.c:192
 memcpy+0x20/0x60 mm/kasan/common.c:105
 memcpy include/linux/string.h:399 [inline]
 ath9k_hif_usb_rx_stream drivers/net/wireless/ath/ath9k/hif_usb.c:562 [inline]
 ath9k_hif_usb_rx_cb+0x3ab/0x1020 drivers/net/wireless/ath/ath9k/hif_usb.c:680
 __usb_hcd_giveback_urb+0x2b0/0x5c0 drivers/usb/core/hcd.c:1657
 usb_hcd_giveback_urb+0x367/0x410 drivers/usb/core/hcd.c:1728
 dummy_timer+0x11f4/0x3280 drivers/usb/gadget/udc/dummy_hcd.c:1969
 call_timer_fn+0x1a5/0x630 kernel/time/timer.c:1410
 expire_timers kernel/time/timer.c:1455 [inline]
 __run_timers.part.0+0x67c/0xa10 kernel/time/timer.c:1747
 __run_timers kernel/time/timer.c:1728 [inline]
 run_timer_softirq+0x80/0x120 kernel/time/timer.c:1760
 __do_softirq+0x1b2/0x945 kernel/softirq.c:298
 asm_call_irq_on_stack+0xf/0x20
 </IRQ>
 __run_on_irqstack arch/x86/include/asm/irq_stack.h:26 [inline]
 run_on_irqstack_cond arch/x86/include/asm/irq_stack.h:77 [inline]
 do_softirq_own_stack+0x80/0xa0 arch/x86/kernel/irq_64.c:77
 invoke_softirq kernel/softirq.c:393 [inline]
 __irq_exit_rcu kernel/softirq.c:423 [inline]
 irq_exit_rcu+0x110/0x1a0 kernel/softirq.c:435
 sysvec_apic_timer_interrupt+0x43/0xa0 arch/x86/kernel/apic/apic.c:1091
 asm_sysvec_apic_timer_interrupt+0x12/0x20 arch/x86/include/asm/idtentry.h:631
RIP: 0010:native_save_fl arch/x86/include/asm/irqflags.h:29 [inline]
RIP: 0010:arch_local_save_flags arch/x86/include/asm/irqflags.h:79 [inline]
RIP: 0010:arch_irqs_disabled arch/x86/include/asm/irqflags.h:169 [inline]
RIP: 0010:acpi_safe_halt drivers/acpi/processor_idle.c:112 [inline]
RIP: 0010:acpi_idle_do_entry+0x1c9/0x250 drivers/acpi/processor_idle.c:517
Code: 8d d1 a1 fb 84 db 75 ac e8 34 d9 a1 fb e8 df 7f a7 fb e9 0c 00 00 00 e8 25 d9 a1 fb 0f 00 2d 6e 7b 6a 00 e8 19 d9 a1 fb fb f4 <9c> 5b 81 e3 00 02 00 00 fa 31 ff 48 89 de e8 b4 d1 a1 fb 48 85 db
RSP: 0018:ffffc900000dfd18 EFLAGS: 00000293
RAX: 0000000000000000 RBX: 0000000000000000 RCX: 1ffffffff10796c9
RDX: ffff888100293280 RSI: ffffffff859d0937 RDI: ffffffff859d0921
RBP: ffff8881031b7864 R08: 0000000000000001 R09: 0000000000000001
R10: 0000000000000000 R11: 0000000000000001 R12: 0000000000000001
R13: ffff8881031b7800 R14: ffff8881031b7864 R15: ffff888105aee804
 acpi_idle_enter+0x355/0x4f0 drivers/acpi/processor_idle.c:648
 cpuidle_enter_state+0x1b1/0xc80 drivers/cpuidle/cpuidle.c:237
 cpuidle_enter+0x4a/0xa0 drivers/cpuidle/cpuidle.c:351
 call_cpuidle kernel/sched/idle.c:132 [inline]
 cpuidle_idle_call kernel/sched/idle.c:213 [inline]
 do_idle+0x3d5/0x580 kernel/sched/idle.c:273
 cpu_startup_entry+0x14/0x20 kernel/sched/idle.c:369
 start_secondary+0x265/0x340 arch/x86/kernel/smpboot.c:266
 secondary_startup_64_no_verify+0xb0/0xbb

The buggy address belongs to the page:
page:00000000d417cdb1 refcount:1 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x113938
head:00000000d417cdb1 order:3 compound_mapcount:0 compound_pincount:0
flags: 0x200000000010000(head)
raw: 0200000000010000 dead000000000100 dead000000000122 0000000000000000
raw: 0000000000000000 0000000000000000 00000001ffffffff 0000000000000000
page dumped because: kasan: bad access detected

Memory state around the buggy address:
 ffff88811393ff00: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
 ffff88811393ff80: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>ffff888113940000: fa fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                   ^
 ffff888113940080: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff888113940100: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
==================================================================


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
syzbot can test patches for this issue, for details see:
https://goo.gl/tpsmEJ#testing-patches
