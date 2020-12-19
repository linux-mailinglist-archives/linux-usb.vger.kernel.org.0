Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C05742DF0F8
	for <lists+linux-usb@lfdr.de>; Sat, 19 Dec 2020 19:16:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727392AbgLSSOv (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 19 Dec 2020 13:14:51 -0500
Received: from mail-il1-f198.google.com ([209.85.166.198]:36301 "EHLO
        mail-il1-f198.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727348AbgLSSOv (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 19 Dec 2020 13:14:51 -0500
Received: by mail-il1-f198.google.com with SMTP id z15so5412841ilb.3
        for <linux-usb@vger.kernel.org>; Sat, 19 Dec 2020 10:14:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=XCHs9DzLtVN3G7JxGdTMAu9lfhGd2S5W/XzJE3KmVOc=;
        b=iE+Ncu/oeF+N5DWNZhqOAyNqToloU3XuAZSwXls+vVC1QxIDM4StncJ0c5j1RtZysc
         QbPRYvIziTyYPNxx6LtzbaELx9PjyZ3Llkiq9iXRIJUvTbYeQp9hg9ZtQrBVBkQAGlog
         0qdS8YEgkOCRE8IpINvK4wEP+prdvLHdGy24sKLScbk5A2jGDM7GyJkMBRlKuMTppF8n
         S5aFMWmYl6vmB1tKqEbv1r3mcsC5NU8gvDYATlda1PjWPcXkOVzKuEAstsJ7AhVbKO1k
         T8PpoxVhxVKRs+tOTPWwFTO0scIKm1u0stMYxzyEQ0EkNBVjmTYHr2DIw0ZwHCuo2yya
         ocSw==
X-Gm-Message-State: AOAM531xh5B5uChL75o9D1yI/vvkBlhj7w19kVT/y7TZo5i/h4mr5aGE
        H1BU9Hi/0pmiRaXfZjD9sLplkNwdYW999vHO8ru9Tbw073Fw
X-Google-Smtp-Source: ABdhPJxxQ3e9AR9hTo2g0dF0pMgkZdT3mDlEgGiJQrsVwnpahAM27HhztMy/FpQ8NveZ+5q/vYIAeY+OSdYwMgT5bi6gWQV2n8Jp
MIME-Version: 1.0
X-Received: by 2002:a92:5802:: with SMTP id m2mr9941150ilb.271.1608401650209;
 Sat, 19 Dec 2020 10:14:10 -0800 (PST)
Date:   Sat, 19 Dec 2020 10:14:10 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000000457c305b6d53148@google.com>
Subject: UBSAN: shift-out-of-bounds in mceusb_dev_recv
From:   syzbot <syzbot+ec3b3128c576e109171d@syzkaller.appspotmail.com>
To:     andreyknvl@google.com, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-usb@vger.kernel.org,
        mchehab@kernel.org, sean@mess.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,

syzbot found the following issue on:

HEAD commit:    5e60366d Merge tag 'fallthrough-fixes-clang-5.11-rc1' of g..
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
console output: https://syzkaller.appspot.com/x/log.txt?x=17386d37500000
kernel config:  https://syzkaller.appspot.com/x/.config?x=5cea7506b7139727
dashboard link: https://syzkaller.appspot.com/bug?extid=ec3b3128c576e109171d
compiler:       gcc (GCC) 10.1.0-syz 20200507
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=178e3e0f500000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1029fccb500000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+ec3b3128c576e109171d@syzkaller.appspotmail.com

================================================================================
UBSAN: shift-out-of-bounds in drivers/media/rc/mceusb.c:1173:29
shift exponent 119 is too large for 32-bit type 'int'
CPU: 0 PID: 0 Comm: swapper/0 Not tainted 5.10.0-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
Call Trace:
 <IRQ>
 __dump_stack lib/dump_stack.c:79 [inline]
 dump_stack+0x107/0x163 lib/dump_stack.c:120
 ubsan_epilogue+0xb/0x5a lib/ubsan.c:148
 __ubsan_handle_shift_out_of_bounds.cold+0xb1/0x181 lib/ubsan.c:395
 mceusb_handle_command drivers/media/rc/mceusb.c:1173 [inline]
 mceusb_process_ir_data drivers/media/rc/mceusb.c:1278 [inline]
 mceusb_dev_recv.cold+0x188/0x220 drivers/media/rc/mceusb.c:1376
 __usb_hcd_giveback_urb+0x2b0/0x5c0 drivers/usb/core/hcd.c:1657
 usb_hcd_giveback_urb+0x38c/0x430 drivers/usb/core/hcd.c:1728
 dummy_timer+0x11f4/0x32a0 drivers/usb/gadget/udc/dummy_hcd.c:1971
 call_timer_fn+0x1a5/0x690 kernel/time/timer.c:1417
 expire_timers kernel/time/timer.c:1462 [inline]
 __run_timers.part.0+0x692/0xa50 kernel/time/timer.c:1731
 __run_timers kernel/time/timer.c:1712 [inline]
 run_timer_softirq+0x80/0x120 kernel/time/timer.c:1744
 __do_softirq+0x1b7/0x9c5 kernel/softirq.c:343
 asm_call_irq_on_stack+0xf/0x20
 </IRQ>
 __run_on_irqstack arch/x86/include/asm/irq_stack.h:26 [inline]
 run_on_irqstack_cond arch/x86/include/asm/irq_stack.h:77 [inline]
 do_softirq_own_stack+0x80/0xa0 arch/x86/kernel/irq_64.c:77
 invoke_softirq kernel/softirq.c:226 [inline]
 __irq_exit_rcu+0x119/0x1b0 kernel/softirq.c:420
 irq_exit_rcu+0x5/0x10 kernel/softirq.c:432
 sysvec_apic_timer_interrupt+0x43/0xa0 arch/x86/kernel/apic/apic.c:1096
 asm_sysvec_apic_timer_interrupt+0x12/0x20 arch/x86/include/asm/idtentry.h:628
RIP: 0010:native_save_fl arch/x86/include/asm/irqflags.h:29 [inline]
RIP: 0010:arch_local_save_flags arch/x86/include/asm/irqflags.h:79 [inline]
RIP: 0010:arch_irqs_disabled arch/x86/include/asm/irqflags.h:169 [inline]
RIP: 0010:acpi_safe_halt drivers/acpi/processor_idle.c:111 [inline]
RIP: 0010:acpi_idle_do_entry+0x1c9/0x250 drivers/acpi/processor_idle.c:516
Code: 8d 61 7f fb 84 db 75 ac e8 04 5b 7f fb e8 4f 0f 85 fb e9 0c 00 00 00 e8 f5 5a 7f fb 0f 00 2d ce 86 87 00 e8 e9 5a 7f fb fb f4 <9c> 5b 81 e3 00 02 00 00 fa 31 ff 48 89 de e8 c4 62 7f fb 48 85 db
RSP: 0018:ffffffff87407d60 EFLAGS: 00000293
RAX: 0000000000000000 RBX: 0000000000000000 RCX: 0000000000000000
RDX: ffffffff87431940 RSI: ffffffff85c0eb77 RDI: ffffffff85c0eb61
RBP: ffff888102eb7064 R08: 0000000000000001 R09: 0000000000000001
R10: ffffffff8145fae8 R11: 0000000000000000 R12: 0000000000000001
R13: ffff888102eb7000 R14: ffff888102eb7064 R15: ffff888105c87004
 acpi_idle_enter+0x355/0x4f0 drivers/acpi/processor_idle.c:647
 cpuidle_enter_state+0x1b1/0xc80 drivers/cpuidle/cpuidle.c:237
 cpuidle_enter+0x4a/0xa0 drivers/cpuidle/cpuidle.c:351
 call_cpuidle kernel/sched/idle.c:158 [inline]
 cpuidle_idle_call kernel/sched/idle.c:239 [inline]
 do_idle+0x3df/0x580 kernel/sched/idle.c:299
 cpu_startup_entry+0x14/0x20 kernel/sched/idle.c:396
 start_kernel+0x498/0x4b9 init/main.c:1061
 secondary_startup_64_no_verify+0xb0/0xbb
================================================================================


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
syzbot can test patches for this issue, for details see:
https://goo.gl/tpsmEJ#testing-patches
