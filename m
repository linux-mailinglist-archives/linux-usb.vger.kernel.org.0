Return-Path: <linux-usb+bounces-31393-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 71E75CB6531
	for <lists+linux-usb@lfdr.de>; Thu, 11 Dec 2025 16:24:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E98763054CBB
	for <lists+linux-usb@lfdr.de>; Thu, 11 Dec 2025 15:20:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0586A2FE06C;
	Thu, 11 Dec 2025 15:20:34 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-oo1-f77.google.com (mail-oo1-f77.google.com [209.85.161.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D47EA2F691F
	for <linux-usb@vger.kernel.org>; Thu, 11 Dec 2025 15:20:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765466433; cv=none; b=GFdm7z3wkW7GSRt/b+yVw84x1r21rCpF2p8tImQtcBCvx6VV327DLFe907mFbIvURsrdOiaD4ApMEkDI6Me+aZxUoYJBXoXk+API9hGLikMx7GG3AT0H3tsz6GJUIQAjttQfT2Q4F9zQa17yhU8VWCHz+wImk4v6oE2TsZs0pUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765466433; c=relaxed/simple;
	bh=9C0D68PO56NPNqxCFFarMujW/8fHyAfd+Wvoe8PX9fo=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=B6UyM+ayIIs1Jvk/JeSf/sdC0h3pp0BP1eXMXDk5M6WeO2cVTuQ4NZ6V3jhUQ+Rhm0KABtt2N5hXvP8d54ZfSaFy0FYmrdWKcrSqay6/ZQVZffVuD22fsT672a4d4TLJ/wcNW0SPm+a3Zv2JjuPZ3V+bpA6MHQKUvthJCiwMWsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f77.google.com with SMTP id 006d021491bc7-657486eb435so261493eaf.1
        for <linux-usb@vger.kernel.org>; Thu, 11 Dec 2025 07:20:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765466431; x=1766071231;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gI3ArBOA4rO1lVvU9b/myLN3uA8j/KCCon2iAVSnaSk=;
        b=tS/35KtAesa0DJc3R0hmlmhZCBr4QcAZOUMN+hF3ECIhRsdgihEmw6zqsfURgfEbll
         Q+FfPy3WNLtQYiBzQmKOYW9AGgTIPO9DsSdlQNq230YlmroKGMaje6M9fS/kpRscuoER
         BtEMNEqcrKcs+Cuu5QH0TGn4s9041C1ArPinFql/51p24QCd+kG7+Xxlej/II9xrIwNp
         H8P29z/hgdyDX2qV4xuu/UbkXn6bqA2owbaok9h5siZxbYnfcY8AnrOouOf45eqaD8Ib
         0e6Zr+hVJeCZ+EFqgL/dtjpLtT2sYDKVrYJ0780jP1XEtxe+QpfMkqRhfWUjJRGhpuIQ
         avlA==
X-Forwarded-Encrypted: i=1; AJvYcCWJ2yuWZU9tYBs/2aH70MmDuY4GwoXNsDzXfFl2kz3i/QxiOrno0je3cNLa8pHM58piiFQ1mzIZueE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyRhxyhOzqXY2VcYHpMK/d5Qg2p5TBYq0qsjgIelgKFE67d34Sq
	IJs0cRy0pcwH/YdIbipIc/X2Hxli9peUo0Xc0hvaSQR/N/+taox1bZWdfIAyTKU//2n1fK36dka
	v+WxUrWoSkjMMulYZoBgUk4hk87ftKXjuCiUaZq5AVA/of/5tgk08f6EPuaY=
X-Google-Smtp-Source: AGHT+IEbPH6U7MZ5OH2iDGUWfWT3Wdf1uwfvTfxgkPs/o7AdBU+PIEY79jFEcBpCzMdlRV3HdtlLhaYXsLH16ApPm1LIfhRIz3xs
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:2008:b0:659:9a49:8f39 with SMTP id
 006d021491bc7-65b2ad9080amr3223934eaf.74.1765466430987; Thu, 11 Dec 2025
 07:20:30 -0800 (PST)
Date: Thu, 11 Dec 2025 07:20:30 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <693ae13e.050a0220.4004e.03b1.GAE@google.com>
Subject: [syzbot] [usb?] BUG: soft lockup in dummy_timer
From: syzbot <syzbot+f5aae8203ffde3c21225@syzkaller.appspotmail.com>
To: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    67a454e6b1c6 Merge tag 'memblock-6.19-rc1' of git://git.ke..
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
console output: https://syzkaller.appspot.com/x/log.txt?x=12a4261a580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=e79f218bc0cd167b
dashboard link: https://syzkaller.appspot.com/bug?extid=f5aae8203ffde3c21225
compiler:       gcc (Debian 12.2.0-14+deb12u1) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/47e59f1d5bc9/disk-67a454e6.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/20fefb1f4bfc/vmlinux-67a454e6.xz
kernel image: https://storage.googleapis.com/syzbot-assets/c641ba5ddee2/bzImage-67a454e6.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+f5aae8203ffde3c21225@syzkaller.appspotmail.com

watchdog: BUG: soft lockup - CPU#1 stuck for 143s! [kworker/1:2:1121]
Modules linked in:
irq event stamp: 11324483
hardirqs last  enabled at (11324482): [<ffffffff87596962>] __raw_spin_unlock_irqrestore include/linux/spinlock_api_smp.h:151 [inline]
hardirqs last  enabled at (11324482): [<ffffffff87596962>] _raw_spin_unlock_irqrestore+0x52/0x80 kernel/locking/spinlock.c:194
hardirqs last disabled at (11324483): [<ffffffff8756bcae>] sysvec_apic_timer_interrupt+0xe/0xb0 arch/x86/kernel/apic/apic.c:1056
softirqs last  enabled at (11324466): [<ffffffff86331c3d>] local_bh_disable include/linux/bottom_half.h:20 [inline]
softirqs last  enabled at (11324466): [<ffffffff86331c3d>] __alloc_skb+0x35d/0x410 net/core/skbuff.c:672
softirqs last disabled at (11324477): [<ffffffff8143b09a>] __do_softirq kernel/softirq.c:656 [inline]
softirqs last disabled at (11324477): [<ffffffff8143b09a>] invoke_softirq kernel/softirq.c:496 [inline]
softirqs last disabled at (11324477): [<ffffffff8143b09a>] __irq_exit_rcu+0xfa/0x160 kernel/softirq.c:723
CPU: 1 UID: 0 PID: 1121 Comm: kworker/1:2 Not tainted syzkaller #0 PREEMPT(voluntary) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 10/25/2025
Workqueue: usb_hub_wq hub_event
RIP: 0010:__raw_spin_unlock_irqrestore include/linux/spinlock_api_smp.h:152 [inline]
RIP: 0010:_raw_spin_unlock_irqrestore+0x31/0x80 kernel/locking/spinlock.c:194
Code: f5 53 48 8b 74 24 10 48 89 fb 48 83 c7 18 e8 c6 4c 02 fa 48 89 df e8 7e 9f 02 fa f7 c5 00 02 00 00 75 23 9c 58 f6 c4 02 75 37 <bf> 01 00 00 00 e8 c5 f2 f5 f9 65 8b 05 de 46 49 05 85 c0 74 16 5b
RSP: 0018:ffffc900001a8bd8 EFLAGS: 00000246
RAX: 0000000000000006 RBX: ffff88810a320000 RCX: 0000000000000002
RDX: 0000000000000000 RSI: ffffffff88d033a4 RDI: ffffffff878a7180
RBP: 0000000000000246 R08: 0000000000000001 R09: 0000000000000001
R10: ffffffff8aa48bd7 R11: ffff88810a319470 R12: ffff888113ded210
R13: dffffc0000000000 R14: 1ffff920000351ad R15: ffff88810a31949b
FS:  0000000000000000(0000) GS:ffff888268cf5000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 000000110c38a5f7 CR3: 00000000090a6000 CR4: 00000000003506f0
Call Trace:
 <IRQ>
 spin_unlock_irqrestore include/linux/spinlock.h:406 [inline]
 dummy_timer+0x1e8b/0x3ad0 drivers/usb/gadget/udc/dummy_hcd.c:2012
 __run_hrtimer kernel/time/hrtimer.c:1777 [inline]
 __hrtimer_run_queues+0x202/0xc40 kernel/time/hrtimer.c:1841
 hrtimer_run_softirq+0x17d/0x350 kernel/time/hrtimer.c:1858
 handle_softirqs+0x208/0x940 kernel/softirq.c:622
 __do_softirq kernel/softirq.c:656 [inline]
 invoke_softirq kernel/softirq.c:496 [inline]
 __irq_exit_rcu+0xfa/0x160 kernel/softirq.c:723
 irq_exit_rcu+0x9/0x30 kernel/softirq.c:739
 instr_sysvec_apic_timer_interrupt arch/x86/kernel/apic/apic.c:1056 [inline]
 sysvec_apic_timer_interrupt+0x90/0xb0 arch/x86/kernel/apic/apic.c:1056
 </IRQ>
 <TASK>
 asm_sysvec_apic_timer_interrupt+0x1a/0x20 arch/x86/include/asm/idtentry.h:697
RIP: 0010:lock_acquire+0x62/0x330 kernel/locking/lockdep.c:5872
Code: f3 46 0b 83 f8 07 0f 87 a2 02 00 00 89 c0 48 0f a3 05 22 cf 48 09 0f 82 74 02 00 00 8b 35 ba db 48 09 85 f6 0f 85 8d 00 00 00 <48> 8b 44 24 30 65 48 2b 05 39 f3 46 0b 0f 85 ad 02 00 00 48 83 c4
RSP: 0018:ffffc90001c3e940 EFLAGS: 00000206
RAX: 0000000000000046 RBX: ffffffff892cd6e0 RCX: 0000000019068315
RDX: 0000000000000000 RSI: ffffffff88ce2895 RDI: ffffffff878a7180
RBP: 0000000000000002 R08: 0000000042f7abfd R09: 00000000d42f7abf
R10: 0000000000000002 R11: ffff88810eb86268 R12: 0000000000000000
R13: 0000000000000000 R14: 0000000000000000 R15: 0000000000000000
 rcu_lock_acquire include/linux/rcupdate.h:331 [inline]
 rcu_read_lock include/linux/rcupdate.h:867 [inline]
 class_rcu_constructor include/linux/rcupdate.h:1195 [inline]
 unwind_next_frame+0xd1/0x20a0 arch/x86/kernel/unwind_orc.c:479
 arch_stack_walk+0x94/0x100 arch/x86/kernel/stacktrace.c:25
 stack_trace_save+0x8e/0xc0 kernel/stacktrace.c:122
 kasan_save_stack+0x33/0x60 mm/kasan/common.c:56
 kasan_save_track+0x14/0x30 mm/kasan/common.c:77
 poison_kmalloc_redzone mm/kasan/common.c:397 [inline]
 __kasan_kmalloc+0x8f/0xa0 mm/kasan/common.c:414
 kasan_kmalloc include/linux/kasan.h:262 [inline]
 __do_kmalloc_node mm/slub.c:5652 [inline]
 __kmalloc_noprof+0x33b/0x8d0 mm/slub.c:5664
 kmalloc_noprof include/linux/slab.h:961 [inline]
 usb_alloc_urb+0x66/0xa0 drivers/usb/core/urb.c:75
 ath6kl_usb_post_recv_transfers.constprop.0+0x84/0x400 drivers/net/wireless/ath/ath6kl/usb.c:432
 ath6kl_usb_start_recv_pipes drivers/net/wireless/ath/ath6kl/usb.c:498 [inline]
 hif_start drivers/net/wireless/ath/ath6kl/usb.c:703 [inline]
 ath6kl_usb_power_on+0x8e/0x160 drivers/net/wireless/ath/ath6kl/usb.c:1062
 ath6kl_hif_power_on drivers/net/wireless/ath/ath6kl/hif-ops.h:136 [inline]
 ath6kl_core_init+0x17e/0x11b0 drivers/net/wireless/ath/ath6kl/core.c:97
 ath6kl_usb_probe+0xcee/0x1440 drivers/net/wireless/ath/ath6kl/usb.c:1168
 usb_probe_interface+0x303/0xa80 drivers/usb/core/driver.c:396
 call_driver_probe drivers/base/dd.c:581 [inline]
 really_probe+0x241/0xb20 drivers/base/dd.c:659
 __driver_probe_device+0x1de/0x470 drivers/base/dd.c:801
 driver_probe_device+0x4c/0x1b0 drivers/base/dd.c:831
 __device_attach_driver+0x1df/0x350 drivers/base/dd.c:959
 bus_for_each_drv+0x159/0x1e0 drivers/base/bus.c:500
 __device_attach+0x1e4/0x4e0 drivers/base/dd.c:1031
 device_initial_probe+0xaa/0xc0 drivers/base/dd.c:1086
 bus_probe_device+0x64/0x150 drivers/base/bus.c:574
 device_add+0x116e/0x1980 drivers/base/core.c:3689
 usb_set_configuration+0x1187/0x1e50 drivers/usb/core/message.c:2210
 usb_generic_driver_probe+0xb1/0x110 drivers/usb/core/generic.c:250
 usb_probe_device+0xef/0x400 drivers/usb/core/driver.c:291
 call_driver_probe drivers/base/dd.c:581 [inline]
 really_probe+0x241/0xb20 drivers/base/dd.c:659
 __driver_probe_device+0x1de/0x470 drivers/base/dd.c:801
 driver_probe_device+0x4c/0x1b0 drivers/base/dd.c:831
 __device_attach_driver+0x1df/0x350 drivers/base/dd.c:959
 bus_for_each_drv+0x159/0x1e0 drivers/base/bus.c:500
 __device_attach+0x1e4/0x4e0 drivers/base/dd.c:1031
 device_initial_probe+0xaa/0xc0 drivers/base/dd.c:1086
 bus_probe_device+0x64/0x150 drivers/base/bus.c:574
 device_add+0x116e/0x1980 drivers/base/core.c:3689
 usb_new_device+0xd07/0x1a90 drivers/usb/core/hub.c:2695
 hub_port_connect drivers/usb/core/hub.c:5567 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5707 [inline]
 port_event drivers/usb/core/hub.c:5871 [inline]
 hub_event+0x31bf/0x5420 drivers/usb/core/hub.c:5953
 process_one_work+0x9ba/0x1b20 kernel/workqueue.c:3257
 process_scheduled_works kernel/workqueue.c:3340 [inline]
 worker_thread+0x6c8/0xf10 kernel/workqueue.c:3421
 kthread+0x3c5/0x780 kernel/kthread.c:463
 ret_from_fork+0x74f/0xa30 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:246
 </TASK>
Sending NMI from CPU 1 to CPUs 0:
NMI backtrace for cpu 0
CPU: 0 UID: 0 PID: 29 Comm: kauditd Not tainted syzkaller #0 PREEMPT(voluntary) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 10/25/2025
RIP: 0010:enqueue_task+0x85/0x270 kernel/sched/core.c:2093
Code: 48 c1 ea 03 80 3c 02 00 0f 85 c1 01 00 00 4c 8b b3 a8 02 00 00 48 b8 00 00 00 00 00 fc ff df 4c 89 f2 48 c1 ea 03 0f b6 04 02 <84> c0 74 08 3c 03 0f 8e 6c 01 00 00 48 b8 00 00 00 00 00 fc ff df
RSP: 0018:ffffc90000007d38 EFLAGS: 00000806
RAX: 0000000000000000 RBX: ffff888110300000 RCX: 0000000000000001
RDX: 1ffffffff11ce839 RSI: ffff888110300000 RDI: ffff8881103002a8
RBP: ffff8881f56390c0 R08: ffff888110300018 R09: 0000000000000000
R10: 0000000000000000 R11: ffff8881022ac528 R12: 0000000000000028
R13: 0000000000000012 R14: ffffffff88e741c8 R15: ffff8881103009c7
FS:  0000000000000000(0000) GS:ffff888268bf5000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007fcb92c57dac CR3: 0000000125042000 CR4: 00000000003506f0
Call Trace:
 <IRQ>
 ttwu_runnable kernel/sched/core.c:3694 [inline]
 try_to_wake_up+0x1107/0x1480 kernel/sched/core.c:4136
 hrtimer_wakeup+0x47/0x60 kernel/time/hrtimer.c:2013
 __run_hrtimer kernel/time/hrtimer.c:1777 [inline]
 __hrtimer_run_queues+0x202/0xc40 kernel/time/hrtimer.c:1841
 hrtimer_interrupt+0x397/0x8e0 kernel/time/hrtimer.c:1903
 local_apic_timer_interrupt arch/x86/kernel/apic/apic.c:1045 [inline]
 __sysvec_apic_timer_interrupt+0x10b/0x3c0 arch/x86/kernel/apic/apic.c:1062
 instr_sysvec_apic_timer_interrupt arch/x86/kernel/apic/apic.c:1056 [inline]
 sysvec_apic_timer_interrupt+0x8b/0xb0 arch/x86/kernel/apic/apic.c:1056
 </IRQ>
 <TASK>
 asm_sysvec_apic_timer_interrupt+0x1a/0x20 arch/x86/include/asm/idtentry.h:697
RIP: 0010:console_trylock_spinning kernel/printk/printk.c:2037 [inline]
RIP: 0010:vprintk_emit+0x556/0x6b0 kernel/printk/printk.c:2425
Code: 00 4d 85 ed 0f 85 19 01 00 00 e8 35 1e 21 00 9c 5d 81 e5 00 02 00 00 31 ff 48 89 ee e8 f3 18 21 00 48 85 ed 0f 85 25 01 00 00 <e8> 15 1e 21 00 45 31 c9 41 b8 01 00 00 00 31 c9 48 8d 05 00 00 00
RSP: 0018:ffffc900001f7b30 EFLAGS: 00000293
RAX: 0000000000000000 RBX: 00000000000000e1 RCX: ffffffff815ed01b
RDX: ffff8881022aba80 RSI: ffffffff815ed025 RDI: 0000000000000007
RBP: 0000000000000000 R08: 0000000000000007 R09: 0000000000000000
R10: 0000000000000000 R11: ffff8881022ac528 R12: 1ffff9200003ef68
R13: 0000000000000200 R14: ffff88810eb857c0 R15: ffffc900001f7bf8
 _printk+0xc7/0x100 kernel/printk/printk.c:2451
 kauditd_printk_skb kernel/audit.c:583 [inline]
 kauditd_hold_skb+0x205/0x250 kernel/audit.c:618
 kauditd_send_queue+0x239/0x290 kernel/audit.c:803
 kauditd_thread+0x693/0xad0 kernel/audit.c:927
 kthread+0x3c5/0x780 kernel/kthread.c:463
 ret_from_fork+0x74f/0xa30 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:246
 </TASK>


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

If the report is already addressed, let syzbot know by replying with:
#syz fix: exact-commit-title

If you want to overwrite report's subsystems, reply with:
#syz set subsystems: new-subsystem
(See the list of subsystem names on the web dashboard)

If the report is a duplicate of another one, reply with:
#syz dup: exact-subject-of-another-report

If you want to undo deduplication, reply with:
#syz undup

